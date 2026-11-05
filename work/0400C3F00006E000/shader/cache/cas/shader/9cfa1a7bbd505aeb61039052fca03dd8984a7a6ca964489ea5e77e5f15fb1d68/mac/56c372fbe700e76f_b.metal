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
    float4 m_74 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_100 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_57 [[user(locn13)]];
    float4 m_86 [[user(locn14)]];
    float4 m_92 [[user(locn15)]];
    float4 m_98 [[user(locn16)]];
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3187 = false;
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
        float _3504 = as_type<float>(_145);
        out.gl_Position.z = _3504;
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
        float _3569 = as_type<float>(_175);
        out.gl_Position.z = _3569;
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
    bool _229 = !_213;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_183, _201, _223);
    float _235 = fma(_187, _199, _225);
    bool _237 = !_209;
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
    float _477 = _443 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _491 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _493 = isnan(_471);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _481;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _509 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _511 = isnan(_471);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _527 = 1.0 / _489;
    float _529 = _485 * _503;
    bool _531 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_471);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _507;
    float _545 = -_501;
    float _547 = _545 + 1.0;
    float _549 = fma(_529, _475, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _555 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _557 = isnan(_471);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -_541;
    float _569 = _567 + 1.0;
    float _571 = _541 * _547;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _577 = 1.0 / _553;
    float _579 = -_565;
    float _581 = _579 + 1.0;
    float _583 = _519 * _569;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _585;
    float _589 = _575 * _527;
    float _591 = _501 * _581;
    float _593 = _549 * _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = _471 + _595;
    float _599 = -_519;
    float _601 = _599 + 1.0;
    bool _603 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _605 = isnan(_471);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _587 * _543;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _623 = _471 + _621;
    float _625 = fma(_589, _597, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _627 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[115].x, _593);
    float _629 = -_613;
    float _631 = _629 + 1.0;
    float _633 = _619 * _577;
    float _635 = fma(_615, _623, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _639 = _471 + _637;
    float _641 = fma(_625, _571, _627);
    float _643 = _565 * _631;
    float _645 = fma(_633, _639, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _647 = fma(_635, _591, _641);
    float _649 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_645, _643, _647);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _657 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[119].x, _651);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _661 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _667 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _667;
    out.m_72.y = _669;
    out.m_72.z = _671;
    out.m_72.w = _665;
    out.m_74.x = _661;
    out.m_74.y = _663;
    out.m_74.z = _649;
    out.m_74.w = _673;
    bool _675 = !_525;
    if (!_675)
    {
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _679 = _159 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _179 = _689;
    }
    float _691 = _179;
    float _693 = in.m_46.x;
    float _695 = in.m_46.y;
    float _697 = in.m_46.z;
    float _699 = _159 * 2.0;
    float _701 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _703 = log2(_701);
    float _705 = in.m_55.z;
    float _707 = _341 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _709 = in.m_55.y;
    float _711 = _343 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _713 = floor(_699);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _717 = in.m_64.w;
    float _719 = in.m_68.w;
    float _721 = _703 * _127;
    float _723 = _191 * _695;
    float _725 = _197 * _695;
    float _727 = _203 * _695;
    bool _729 = _713 > 0.0;
    float _731 = fma(_189, _693, _723);
    float _733 = fma(_195, _693, _725);
    float _735 = fma(_201, _693, _727);
    float _737 = _705 * 2.0;
    bool _739 = _713 >= 0.0;
    bool _741 = isnan(_713);
    bool _743 = _739 || _741;
    bool _745 = isnan(0.0);
    bool _747 = _743 || _745;
    float _749 = _709 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _751 = in.m_66.w;
    float _753 = _709 * 2.0;
    float _755 = floor(_737);
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _767 = _765 != 0;
    float _769 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _773 = _747 ? 0 : 1;
    float _775 = fma(_199, _697, _733);
    bool _777 = !_759;
    int _779 = _777 ? 0 : 1;
    float _781 = fma(_749, -2.0, _771);
    float _783 = exp2(_721);
    float _785 = fma(_193, _697, _731);
    float _787 = _709 + _705;
    float _789 = -_715;
    float _791 = fma(_769, 2.0, _789);
    float _793 = fma(_205, _697, _735);
    float _795 = _159 + _709;
    float _797 = _787 + (-1.0);
    bool _799 = !_763;
    int _801 = _799 ? 0 : 1;
    float _803 = floor(_753);
    bool _805 = _755 > 0.0;
    float _807 = -_127;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[76].x, _791);
    bool _811 = _755 >= 0.0;
    bool _813 = isnan(_755);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    float _821 = _785 + _717;
    float _823 = _775 + _751;
    float _825 = _795 + (-1.0);
    float _827 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _829 = int(_827);
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _833 = -_783;
    float _835 = _833 + 1.0;
    bool _837 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _845 = _841 || _843;
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _849 = _823 + _847;
    int _851 = _819 ? 0 : 1;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _855 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _781);
    bool _857 = _803 > 0.0;
    float _859 = _793 + _719;
    bool _861 = _803 >= 0.0;
    bool _863 = isnan(_803);
    bool _865 = _861 || _863;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _873 = _821 + _871;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _877 = int(_875);
    bool _879 = !_767;
    int _881 = _879 ? 0 : 1;
    float _883 = _849 * _849;
    int _885 = ~_851;
    int _887 = _885 + 1;
    int _889 = _887 + 1;
    float _891 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _893 = _845 ? _835 : 0.0;
    float _895 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[78].w, _853);
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _899 = _897 != 0;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _907 = _905 != 0;
    float _909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _911 = _859 + _909;
    int _913 = _889;
    float _915 = _859;
    if (!_805)
    {
        int _917 = ~_851;
        int _919 = _917 + 1;
        _913 = _919;
    }
    int _921 = _913;
    float _923 = fma(_873, _873, _883);
    float _925 = float(_829);
    float _927 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _895);
    bool _929 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _931 = isnan(1.0);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _937 = _933 || _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _941 = 1.0 + _939;
    float _943 = 1.0 / _925;
    bool _945 = !_899;
    int _947 = _945 ? 0 : 1;
    float _949 = fma(_911, _911, _923);
    bool _951 = !_903;
    int _953 = _951 ? 0 : 1;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _957 = float(_877);
    int _959 = abs(_953);
    float _961 = 1.0 / _941;
    float _963 = in.m_76.x;
    float _965 = in.m_76.y;
    float _967 = in.m_76.z;
    float _969 = float(_921);
    float _971 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _955);
    float _973 = _957 * _127;
    int _975 = _869 ? 0 : 1;
    float _977 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _971);
    float _979 = _943 * _127;
    int _981 = abs(_947);
    float _983 = sqrt(_949);
    int _985 = ~_773;
    int _987 = _985 + 1;
    int _989 = _987 + 1;
    float _991 = float(_981);
    int _993 = _989;
    if (_937)
    {
        float _995 = _893 * _961;
        _137 = _995;
    }
    float _997 = _137;
    if (!_729)
    {
        int _999 = ~_773;
        int _1001 = _999 + 1;
        _993 = _1001;
    }
    int _1003 = _993;
    float _1005 = _991 * _969;
    float _1007 = rsqrt(_949);
    float _1009 = float(_1003);
    float _1011 = _1005 * (-2.0);
    float _1013 = float(_959);
    float _1015 = _707 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1017 = ~_975;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    float _1023 = _983 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1025 = fma(_1011, _963, _963);
    float _1027 = _1013 * _1009;
    float _1029 = _159 + (-0.5);
    float _1031 = fma(_891, _1011, _891);
    float _1033 = precise::min(_1015, _1023);
    float _1035 = _1027 * (-2.0);
    float _1037 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1025);
    bool _1039 = !_907;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = _1007 * _1033;
    float _1045 = fma(_831, _1035, _831);
    float _1047 = fma(_1031, _997, _1037);
    float _1049 = fma(_1035, _965, _965);
    float _1051 = _849 * _1043;
    int _1053 = abs(_1041);
    float _1055 = _709 + (-0.5);
    int _1057 = _1021;
    if (!_857)
    {
        int _1059 = ~_975;
        int _1061 = _1059 + 1;
        _1057 = _1061;
    }
    int _1063 = _1057;
    float _1065 = _1047 * 0.15915493667125701904296875;
    float _1067 = _873 * _1043;
    float _1069 = -_1051;
    float _1071 = _849 + _1069;
    float _1073 = float(_1063);
    float _1075 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1049);
    float _1077 = float(_1053);
    float _1079 = -_1067;
    float _1081 = _873 + _1079;
    float _1083 = _1071 * _1071;
    float _1085 = fma(_1045, _997, _1075);
    float _1087 = _159 + _705;
    float _1089 = _1077 * _1073;
    float _1091 = fma(_1081, _1081, _1083);
    float _1093 = _911 * _1043;
    float _1095 = _1087 + (-1.0);
    float _1097 = _1089 * (-2.0);
    float _1099 = -_1093;
    float _1101 = _911 + _1099;
    float _1103 = _705 + (-0.5);
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1107 = fma(_1097, _967, _967);
    float _1109 = fma(_1101, _1101, _1091);
    float _1111 = _1085 * 0.15915493667125701904296875;
    float _1113 = fma(_1105, _1097, _1105);
    float _1115 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1107);
    float _1117 = sqrt(_1109);
    float _1119 = fma(_1113, _997, _1115);
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _1123 = _1119 * 0.15915493667125701904296875;
    float _1125 = _1065 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1111 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    float _1133 = _1007 * _1117;
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _1137 = _711 * _1133;
    float _1139 = _707 * _1133;
    float _1141 = _1111 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1137 * _1121;
    float _1147 = _1065 * 6.283185482025146484375;
    float _1149 = sin(_1147);
    float _1151 = _1127 * _1131;
    float _1153 = _1123 * 6.283185482025146484375;
    float _1155 = cos(_1153);
    float _1157 = _1127 * _1143;
    float _1159 = _1123 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = _1149 * _1131;
    float _1165 = _1149 * _1143;
    float _1167 = _1127 * _1155;
    float _1169 = _1149 * _1155;
    float _1171 = _1143 * _1155;
    float _1173 = _1131 * _1155;
    float _1175 = _1139 * _1135;
    float _1177 = _1167 * _1145;
    float _1179 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1181 = _1179 * 0.5;
    float _1183 = fma(_1161, _1157, _1163);
    float _1185 = -_1165;
    float _1187 = fma(_1161, _1151, _1185);
    float _1189 = -_1145;
    float _1191 = _1161 * _1189;
    float _1193 = -_1151;
    float _1195 = fma(_1161, _1165, _1193);
    float _1197 = fma(_1183, _1175, _1177);
    float _1199 = _1169 * _1145;
    float _1201 = fma(_1171, _1175, _1191);
    float _1203 = fma(_1161, _1163, _1157);
    float _1205 = fma(_1187, _1181, _1197);
    float _1207 = fma(_1195, _1175, _1199);
    float _1209 = fma(_1173, _1181, _1201);
    float _1211 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1213 = fma(_1203, _1181, _1207);
    float _1215 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1217 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1211);
    float _1219 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1215);
    float _1221 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1217);
    float _1223 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1219);
    float _1225 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1227 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1229 = _859 + _1225;
    float _1231 = _821 + _1227;
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1235 = _1229 + _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1239 = _1231 + _1237;
    float _1241 = _1235 * _1235;
    float _1243 = fma(_1239, _1239, _1241);
    float _1245 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1247 = sqrt(_1243);
    float _1249 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1245);
    float _1251 = -_1051;
    float _1253 = _823 + _1251;
    float _1255 = -_1093;
    float _1257 = _859 + _1255;
    float _1259 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1249);
    float _1261 = -_1067;
    float _1263 = _821 + _1261;
    float _1265 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1269 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1265);
    float _1271 = _823 + _1267;
    float _1273 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1269);
    bool _1275 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = _1267;
    float _1279 = _1259;
    float _1281 = _1231;
    if (!_1275)
    {
        _1277 = _1229;
    }
    float _1283 = _1277;
    float _1285 = _1283;
    if (!_1275)
    {
        _1279 = _1271;
    }
    float _1287 = _1279;
    bool _1289 = !_1275;
    float _1291 = _1287;
    if (!_1289)
    {
        float _1293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1297 = _1247 + _1295;
        float _1299 = rsqrt(_1243);
        float _1301 = _1297 * _1293;
        float _1303 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = _1301 * 0.15915493667125701904296875;
        float _1307 = _1305 * 6.283185482025146484375;
        float _1309 = cos(_1307);
        float _1311 = _1305 * 6.283185482025146484375;
        float _1313 = sin(_1311);
        float _1315 = _1309 + (-1.0);
        float _1317 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1319 = fma(_1313, _1303, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1321 = fma(_1271, _1309, _1317);
        float _1323 = _1299 * _1319;
        float _1325 = fma(_1239, _1323, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1327 = fma(_1235, _1323, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1291 = _1321;
        _1281 = _1325;
        _1285 = _1327;
    }
    float _1329 = _1291;
    float _1331 = _1281;
    float _1333 = _1285;
    float _1335 = -_823;
    float _1337 = _1335 + _1329;
    float _1339 = -_821;
    float _1341 = _1339 + _1331;
    float _1343 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1345 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1347 = _1337 * _1337;
    float _1349 = -_859;
    float _1351 = _1349 + _1333;
    float _1353 = 1.0 / _1343;
    float _1355 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1357 = fma(_1341, _1341, _1347);
    float _1359 = -_1067;
    float _1361 = _1359 + _1331;
    float _1363 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1355);
    float _1365 = fma(_1351, _1351, _1357);
    float _1367 = -_1093;
    float _1369 = _1367 + _1333;
    float _1371 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1373 = sqrt(_1365);
    bool _1375 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1377 = isnan(0.5);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1383 = _1379 || _1381;
    float _1385 = _1371 + _1343;
    float _1387 = -_1051;
    float _1389 = _1387 + _1329;
    bool _1391 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1399 = _1395 || _1397;
    float _1401 = _1385 * _1353;
    float _1403 = _1401 * 0.5;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1407 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1405);
    bool _1409 = _1373 > 0.0;
    float _1411 = 1.0 / _1407;
    float _1413 = _1373;
    float _1415 = _1403;
    float _1417 = _1333;
    float _1419 = _1353;
    float _1421 = _1369;
    float _1423 = _1361;
    float _1425 = _1329;
    if (!_1409)
    {
        _1413 = _1361;
    }
    float _1427 = _1413;
    float _1429 = _1427;
    if (!_1409)
    {
        _1415 = _1389;
    }
    float _1431 = _1415;
    float _1433 = _1431;
    if (!_1409)
    {
        _915 = _1369;
    }
    float _1435 = _915;
    bool _1437 = !_1409;
    float _1439 = _1435;
    float _1441 = _1435;
    if (!_1437)
    {
        float _1443 = _235 * _235;
        float _1445 = fma(_227, _227, _1443);
        float _1447 = rsqrt(_1365);
        float _1449 = fma(_241, _241, _1445);
        float _1451 = sqrt(_1449);
        float _1453 = _1341 * _1447;
        float _1455 = _1337 * _1447;
        float _1457 = _1351 * _1447;
        bool _1459 = _1451 > 0.0;
        float _1461 = _1447;
        float _1463 = _1451;
        _1417 = _1453;
        _1419 = _1455;
        if (!_1459)
        {
            _1461 = _1361;
        }
        float _1465 = _1461;
        _1429 = _1465;
        if (!_1459)
        {
            _1463 = _1389;
        }
        float _1467 = _1463;
        _1433 = _1467;
        if (!_1459)
        {
            _1439 = _1369;
        }
        float _1469 = _1439;
        bool _1471 = !_1459;
        _1441 = _1469;
        if (!_1471)
        {
            float _1473 = rsqrt(_1449);
            float _1475 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1477 = _235 * _1473;
            float _1479 = _227 * _1473;
            float _1481 = _1455 * _1477;
            float _1483 = _241 * _1473;
            float _1485 = fma(_1453, _1479, _1481);
            float _1487 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1489 = fma(_1457, _1483, _1485);
            float _1491 = _1489 * _1487;
            float _1493 = fma(_227, _1491, _1361);
            float _1495 = fma(_235, _1491, _1389);
            float _1497 = fma(_241, _1491, _1369);
            _1429 = _1493;
            _1433 = _1495;
            _1441 = _1497;
        }
    }
    float _1499 = _1429;
    float _1501 = _1433;
    float _1503 = _1441;
    float _1505 = _1417;
    float _1507 = _1419;
    float _1509 = _1505;
    float _1511 = _1501;
    float _1513 = _1499;
    float _1515 = _1503;
    float _1517 = _1507;
    if (_1399)
    {
        _1421 = 1.0;
    }
    float _1519 = _1421;
    float _1521 = _1519;
    if (!_1383)
    {
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1525 = _1253 + _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1529 = _1263 + _1527;
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1533 = _1525 * _1525;
        float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1537 = _1257 + _1535;
        float _1539 = fma(_1529, _1529, _1533);
        float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1543 = fma(_1537, _1537, _1539);
        float _1545 = sqrt(_1543);
        float _1547 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = precise::min(_1545, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1551 = _1549 * _1541;
        float _1553 = -_1263;
        float _1555 = _1553 + _1499;
        float _1557 = _1547 * _1551;
        float _1559 = -_1253;
        float _1561 = _1559 + _1501;
        float _1563 = -_1257;
        float _1565 = _1563 + _1503;
        float _1567 = fma(_1555, _1557, _1263);
        float _1569 = fma(_1561, _1557, _1253);
        float _1571 = fma(_1565, _1557, _1257);
        _1509 = _1541;
        _1511 = _1569;
        _1513 = _1567;
        _1515 = _1571;
    }
    float _1573 = _1509;
    float _1575 = _1511;
    float _1577 = _1513;
    float _1579 = _1515;
    float _1581 = _1573;
    if (_1399)
    {
        _1517 = 1.0;
    }
    float _1583 = _1517;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1587 = _1411 * _1585;
    float _1589 = _1583;
    if (!_1399)
    {
        float _1591 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1593 = _1591 * 0.15915493667125701904296875;
        float _1595 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1599 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1597;
        float _1601 = _1593 * 6.283185482025146484375;
        float _1603 = cos(_1601);
        float _1605 = _1595 * 0.15915493667125701904296875;
        float _1607 = _1593 * 6.283185482025146484375;
        float _1609 = sin(_1607);
        float _1611 = 1.0 / _1603;
        float _1613 = _1605 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        float _1617 = _1609 * _1611;
        float _1619 = _1605 * 6.283185482025146484375;
        float _1621 = sin(_1619);
        float _1623 = _1615 * _1617;
        float _1625 = 1.0 / _1599;
        float _1627 = 1.0 / _1623;
        float _1629 = _1621 * _1627;
        float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1633 = fma(_1587, _1629, _1631);
        float _1635 = _1633 * _1625;
        float _1637 = precise::clamp(_1635, 0.0, 1.0);
        _1581 = _1625;
        _1423 = _1593;
        _1425 = _1605;
        _1521 = _1637;
    }
    float _1639 = _1581;
    float _1641 = _1423;
    float _1643 = _1425;
    float _1645 = _1521;
    float _1647 = _1641;
    float _1649 = _1639;
    if (!_1399)
    {
        float _1651 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1653 = _1651 * 0.15915493667125701904296875;
        float _1655 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1657 = _1653 * 6.283185482025146484375;
        float _1659 = cos(_1657);
        float _1661 = _1655 * 0.15915493667125701904296875;
        float _1663 = _1653 * 6.283185482025146484375;
        float _1665 = sin(_1663);
        float _1667 = 1.0 / _1659;
        float _1669 = _1661 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = _1665 * _1667;
        float _1675 = _1661 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        float _1679 = _1671 * _1673;
        float _1681 = 1.0 / _1679;
        float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1685 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1683;
        float _1687 = 1.0 / _1685;
        float _1689 = _1677 * _1681;
        float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1693 = fma(_1587, _1689, _1691);
        float _1695 = _1693 * _1687;
        float _1697 = precise::clamp(_1695, 0.0, 1.0);
        float _1699 = -_1697;
        float _1701 = _1699 + 1.0;
        _1647 = _1679;
        _1649 = _1667;
        _1589 = _1701;
    }
    float _1703 = _1647;
    float _1705 = _1649;
    float _1707 = _1589;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1575 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1715 = _1577 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1719 = _1579 + _1717;
    float _1721 = _1711 * _1711;
    float _1723 = fma(_1715, _1715, _1721);
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1727 = fma(_1719, _1719, _1723);
    float _1729 = rsqrt(_1727);
    float _1731 = sqrt(_1727);
    float _1733 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1735 = _1715 * _1733;
    float _1737 = _1719 * _1733;
    float _1739 = _1735 * _1735;
    float _1741 = _1737 * _1737;
    float _1743 = _1739 + _1741;
    float _1745 = sqrt(_1743);
    bool _1747 = _1745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1751 = _1745 + _1749;
    float _1753 = _1719;
    float _1755 = _1721;
    float _1757 = _1751;
    float _1759 = _1703;
    float _1761 = _1733;
    float _1763 = _1705;
    if (_1747)
    {
        float _1765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1753 = _1765;
    }
    float _1767 = _1753;
    if (_1747)
    {
        float _1769 = rsqrt(_1743);
        _1755 = _1769;
    }
    float _1771 = _1755;
    float _1773 = _1771;
    if (_1747)
    {
        float _1775 = _1751 * _1767;
        _1757 = _1775;
    }
    float _1777 = _1757;
    float _1779 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1747)
    {
        float _1781 = _1777 * 0.15915493667125701904296875;
        _1759 = _1781;
    }
    float _1783 = _1759;
    float _1785 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1779);
    float _1787 = _1767;
    float _1789 = _1783;
    if (_1747)
    {
        float _1791 = _1783 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        _1787 = _1793;
    }
    float _1795 = _1787;
    float _1797 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1799 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1785);
    float _1801 = precise::max(0.0, _1797);
    float _1803 = _1643;
    if (_1747)
    {
        float _1805 = _1783 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        _1803 = _1807;
    }
    float _1809 = _1803;
    float _1811 = _1799 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1813 = -_1733;
    float _1815 = -_1801;
    float _1817 = fma(_1711, _1813, _1815);
    if (_1747)
    {
        float _1819 = _1817 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1761 = _1819;
    }
    float _1821 = _1761;
    float _1823 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1825 = _1795;
    float _1827 = _1821;
    if (_1747)
    {
        float _1829 = fma(_1795, _1821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1763 = _1829;
    }
    float _1831 = _1763;
    float _1833 = _1831;
    if (!_1747)
    {
        _1825 = _1735;
    }
    float _1835 = _1825;
    float _1837 = floor(_1823);
    float _1839 = _1835;
    float _1841 = _1809;
    if (_1747)
    {
        float _1843 = _1809 + (-1.0);
        _1827 = _1843;
    }
    float _1845 = _1827;
    float _1847 = 0.0;
    float _1849 = _1845;
    if (_1747)
    {
        float _1851 = _1771 * _1831;
        _1847 = _1851;
    }
    float _1853 = _1847;
    if (!_1747)
    {
        _1773 = _1817;
    }
    float _1855 = _1773;
    float _1857 = _1855;
    if (_1747)
    {
        float _1859 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1789 = _1859;
    }
    float _1861 = _1789;
    if (_1747)
    {
        float _1863 = _1735 * _1853;
        _1839 = _1863;
    }
    float _1865 = _1839;
    if (!_1747)
    {
        _1849 = _1737;
    }
    float _1867 = _1849;
    float _1869 = _1867;
    if (_1747)
    {
        float _1871 = _1737 * _1853;
        _1869 = _1871;
    }
    float _1873 = _1869;
    if (!_1747)
    {
        _1833 = _1739;
    }
    float _1875 = _1833;
    float _1877 = _1875;
    if (_1747)
    {
        float _1879 = fma(_1817, _1809, _1861);
        _1857 = _1879;
    }
    float _1881 = _1857;
    if (_1747)
    {
        float _1883 = _1865 * _1865;
        _1877 = _1883;
    }
    float _1885 = _1877;
    if (!_1747)
    {
        _1841 = _1741;
    }
    float _1887 = _1841;
    float _1889 = _1887;
    if (_1747)
    {
        float _1891 = _1873 * _1873;
        _1889 = _1891;
    }
    float _1893 = _1889;
    float _1895 = fma(_1881, _1881, _1885);
    float _1897 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1899 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1901 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1903 = _1895 + _1893;
    float _1905 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1907 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1897);
    float _1909 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1899);
    float _1911 = floor(_1901);
    float _1913 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1905);
    float _1915 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1907);
    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1919 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1917);
    float _1921 = precise::clamp(_1919, 0.0, 1.0);
    float _1923 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1909);
    float _1925 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1913);
    float _1927 = _1915 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1929 = -_1921;
    float _1931 = _1929 + 1.0;
    float _1933 = rsqrt(_1903);
    float _1935 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1937 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1939 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1941 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1943 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1939);
    float _1945 = abs(_1931);
    float _1947 = log2(_1945);
    float _1949 = -_1941;
    float _1951 = fma(_1949, _1725, 1.0);
    float _1953 = -_1911;
    float _1955 = _1901 + _1953;
    float _1957 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1943);
    float _1959 = _1933 * _1865;
    float _1961 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1957);
    float _1963 = _1933 * _1881;
    float _1965 = _1933 * _1873;
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1969 = -_1837;
    float _1971 = _1823 + _1969;
    float _1973 = log2(_1951);
    float _1975 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1977 = -_1967;
    float _1979 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1977);
    float _1981 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1983 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1975);
    float _1985 = -_1965;
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1979);
    float _1989 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1991 = 1.0 / _1961;
    float _1993 = _1963 + 1.0;
    float _1995 = fma(_1987, -0.5, 0.5);
    float _1997 = fma(_1987, 0.5, 0.5);
    float _1999 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1989);
    float _2001 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1983);
    float _2003 = fma(_1997, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2005 = exp2(_1981);
    float _2007 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1999);
    float _2009 = _1973 * 0.693147182464599609375;
    float _2011 = fma(_1997, _2003, -0.212114393711090087890625);
    float _2013 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2015 = fma(_1997, _2011, 1.570728778839111328125);
    float _2017 = sqrt(_1995);
    float _2019 = -_1963;
    float _2021 = fma(_2005, _1993, _2019);
    float _2023 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2001);
    float _2025 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2007);
    float _2027 = fma(_2021, 0.5, 0.5);
    float _2029 = _2023 * _1991;
    float _2031 = _2025 * _1991;
    float _2033 = _2017 * 0.636619746685028076171875;
    float _2035 = fma(_2029, 0.5, 0.5);
    float _2037 = fma(_2031, -0.5, 0.5);
    float _2039 = -_2015;
    float _2041 = fma(_2033, _2039, 1.0);
    float2 _6449 = float2(_1971, _1955);
    float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6449, float2(0.0), isnan(_6449)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6449, float2(0.0), isnan(_6449)), level(0.0)).x;
    float3 _6460 = float3(_2035, _2037, _2013);
    float _2045 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6460, float3(0.0), isnan(_6460)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6460, float3(0.0), isnan(_6460)), level(0.0)).x;
    float3 _6471 = float3(_2035, _2037, _2013);
    float4 _2048 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6471, float3(0.0), isnan(_6471)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6471, float3(0.0), isnan(_6471)), level(0.0)).xyzw;
    float _2050 = _2048.x;
    float _2052 = _2048.y;
    float _2054 = _2048.z;
    float _2056 = _2048.w;
    float2 _6487 = float2(_2041, _2027);
    float3 _2060 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6487, float2(0.0), isnan(_6487)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6487, float2(0.0), isnan(_6487)), level(0.0)).xyz;
    float _2062 = _2060.x;
    float _2064 = _2060.y;
    float _2066 = _2060.z;
    float _2068 = float(uint(_877));
    float _2070 = trunc(_979);
    int _2072 = int(_2070);
    int _2074 = ~_877;
    int _2076 = _2074 + 1;
    float _2078 = -_977;
    float _2080 = _2078 + 1.0;
    int _2082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2084 = _2082 != 0;
    float _2086 = _973 * _169;
    int _2088 = ~_877;
    int _2090 = _2088 + 1;
    float _2092 = -_927;
    float _2094 = _2092 + 1.0;
    bool _2096 = _159 > 0.5;
    float _2098 = 1.0 / _2068;
    out.m_78.x = _1263;
    out.m_78.y = _1253;
    out.m_78.z = _1257;
    bool _2100 = _709 > 0.5;
    float _2102 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2106 = _2104 != 0;
    out.m_80.w = _1033;
    int _2108 = abs(_801);
    float _2110 = trunc(_2086);
    int _2112 = int(_2110);
    float _2114 = float(uint(_2072));
    out.m_82.x = _1139;
    float _2116 = float(_2072);
    int _2118 = abs(_779);
    float _2120 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2122 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2124 = isnan(_691);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2130 = _2126 || _2128;
    float _2132 = float(_2130);
    float _2134 = exp2(_2102);
    int _2136 = as_type<int>(_2098) + (-2);
    out.m_84.x = _1577;
    out.m_84.y = _1575;
    out.m_84.z = _1579;
    float _2138 = -_2132;
    float _2140 = _2138 + 1.0;
    float _2142 = as_type<float>(_2136) * _2114;
    int _2144 = ~_877;
    int _2146 = _2144 + 1;
    float _2148 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2150 = _2148 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2152 = trunc(_2142);
    float _2154 = precise::max(_2152, 0.0);
    uint _2157 = uint(_2154);
    float _2159 = -_2134;
    float _2161 = _2159 + 1.0;
    float _2163 = 1.0 / _2150;
    int _2165 = _2090 * int(_2157);
    int _2167 = _2165 + _2072;
    float _2169 = float(uint(_2167));
    float _2171 = as_type<float>(_2136) * _2169;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2175 = _2173 != 0;
    float _2177 = trunc(_2171);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    bool _2183 = !_2175;
    float _2185 = _2183 ? 7.345489978790283203125 : 1.0;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2191 = _2185 * _159;
    bool _2193 = _2116 >= _957;
    bool _2195 = isnan(_2116);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan(_957);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = floor(_2191);
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2209 = _2207 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2211 = int(_2157) + int(_2181);
    float _2213 = trunc(_2203);
    int _2215 = int(_2213);
    int _2217 = _2076 * _2211;
    int _2219 = _2217 + _2072;
    bool _2221 = uint(_2219) >= uint(_877);
    float _2223 = -_2205;
    float _2225 = _2191 + _2223;
    float _2227 = 1.0 / _2189;
    bool _2229 = !_2221;
    int _2231 = _2229 ? 0 : (-1);
    float _2233 = _2225 * _957;
    bool _2235 = _877 == 0;
    float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2239 = _2237 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2241 = ~_2211;
    int _2243 = _2241 + _2231;
    int _2245 = _2243 + 1;
    float _2247 = 1.0 / _2209;
    int _2249 = _877 * _2245;
    int _2251 = _2249 + _2072;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2255 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2253;
    float _2257 = trunc(_2233);
    int _2259 = int(_2257);
    int _2261 = ~_2215;
    int _2263 = _2261 + 1;
    int _2265 = _2263 + 1;
    float _2267 = _2255 * _2227;
    bool _2269 = !_2235;
    int _2271 = _2269 ? _2251 : (-1);
    float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2277 = !_2106;
    int _2279 = _2277 ? 0 : 1;
    int _2281 = _2271 * _2265;
    int _2283 = _877 + (-1);
    float _2285 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2289 = abs(_2279);
    float _2291 = 1.0 / _2275;
    float _2293 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2295 = _2293 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2297 = _2215 * _2283;
    int _2299 = _2297 + _2281;
    float _2301 = _2287 * _2247;
    int _2303 = abs(_881);
    float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2307 = _691 + _2305;
    int _2309 = _2299 * _2108;
    float _2311 = fma(_2267, _2307, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2313 = _2259 * _2289;
    int _2315 = _2313 + _2072;
    int _2317 = _2112 * _2118;
    int _2319 = _2317 + _2309;
    bool _2321 = !_2084;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = 1.0 / _2239;
    bool _2327 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2329 = isnan(_691);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2335 = _2331 || _2333;
    float _2337 = float(_2335);
    int _2339 = _2315 * _2303;
    int _2341 = _2339 + _2319;
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2343;
    bool _2347 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2349 = isnan(_691);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2355 = _2351 || _2353;
    float _2357 = float(_2355);
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2363 = abs(_2323);
    float _2365 = _2345 * _2291;
    bool _2367 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2369 = isnan(_691);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2375 = _2371 || _2373;
    float _2377 = float(_2375);
    float _2379 = -_2357;
    float _2381 = _2379 + 1.0;
    bool _2383 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2385 = isnan(_691);
    bool _2387 = _2383 || _2385;
    bool _2389 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2391 = _2387 || _2389;
    float _2393 = float(_2391);
    float _2395 = 1.0 / _2295;
    float _2397 = _2337 * _2381;
    float _2399 = -_2337;
    float _2401 = _2399 + 1.0;
    float _2403 = -_2377;
    float _2405 = _2403 + 1.0;
    float _2407 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2409 = _2407 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2411 = _2377 * _2401;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2415 = _2413 != 0;
    int _2417 = _2259 * _2363;
    int _2419 = _2417 + _2341;
    bool _2421 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2423 = isnan(_691);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2429 = _2425 || _2427;
    float _2431 = float(_2429);
    float _2433 = _2393 * _2405;
    float _2435 = -_2393;
    float _2437 = _2435 + 1.0;
    bool _2439 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2441 = isnan(_691);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2447 = _2443 || _2445;
    float _2449 = float(_2447);
    float _2451 = 1.0 / _2409;
    float _2453 = float(uint(_2419));
    float _2455 = _2431 * _2437;
    float _2457 = -_2431;
    float _2459 = _2457 + 1.0;
    int _2461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2463 = _2461 != 0;
    float _2465 = as_type<float>(_2136) * _2453;
    float _2467 = _2449 * _2459;
    float _2469 = -_2449;
    float _2471 = _2469 + 1.0;
    bool _2473 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2475 = isnan(_691);
    bool _2477 = _2473 || _2475;
    bool _2479 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2481 = _2477 || _2479;
    float _2483 = float(_2481);
    float _2485 = trunc(_2465);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = _2132 * _2471;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2493;
    float _2497 = _2483 * _2140;
    float _2499 = -_2483;
    float _2501 = _2499 + 1.0;
    float _2503 = _2361 * _2451;
    float _2505 = _2495 * _2325;
    float _2507 = _2311 * _2497;
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2511 = _2509 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2513 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2515 = _691 + _2513;
    float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2517;
    float _2521 = fma(_2301, _2515, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2523 = _2146 * int(_2489);
    int _2525 = _2523 + _2419;
    float _2527 = _2511 * _2395;
    float _2529 = _2519 * _2163;
    float _2531 = fma(_2501, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2507);
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2535 = _691 + _2533;
    float _2537 = float(uint(_2525));
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2541 = _691 + _2539;
    float _2543 = fma(_2521, _2491, _2531);
    float _2545 = fma(_2365, _2535, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2549 = _691 + _2547;
    float _2551 = as_type<float>(_2136) * _2537;
    float _2553 = float(uint(_2315));
    float _2555 = fma(_2503, _2541, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2559 = _691 + _2557;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2563 = _691 + _2561;
    float _2565 = fma(_2505, _2549, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2567 = trunc(_2551);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    float _2573 = as_type<float>(_2136) * _2553;
    float _2575 = fma(_2527, _2559, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2577 = -_231;
    int _2579 = _2100 ? as_type<int>(_2577) : as_type<int>(_231);
    float _2581 = fma(_2545, _2467, _2543);
    int _2583 = ~_877;
    int _2585 = _2583 + 1;
    float _2587 = fma(_2529, _2563, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2589 = ~_877;
    int _2591 = _2589 + 1;
    float _2593 = trunc(_2573);
    float _2595 = precise::max(_2593, 0.0);
    uint _2597 = uint(_2595);
    float _2599 = fma(_2555, _2455, _2581);
    float _2601 = -_239;
    int _2603 = _2096 ? as_type<int>(_2601) : as_type<int>(_239);
    float _2605 = fma(_2565, _2433, _2599);
    int _2607 = int(_2489) + int(_2571);
    float _2609 = fma(_2575, _2411, _2605);
    bool _2611 = !_2415;
    float _2613 = _2611 ? _231 : as_type<float>(_2579);
    float _2615 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2617 = fma(_2587, _2397, _2609);
    bool _2619 = !_2463;
    float _2621 = _2619 ? _239 : as_type<float>(_2603);
    int _2623 = _2591 * int(_2597);
    int _2625 = _2623 + _2315;
    float _2627 = _2613 + (-0.5);
    int _2629 = _2585 * _2607;
    int _2631 = _2629 + _2419;
    float _2633 = _2621 + 0.5;
    float _2635 = fma(_2357, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2617);
    float _2637 = float(uint(_2625));
    float _2639 = -_2627;
    float _2641 = -_855;
    float _2643 = fma(_2639, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2641);
    bool _2645 = uint(_2631) >= uint(_877);
    float _2647 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[80].x, _809);
    int _2649 = ~_877;
    int _2651 = _2649 + 1;
    float _2653 = as_type<float>(_2136) * _2637;
    bool _2655 = !_2645;
    int _2657 = _2655 ? 0 : (-1);
    float _2659 = -_2080;
    float _2661 = fma(_2621, _2659, _2647);
    int _2663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2665 = _2663 != 0;
    float _2667 = trunc(_2653);
    float _2669 = precise::max(_2667, 0.0);
    uint _2671 = uint(_2669);
    int _2673 = ~_2607;
    int _2675 = _2673 + _2657;
    int _2677 = _2675 + 1;
    float _2679 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2681 = fma(_2613, _2094, _2643);
    float _2683 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_86.x = _2635;
    int _2685 = _877 * _2677;
    int _2687 = _2685 + _2419;
    float _2689 = -_1161;
    float _2691 = fma(_2689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2679);
    out.m_88.x = _2661;
    out.m_88.y = _2681;
    bool _2693 = !_2235;
    int _2695 = _2693 ? _2687 : (-1);
    int _2697 = _2695 >> 31;
    int _2699 = int(_2597) + int(_2671);
    int _2701 = _2697 & 3;
    float _2703 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2120);
    float _2705 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2707 = _2695 + _2701;
    float _2709 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2711 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2713 = _2651 * _2699;
    int _2715 = _2713 + _2315;
    int _2717 = _2707 >> 2;
    float _2719 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2691);
    float _2721 = -_1161;
    float _2723 = fma(_2721, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2705);
    float _2725 = -_1161;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2709);
    int _2729 = _2717 << 4;
    int _2731 = _2729 + 368;
    float _2733 = _2615 * _2719;
    float _2735 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2723);
    float _2737 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2727);
    uint _2739 = uint(int(uint(_2731) >> uint(2)));
    uint _2741 = uint(int(uint(int(_2739)) >> uint(2)));
    int _2743 = int(_2739) & 3;
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[int(_2741)][_2743];
    int _2747 = int(_2739) + 1;
    uint _2749 = uint(int(uint(_2747) >> uint(2)));
    int _2751 = _2747 & 3;
    float _2753 = (*spvDescriptorSet0.vp_c9)._m0[int(_2749)][_2751];
    bool _2755 = uint(_2715) >= uint(_877);
    float _2757 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2711);
    float _2759 = _2615 * _2735;
    float _2761 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2763 = _2615 * _2737;
    int _2765 = _2695 & 3;
    bool _2767 = _2765 != 0;
    float _2769 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2703);
    int _2771 = _2731 + 8;
    uint _2773 = uint(int(uint(_2771) >> uint(2)));
    uint _2775 = uint(int(uint(int(_2773)) >> uint(2)));
    int _2777 = int(_2773) & 3;
    float _2779 = (*spvDescriptorSet0.vp_c9)._m0[int(_2775)][_2777];
    int _2781 = int(_2773) + 1;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    int _2785 = _2781 & 3;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[int(_2783)][_2785];
    float _2789 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2761);
    bool _2791 = uint(_2765) > 1u;
    float _2793 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2683);
    int _2795 = _2695 & 3;
    bool _2797 = _2795 != 0;
    float _2799 = abs(_1587);
    float _2801 = log2(_2799);
    float _2803 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2805 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2807 = _2797 ? 0 : 1;
    float _2809 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2757);
    float _2811 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2813 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2789);
    int _2815 = ~_2807;
    int _2817 = _2815 + 1;
    int _2819 = _2817 + 1;
    float _2821 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2803);
    bool _2823 = !_2755;
    int _2825 = _2823 ? 0 : (-1);
    float _2827 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2805);
    int _2829 = _2819;
    float _2831 = _2025;
    if (!_2791)
    {
        int _2833 = ~_2807;
        int _2835 = _2833 + 1;
        _2829 = _2835;
    }
    int _2837 = _2829;
    float _2839 = fma(_2811, _2769, _2759);
    bool _2841 = _2765 != 3;
    float _2843 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2793);
    int _2845 = abs(_2837);
    float _2847 = _2801 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2849 = ~_2699;
    int _2851 = _2849 + _2825;
    int _2853 = _2851 + 1;
    float _2855 = fma(_2811, _2809, _2733);
    bool _2857 = uint(_2765) >= 2u;
    float _2859 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2821);
    float _2861 = exp2(_2847);
    int _2863 = _2857 ? 0 : 1;
    int _2865 = _877 * _2853;
    int _2867 = _2865 + _2315;
    int _2869 = ~_2845;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    float _2875 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2827);
    bool _2877 = !_2767;
    int _2879 = _2877 ? 0 : 1;
    float _2881 = -_2043;
    float _2883 = _2881 + 1.0;
    int _2885 = ~_2863;
    int _2887 = _2885 + 1;
    int _2889 = _2887 + 1;
    bool _2891 = _2765 != 3;
    int _2893 = _2889;
    float _2895 = _2050;
    float _2897 = _2859;
    if (_2841)
    {
        int _2899 = ~_2863;
        int _2901 = _2899 + 1;
        _2893 = _2901;
    }
    int _2903 = _2893;
    int _2905 = abs(_2879);
    int _2907 = _2873 * as_type<int>(_2753);
    bool _2909 = !_2891;
    int _2911 = _2909 ? 0 : (-1);
    int _2913 = abs(_2903);
    int _2915 = ~_2905;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    bool _2921 = !_2665;
    int _2923 = _2921 ? 0 : 1;
    int _2925 = _2919 * as_type<int>(_2745);
    int _2927 = _2925 + _2907;
    int _2929 = abs(_2911);
    float _2931 = fma(_2861, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2933 = precise::clamp(_2931, 0.0, 1.0);
    int _2935 = abs(_2923);
    int _2937 = ~_2913;
    int _2939 = _2937 + 1;
    int _2941 = _2939 + 1;
    float _2943 = fma(_2933, -2.0, 3.0);
    float _2945 = _2933 * _2933;
    int _2947 = ~_2929;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    int _2953 = _2941 * as_type<int>(_2779);
    int _2955 = _2953 + _2927;
    int _2957 = ~_2935;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    float _2963 = _2945 * _2943;
    float _2965 = in.m_90.x;
    int _2967 = _2951 * as_type<int>(_2787);
    int _2969 = _2967 + _2955;
    bool _2971 = !_2235;
    int _2973 = _2971 ? _2867 : (-1);
    float _2975 = -_2963;
    float _2977 = _2975 + 1.0;
    float _2979 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2981 = _2969 * _2961;
    bool _2983 = _1587 <= 8000.0;
    bool _2985 = isnan(_1587);
    bool _2987 = _2983 || _2985;
    bool _2989 = isnan(8000.0);
    bool _2991 = _2987 || _2989;
    float _2993 = float(_2991);
    float _2995 = fma(_2977, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2963);
    float _2997 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2979);
    int _2999 = _2973 * _2935;
    int _3001 = _2999 + _2981;
    float _3003 = fma(_2811, _2813, _2763);
    float _3005 = _2993 * _2995;
    float _3007 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2997);
    float _3009 = _2023 + _1961;
    float _3011 = float(_3001);
    float _3013 = _1961 * 0.5;
    float _3015 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3017 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3007);
    float _3019 = fma(_2025, -0.5, _3013);
    float _3021 = _2843 + _2839;
    float _3023 = _2883 * _3015;
    float _3025 = precise::clamp(_3023, 0.0, 1.0);
    float _3027 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2023;
    out.gl_Position.y = _2025;
    out.gl_Position.z = _3017;
    out.gl_Position.w = _1961;
    float _3029 = _3017 + _1961;
    float _3031 = -_3025;
    float _3033 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3035 = _3009 * 0.5;
    out.m_92.x = _3011;
    float _3037 = _3029 * 0.5;
    float _3039 = _3033 * _2965;
    float _3041 = _2859 + _2855;
    float _3043 = _2875 + _3003;
    bool _3045 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3047 = isnan(_1731);
    bool _3049 = _3045 || _3047;
    bool _3051 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3053 = _3049 || _3051;
    float _3055 = _3039 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _3035;
    out.m_94.y = _3019;
    out.m_94.z = _3037;
    out.m_94.w = _1961;
    float _3057 = _3027 * _2045;
    float _3059 = -_3027;
    float _3061 = _3059 + 1.0;
    out.m_96.x = _3055;
    float _3063 = _2056 * _3057;
    float _3065 = _2066 * _3057;
    float _3067 = _2056 * _3061;
    float _3069 = in.m_90.z;
    float _3071 = fma(_2062, _3063, _2050);
    float _3073 = fma(_2064, _3063, _2052);
    float _3075 = fma(_2056, _3065, _2054);
    out.m_98.x = _3021;
    out.m_98.y = _3041;
    out.m_98.z = _3043;
    float _3077 = _1645 * _1707;
    float _3079 = _3017;
    if (!_3053)
    {
        _2831 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3081 = _2831;
    out.m_100.x = _3071;
    out.m_100.y = _3073;
    out.m_100.z = _3075;
    out.m_100.w = _3067;
    float _3083 = _3077 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3085 = _3083;
    float _3087 = _3081;
    float _3089 = _3081;
    if (!_3053)
    {
        _2895 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3091 = _2895;
    float _3093 = _3091;
    float _3095 = _3091;
    if (!_3053)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3097 = _3079;
    float _3099 = _3097;
    float _3101 = _3097;
    if (!_3053)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3103 = _2897;
    float _3105 = _3083 * _3069;
    float _3107 = _3069;
    float _3109 = _3103;
    float _3111 = _3103;
    if (!_3053)
    {
        _3107 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3113 = _3107;
    float _3115 = _3113;
    float _3117 = _3113;
    if (!_3053)
    {
        _3085 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3119 = _3085;
    bool _3121 = !_3053;
    float _3123 = _3119;
    float _3125 = _3119;
    if (!_3121)
    {
        bool _3127 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3129 = isnan(_1731);
        bool _3131 = _3127 || _3129;
        bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3135 = _3131 || _3133;
        if (!_3135)
        {
            float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3139 = _1731 + _3137;
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3141;
            float _3145 = 1.0 / _3143;
            float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3167 = _3139 * _3145;
            float _3169 = precise::clamp(_3167, 0.0, 1.0);
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3095 = _3175;
            _3111 = _3183;
            _3089 = _3177;
            _3117 = _3181;
            _3101 = _3179;
            _3125 = _3185;
            _3187 = true;
        }
        else
        {
            bool _3189 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3191 = isnan(_1731);
            bool _3193 = _3189 || _3191;
            bool _3195 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3197 = _3193 || _3195;
            if (!_3197)
            {
                _3087 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3199 = _3087;
            _3089 = _3199;
            if (!_3197)
            {
                _3093 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3201 = _3093;
            _3095 = _3201;
            if (!_3197)
            {
                _3099 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3203 = _3099;
            _3101 = _3203;
            if (!_3197)
            {
                _3115 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3205 = _3115;
            _3117 = _3205;
            if (!_3197)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3207 = _3109;
            _3111 = _3207;
            if (!_3197)
            {
                _3123 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3209 = _3123;
            bool _3211 = !_3197;
            _3125 = _3209;
            if (!_3211)
            {
                bool _3213 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3215 = isnan(_1731);
                bool _3217 = _3213 || _3215;
                bool _3219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3221 = _3217 || _3219;
                if (!_3221)
                {
                    float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3225 = _1731 + _3223;
                    float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3229 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3227;
                    float _3231 = 1.0 / _3229;
                    float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3253 = _3225 * _3231;
                    float _3255 = precise::clamp(_3253, 0.0, 1.0);
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3261 = fma(_3255, _3235, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3263 = fma(_3255, _3259, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3265 = fma(_3255, _3239, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3267 = fma(_3255, _3243, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3269 = fma(_3255, _3247, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3271 = fma(_3255, _3251, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3095 = _3261;
                    _3111 = _3269;
                    _3089 = _3263;
                    _3117 = _3267;
                    _3101 = _3265;
                    _3125 = _3271;
                    _3187 = true;
                }
                else
                {
                    _3095 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3089 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3117 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3101 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3125 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3187 = false;
    float _3273 = _3095;
    float _3275 = _3111;
    float _3277 = _3089;
    float _3279 = _3117;
    float _3281 = _3101;
    float _3283 = _3125;
    float _3285 = fma(_3041, -0.5, 0.5);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = -_3273;
    float _3291 = _3289 + _3275;
    float _3293 = _3105 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3295 = -_3277;
    float _3297 = _3295 + _3279;
    out.m_102.x = 0.0;
    float _3299 = fma(_3287, _3291, _3273);
    float _3301 = fma(_3287, _3297, _3277);
    out.m_53.x = _3293;
    float _3303 = -_3281;
    float _3305 = _3303 + _3283;
    float _3307 = _3299 * 0.586610972881317138671875;
    bool _3309 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3311 = fma(_3287, _3305, _3281);
    float _3313 = fma(_3301, 0.298911988735198974609375, _3307);
    bool _3315 = _1645 > 0.0;
    bool _3317 = isnan(_1645);
    bool _3319 = _3315 || _3317;
    bool _3321 = isnan(0.0);
    bool _3323 = _3319 || _3321;
    float _3325 = fma(_3311, 0.114477999508380889892578125, _3313);
    bool _3327 = _1707 <= 0.0;
    bool _3329 = !_3323;
    bool _3331 = _3327 || _3329;
    float _3333 = -_3325;
    float _3335 = _3301 + _3333;
    float _3337 = -_3325;
    float _3339 = _3299 + _3337;
    float _3341 = -_3325;
    float _3343 = _3311 + _3341;
    float _3345 = fma(_3335, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3325);
    float _3347 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3325);
    float _3349 = fma(_3343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3325);
    bool _3351 = !_3309;
    if (!_3351)
    {
        float _3353 = -_1575;
        float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3357 = -_1577;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3361 = -_1579;
        float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3365 = _3355 * _3355;
        float _3367 = fma(_3359, _3359, _3365);
        float _3369 = fma(_3363, _3363, _3367);
        float _3371 = sqrt(_3369);
        float _3373 = rsqrt(_3369);
        float _3375 = -_3371;
        float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3379 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = _3359 * _3373;
        float _3385 = _3355 * _3373;
        float _3387 = abs(_3381);
        float _3389 = log2(_3387);
        float _3391 = _3363 * _3373;
        float _3393 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3395 = _3041 * _3385;
        float _3397 = -_3385;
        float _3399 = -_3393;
        float _3401 = fma(_3397, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3399);
        float _3403 = fma(_3021, _3383, _3395);
        float _3405 = -_3391;
        float _3407 = fma(_3405, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3401);
        float _3409 = fma(_3043, _3391, _3403);
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3415 = _3407 + _3413;
        float _3417 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3419 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3421 = precise::clamp(_3419, 0.0, 1.0);
        float _3423 = exp2(_3417);
        float _3425 = _3423 * _3421;
        float _3427 = _3411 * _3425;
        float _3429 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3431 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3433 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3429;
        out.m_102.y = _3431;
        out.m_102.z = _3433;
    }
    out.m_80.x = _3345;
    out.m_80.y = _3347;
    out.m_80.z = _3349;
    if (!_3331)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3435 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3435;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3187 = false;
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
        float _3504 = as_type<float>(_145);
        out.gl_Position.z = _3504;
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
        float _3569 = as_type<float>(_175);
        out.gl_Position.z = _3569;
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
    bool _229 = !_213;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_183, _201, _223);
    float _235 = fma(_187, _199, _225);
    bool _237 = !_209;
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
    float _477 = _443 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _491 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _493 = isnan(_471);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _481;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _509 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _511 = isnan(_471);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _527 = 1.0 / _489;
    float _529 = _485 * _503;
    bool _531 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_471);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _507;
    float _545 = -_501;
    float _547 = _545 + 1.0;
    float _549 = fma(_529, _475, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _555 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _557 = isnan(_471);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -_541;
    float _569 = _567 + 1.0;
    float _571 = _541 * _547;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _577 = 1.0 / _553;
    float _579 = -_565;
    float _581 = _579 + 1.0;
    float _583 = _519 * _569;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _585;
    float _589 = _575 * _527;
    float _591 = _501 * _581;
    float _593 = _549 * _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = _471 + _595;
    float _599 = -_519;
    float _601 = _599 + 1.0;
    bool _603 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _605 = isnan(_471);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _587 * _543;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _623 = _471 + _621;
    float _625 = fma(_589, _597, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _627 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[115].x, _593);
    float _629 = -_613;
    float _631 = _629 + 1.0;
    float _633 = _619 * _577;
    float _635 = fma(_615, _623, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _639 = _471 + _637;
    float _641 = fma(_625, _571, _627);
    float _643 = _565 * _631;
    float _645 = fma(_633, _639, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _647 = fma(_635, _591, _641);
    float _649 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_645, _643, _647);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _657 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[119].x, _651);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _661 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _667 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _667;
    out.m_72.y = _669;
    out.m_72.z = _671;
    out.m_72.w = _665;
    out.m_74.x = _661;
    out.m_74.y = _663;
    out.m_74.z = _649;
    out.m_74.w = _673;
    bool _675 = !_525;
    if (!_675)
    {
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _679 = _159 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _179 = _689;
    }
    float _691 = _179;
    float _693 = in.m_46.x;
    float _695 = in.m_46.y;
    float _697 = in.m_46.z;
    float _699 = _159 * 2.0;
    float _701 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _703 = log2(_701);
    float _705 = in.m_55.z;
    float _707 = _341 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _709 = in.m_55.y;
    float _711 = _343 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _713 = floor(_699);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _717 = in.m_64.w;
    float _719 = in.m_68.w;
    float _721 = _703 * _127;
    float _723 = _191 * _695;
    float _725 = _197 * _695;
    float _727 = _203 * _695;
    bool _729 = _713 > 0.0;
    float _731 = fma(_189, _693, _723);
    float _733 = fma(_195, _693, _725);
    float _735 = fma(_201, _693, _727);
    float _737 = _705 * 2.0;
    bool _739 = _713 >= 0.0;
    bool _741 = isnan(_713);
    bool _743 = _739 || _741;
    bool _745 = isnan(0.0);
    bool _747 = _743 || _745;
    float _749 = _709 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _751 = in.m_66.w;
    float _753 = _709 * 2.0;
    float _755 = floor(_737);
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _767 = _765 != 0;
    float _769 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _773 = _747 ? 0 : 1;
    float _775 = fma(_199, _697, _733);
    bool _777 = !_759;
    int _779 = _777 ? 0 : 1;
    float _781 = fma(_749, -2.0, _771);
    float _783 = exp2(_721);
    float _785 = fma(_193, _697, _731);
    float _787 = _709 + _705;
    float _789 = -_715;
    float _791 = fma(_769, 2.0, _789);
    float _793 = fma(_205, _697, _735);
    float _795 = _159 + _709;
    float _797 = _787 + (-1.0);
    bool _799 = !_763;
    int _801 = _799 ? 0 : 1;
    float _803 = floor(_753);
    bool _805 = _755 > 0.0;
    float _807 = -_127;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[76].x, _791);
    bool _811 = _755 >= 0.0;
    bool _813 = isnan(_755);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    float _821 = _785 + _717;
    float _823 = _775 + _751;
    float _825 = _795 + (-1.0);
    float _827 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _829 = int(_827);
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _833 = -_783;
    float _835 = _833 + 1.0;
    bool _837 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _845 = _841 || _843;
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _849 = _823 + _847;
    int _851 = _819 ? 0 : 1;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _855 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _781);
    bool _857 = _803 > 0.0;
    float _859 = _793 + _719;
    bool _861 = _803 >= 0.0;
    bool _863 = isnan(_803);
    bool _865 = _861 || _863;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _873 = _821 + _871;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _877 = int(_875);
    bool _879 = !_767;
    int _881 = _879 ? 0 : 1;
    float _883 = _849 * _849;
    int _885 = ~_851;
    int _887 = _885 + 1;
    int _889 = _887 + 1;
    float _891 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _893 = _845 ? _835 : 0.0;
    float _895 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[78].w, _853);
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _899 = _897 != 0;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _907 = _905 != 0;
    float _909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _911 = _859 + _909;
    int _913 = _889;
    float _915 = _859;
    if (!_805)
    {
        int _917 = ~_851;
        int _919 = _917 + 1;
        _913 = _919;
    }
    int _921 = _913;
    float _923 = fma(_873, _873, _883);
    float _925 = float(_829);
    float _927 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _895);
    bool _929 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _931 = isnan(1.0);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _937 = _933 || _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _941 = 1.0 + _939;
    float _943 = 1.0 / _925;
    bool _945 = !_899;
    int _947 = _945 ? 0 : 1;
    float _949 = fma(_911, _911, _923);
    bool _951 = !_903;
    int _953 = _951 ? 0 : 1;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _957 = float(_877);
    int _959 = abs(_953);
    float _961 = 1.0 / _941;
    float _963 = in.m_76.x;
    float _965 = in.m_76.y;
    float _967 = in.m_76.z;
    float _969 = float(_921);
    float _971 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _955);
    float _973 = _957 * _127;
    int _975 = _869 ? 0 : 1;
    float _977 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _971);
    float _979 = _943 * _127;
    int _981 = abs(_947);
    float _983 = sqrt(_949);
    int _985 = ~_773;
    int _987 = _985 + 1;
    int _989 = _987 + 1;
    float _991 = float(_981);
    int _993 = _989;
    if (_937)
    {
        float _995 = _893 * _961;
        _137 = _995;
    }
    float _997 = _137;
    if (!_729)
    {
        int _999 = ~_773;
        int _1001 = _999 + 1;
        _993 = _1001;
    }
    int _1003 = _993;
    float _1005 = _991 * _969;
    float _1007 = rsqrt(_949);
    float _1009 = float(_1003);
    float _1011 = _1005 * (-2.0);
    float _1013 = float(_959);
    float _1015 = _707 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1017 = ~_975;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    float _1023 = _983 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1025 = fma(_1011, _963, _963);
    float _1027 = _1013 * _1009;
    float _1029 = _159 + (-0.5);
    float _1031 = fma(_891, _1011, _891);
    float _1033 = precise::min(_1015, _1023);
    float _1035 = _1027 * (-2.0);
    float _1037 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1025);
    bool _1039 = !_907;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = _1007 * _1033;
    float _1045 = fma(_831, _1035, _831);
    float _1047 = fma(_1031, _997, _1037);
    float _1049 = fma(_1035, _965, _965);
    float _1051 = _849 * _1043;
    int _1053 = abs(_1041);
    float _1055 = _709 + (-0.5);
    int _1057 = _1021;
    if (!_857)
    {
        int _1059 = ~_975;
        int _1061 = _1059 + 1;
        _1057 = _1061;
    }
    int _1063 = _1057;
    float _1065 = _1047 * 0.15915493667125701904296875;
    float _1067 = _873 * _1043;
    float _1069 = -_1051;
    float _1071 = _849 + _1069;
    float _1073 = float(_1063);
    float _1075 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1049);
    float _1077 = float(_1053);
    float _1079 = -_1067;
    float _1081 = _873 + _1079;
    float _1083 = _1071 * _1071;
    float _1085 = fma(_1045, _997, _1075);
    float _1087 = _159 + _705;
    float _1089 = _1077 * _1073;
    float _1091 = fma(_1081, _1081, _1083);
    float _1093 = _911 * _1043;
    float _1095 = _1087 + (-1.0);
    float _1097 = _1089 * (-2.0);
    float _1099 = -_1093;
    float _1101 = _911 + _1099;
    float _1103 = _705 + (-0.5);
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1107 = fma(_1097, _967, _967);
    float _1109 = fma(_1101, _1101, _1091);
    float _1111 = _1085 * 0.15915493667125701904296875;
    float _1113 = fma(_1105, _1097, _1105);
    float _1115 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1107);
    float _1117 = sqrt(_1109);
    float _1119 = fma(_1113, _997, _1115);
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _1123 = _1119 * 0.15915493667125701904296875;
    float _1125 = _1065 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1111 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    float _1133 = _1007 * _1117;
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _1137 = _711 * _1133;
    float _1139 = _707 * _1133;
    float _1141 = _1111 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1137 * _1121;
    float _1147 = _1065 * 6.283185482025146484375;
    float _1149 = sin(_1147);
    float _1151 = _1127 * _1131;
    float _1153 = _1123 * 6.283185482025146484375;
    float _1155 = cos(_1153);
    float _1157 = _1127 * _1143;
    float _1159 = _1123 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = _1149 * _1131;
    float _1165 = _1149 * _1143;
    float _1167 = _1127 * _1155;
    float _1169 = _1149 * _1155;
    float _1171 = _1143 * _1155;
    float _1173 = _1131 * _1155;
    float _1175 = _1139 * _1135;
    float _1177 = _1167 * _1145;
    float _1179 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1181 = _1179 * 0.5;
    float _1183 = fma(_1161, _1157, _1163);
    float _1185 = -_1165;
    float _1187 = fma(_1161, _1151, _1185);
    float _1189 = -_1145;
    float _1191 = _1161 * _1189;
    float _1193 = -_1151;
    float _1195 = fma(_1161, _1165, _1193);
    float _1197 = fma(_1183, _1175, _1177);
    float _1199 = _1169 * _1145;
    float _1201 = fma(_1171, _1175, _1191);
    float _1203 = fma(_1161, _1163, _1157);
    float _1205 = fma(_1187, _1181, _1197);
    float _1207 = fma(_1195, _1175, _1199);
    float _1209 = fma(_1173, _1181, _1201);
    float _1211 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1213 = fma(_1203, _1181, _1207);
    float _1215 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1217 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1211);
    float _1219 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1215);
    float _1221 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1217);
    float _1223 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1219);
    float _1225 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1227 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1229 = _859 + _1225;
    float _1231 = _821 + _1227;
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1235 = _1229 + _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1239 = _1231 + _1237;
    float _1241 = _1235 * _1235;
    float _1243 = fma(_1239, _1239, _1241);
    float _1245 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1247 = sqrt(_1243);
    float _1249 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1245);
    float _1251 = -_1051;
    float _1253 = _823 + _1251;
    float _1255 = -_1093;
    float _1257 = _859 + _1255;
    float _1259 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1249);
    float _1261 = -_1067;
    float _1263 = _821 + _1261;
    float _1265 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1269 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1265);
    float _1271 = _823 + _1267;
    float _1273 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1269);
    bool _1275 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = _1267;
    float _1279 = _1259;
    float _1281 = _1231;
    if (!_1275)
    {
        _1277 = _1229;
    }
    float _1283 = _1277;
    float _1285 = _1283;
    if (!_1275)
    {
        _1279 = _1271;
    }
    float _1287 = _1279;
    bool _1289 = !_1275;
    float _1291 = _1287;
    if (!_1289)
    {
        float _1293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1297 = _1247 + _1295;
        float _1299 = rsqrt(_1243);
        float _1301 = _1297 * _1293;
        float _1303 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = _1301 * 0.15915493667125701904296875;
        float _1307 = _1305 * 6.283185482025146484375;
        float _1309 = cos(_1307);
        float _1311 = _1305 * 6.283185482025146484375;
        float _1313 = sin(_1311);
        float _1315 = _1309 + (-1.0);
        float _1317 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1319 = fma(_1313, _1303, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1321 = fma(_1271, _1309, _1317);
        float _1323 = _1299 * _1319;
        float _1325 = fma(_1239, _1323, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1327 = fma(_1235, _1323, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1291 = _1321;
        _1281 = _1325;
        _1285 = _1327;
    }
    float _1329 = _1291;
    float _1331 = _1281;
    float _1333 = _1285;
    float _1335 = -_823;
    float _1337 = _1335 + _1329;
    float _1339 = -_821;
    float _1341 = _1339 + _1331;
    float _1343 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1345 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1347 = _1337 * _1337;
    float _1349 = -_859;
    float _1351 = _1349 + _1333;
    float _1353 = 1.0 / _1343;
    float _1355 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1357 = fma(_1341, _1341, _1347);
    float _1359 = -_1067;
    float _1361 = _1359 + _1331;
    float _1363 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1355);
    float _1365 = fma(_1351, _1351, _1357);
    float _1367 = -_1093;
    float _1369 = _1367 + _1333;
    float _1371 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1373 = sqrt(_1365);
    bool _1375 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1377 = isnan(0.5);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1383 = _1379 || _1381;
    float _1385 = _1371 + _1343;
    float _1387 = -_1051;
    float _1389 = _1387 + _1329;
    bool _1391 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1399 = _1395 || _1397;
    float _1401 = _1385 * _1353;
    float _1403 = _1401 * 0.5;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1407 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1405);
    bool _1409 = _1373 > 0.0;
    float _1411 = 1.0 / _1407;
    float _1413 = _1373;
    float _1415 = _1403;
    float _1417 = _1333;
    float _1419 = _1353;
    float _1421 = _1369;
    float _1423 = _1361;
    float _1425 = _1329;
    if (!_1409)
    {
        _1413 = _1361;
    }
    float _1427 = _1413;
    float _1429 = _1427;
    if (!_1409)
    {
        _1415 = _1389;
    }
    float _1431 = _1415;
    float _1433 = _1431;
    if (!_1409)
    {
        _915 = _1369;
    }
    float _1435 = _915;
    bool _1437 = !_1409;
    float _1439 = _1435;
    float _1441 = _1435;
    if (!_1437)
    {
        float _1443 = _235 * _235;
        float _1445 = fma(_227, _227, _1443);
        float _1447 = rsqrt(_1365);
        float _1449 = fma(_241, _241, _1445);
        float _1451 = sqrt(_1449);
        float _1453 = _1341 * _1447;
        float _1455 = _1337 * _1447;
        float _1457 = _1351 * _1447;
        bool _1459 = _1451 > 0.0;
        float _1461 = _1447;
        float _1463 = _1451;
        _1417 = _1453;
        _1419 = _1455;
        if (!_1459)
        {
            _1461 = _1361;
        }
        float _1465 = _1461;
        _1429 = _1465;
        if (!_1459)
        {
            _1463 = _1389;
        }
        float _1467 = _1463;
        _1433 = _1467;
        if (!_1459)
        {
            _1439 = _1369;
        }
        float _1469 = _1439;
        bool _1471 = !_1459;
        _1441 = _1469;
        if (!_1471)
        {
            float _1473 = rsqrt(_1449);
            float _1475 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1477 = _235 * _1473;
            float _1479 = _227 * _1473;
            float _1481 = _1455 * _1477;
            float _1483 = _241 * _1473;
            float _1485 = fma(_1453, _1479, _1481);
            float _1487 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1489 = fma(_1457, _1483, _1485);
            float _1491 = _1489 * _1487;
            float _1493 = fma(_227, _1491, _1361);
            float _1495 = fma(_235, _1491, _1389);
            float _1497 = fma(_241, _1491, _1369);
            _1429 = _1493;
            _1433 = _1495;
            _1441 = _1497;
        }
    }
    float _1499 = _1429;
    float _1501 = _1433;
    float _1503 = _1441;
    float _1505 = _1417;
    float _1507 = _1419;
    float _1509 = _1505;
    float _1511 = _1501;
    float _1513 = _1499;
    float _1515 = _1503;
    float _1517 = _1507;
    if (_1399)
    {
        _1421 = 1.0;
    }
    float _1519 = _1421;
    float _1521 = _1519;
    if (!_1383)
    {
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1525 = _1253 + _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1529 = _1263 + _1527;
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1533 = _1525 * _1525;
        float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1537 = _1257 + _1535;
        float _1539 = fma(_1529, _1529, _1533);
        float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1543 = fma(_1537, _1537, _1539);
        float _1545 = sqrt(_1543);
        float _1547 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = precise::min(_1545, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1551 = _1549 * _1541;
        float _1553 = -_1263;
        float _1555 = _1553 + _1499;
        float _1557 = _1547 * _1551;
        float _1559 = -_1253;
        float _1561 = _1559 + _1501;
        float _1563 = -_1257;
        float _1565 = _1563 + _1503;
        float _1567 = fma(_1555, _1557, _1263);
        float _1569 = fma(_1561, _1557, _1253);
        float _1571 = fma(_1565, _1557, _1257);
        _1509 = _1541;
        _1511 = _1569;
        _1513 = _1567;
        _1515 = _1571;
    }
    float _1573 = _1509;
    float _1575 = _1511;
    float _1577 = _1513;
    float _1579 = _1515;
    float _1581 = _1573;
    if (_1399)
    {
        _1517 = 1.0;
    }
    float _1583 = _1517;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1587 = _1411 * _1585;
    float _1589 = _1583;
    if (!_1399)
    {
        float _1591 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1593 = _1591 * 0.15915493667125701904296875;
        float _1595 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1599 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1597;
        float _1601 = _1593 * 6.283185482025146484375;
        float _1603 = cos(_1601);
        float _1605 = _1595 * 0.15915493667125701904296875;
        float _1607 = _1593 * 6.283185482025146484375;
        float _1609 = sin(_1607);
        float _1611 = 1.0 / _1603;
        float _1613 = _1605 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        float _1617 = _1609 * _1611;
        float _1619 = _1605 * 6.283185482025146484375;
        float _1621 = sin(_1619);
        float _1623 = _1615 * _1617;
        float _1625 = 1.0 / _1599;
        float _1627 = 1.0 / _1623;
        float _1629 = _1621 * _1627;
        float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1633 = fma(_1587, _1629, _1631);
        float _1635 = _1633 * _1625;
        float _1637 = precise::clamp(_1635, 0.0, 1.0);
        _1581 = _1625;
        _1423 = _1593;
        _1425 = _1605;
        _1521 = _1637;
    }
    float _1639 = _1581;
    float _1641 = _1423;
    float _1643 = _1425;
    float _1645 = _1521;
    float _1647 = _1641;
    float _1649 = _1639;
    if (!_1399)
    {
        float _1651 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1653 = _1651 * 0.15915493667125701904296875;
        float _1655 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1657 = _1653 * 6.283185482025146484375;
        float _1659 = cos(_1657);
        float _1661 = _1655 * 0.15915493667125701904296875;
        float _1663 = _1653 * 6.283185482025146484375;
        float _1665 = sin(_1663);
        float _1667 = 1.0 / _1659;
        float _1669 = _1661 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = _1665 * _1667;
        float _1675 = _1661 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        float _1679 = _1671 * _1673;
        float _1681 = 1.0 / _1679;
        float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1685 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1683;
        float _1687 = 1.0 / _1685;
        float _1689 = _1677 * _1681;
        float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1693 = fma(_1587, _1689, _1691);
        float _1695 = _1693 * _1687;
        float _1697 = precise::clamp(_1695, 0.0, 1.0);
        float _1699 = -_1697;
        float _1701 = _1699 + 1.0;
        _1647 = _1679;
        _1649 = _1667;
        _1589 = _1701;
    }
    float _1703 = _1647;
    float _1705 = _1649;
    float _1707 = _1589;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1575 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1715 = _1577 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1719 = _1579 + _1717;
    float _1721 = _1711 * _1711;
    float _1723 = fma(_1715, _1715, _1721);
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1727 = fma(_1719, _1719, _1723);
    float _1729 = rsqrt(_1727);
    float _1731 = sqrt(_1727);
    float _1733 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1735 = _1715 * _1733;
    float _1737 = _1719 * _1733;
    float _1739 = _1735 * _1735;
    float _1741 = _1737 * _1737;
    float _1743 = _1739 + _1741;
    float _1745 = sqrt(_1743);
    bool _1747 = _1745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1751 = _1745 + _1749;
    float _1753 = _1719;
    float _1755 = _1721;
    float _1757 = _1751;
    float _1759 = _1703;
    float _1761 = _1733;
    float _1763 = _1705;
    if (_1747)
    {
        float _1765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1753 = _1765;
    }
    float _1767 = _1753;
    if (_1747)
    {
        float _1769 = rsqrt(_1743);
        _1755 = _1769;
    }
    float _1771 = _1755;
    float _1773 = _1771;
    if (_1747)
    {
        float _1775 = _1751 * _1767;
        _1757 = _1775;
    }
    float _1777 = _1757;
    float _1779 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1747)
    {
        float _1781 = _1777 * 0.15915493667125701904296875;
        _1759 = _1781;
    }
    float _1783 = _1759;
    float _1785 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1779);
    float _1787 = _1767;
    float _1789 = _1783;
    if (_1747)
    {
        float _1791 = _1783 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        _1787 = _1793;
    }
    float _1795 = _1787;
    float _1797 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1799 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1785);
    float _1801 = precise::max(0.0, _1797);
    float _1803 = _1643;
    if (_1747)
    {
        float _1805 = _1783 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        _1803 = _1807;
    }
    float _1809 = _1803;
    float _1811 = _1799 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1813 = -_1733;
    float _1815 = -_1801;
    float _1817 = fma(_1711, _1813, _1815);
    if (_1747)
    {
        float _1819 = _1817 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1761 = _1819;
    }
    float _1821 = _1761;
    float _1823 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1825 = _1795;
    float _1827 = _1821;
    if (_1747)
    {
        float _1829 = fma(_1795, _1821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1763 = _1829;
    }
    float _1831 = _1763;
    float _1833 = _1831;
    if (!_1747)
    {
        _1825 = _1735;
    }
    float _1835 = _1825;
    float _1837 = floor(_1823);
    float _1839 = _1835;
    float _1841 = _1809;
    if (_1747)
    {
        float _1843 = _1809 + (-1.0);
        _1827 = _1843;
    }
    float _1845 = _1827;
    float _1847 = 0.0;
    float _1849 = _1845;
    if (_1747)
    {
        float _1851 = _1771 * _1831;
        _1847 = _1851;
    }
    float _1853 = _1847;
    if (!_1747)
    {
        _1773 = _1817;
    }
    float _1855 = _1773;
    float _1857 = _1855;
    if (_1747)
    {
        float _1859 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1789 = _1859;
    }
    float _1861 = _1789;
    if (_1747)
    {
        float _1863 = _1735 * _1853;
        _1839 = _1863;
    }
    float _1865 = _1839;
    if (!_1747)
    {
        _1849 = _1737;
    }
    float _1867 = _1849;
    float _1869 = _1867;
    if (_1747)
    {
        float _1871 = _1737 * _1853;
        _1869 = _1871;
    }
    float _1873 = _1869;
    if (!_1747)
    {
        _1833 = _1739;
    }
    float _1875 = _1833;
    float _1877 = _1875;
    if (_1747)
    {
        float _1879 = fma(_1817, _1809, _1861);
        _1857 = _1879;
    }
    float _1881 = _1857;
    if (_1747)
    {
        float _1883 = _1865 * _1865;
        _1877 = _1883;
    }
    float _1885 = _1877;
    if (!_1747)
    {
        _1841 = _1741;
    }
    float _1887 = _1841;
    float _1889 = _1887;
    if (_1747)
    {
        float _1891 = _1873 * _1873;
        _1889 = _1891;
    }
    float _1893 = _1889;
    float _1895 = fma(_1881, _1881, _1885);
    float _1897 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1899 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1901 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1903 = _1895 + _1893;
    float _1905 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1907 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1897);
    float _1909 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1899);
    float _1911 = floor(_1901);
    float _1913 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1905);
    float _1915 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1907);
    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1919 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1917);
    float _1921 = precise::clamp(_1919, 0.0, 1.0);
    float _1923 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1909);
    float _1925 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1913);
    float _1927 = _1915 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1929 = -_1921;
    float _1931 = _1929 + 1.0;
    float _1933 = rsqrt(_1903);
    float _1935 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1937 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1939 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1941 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1943 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1939);
    float _1945 = abs(_1931);
    float _1947 = log2(_1945);
    float _1949 = -_1941;
    float _1951 = fma(_1949, _1725, 1.0);
    float _1953 = -_1911;
    float _1955 = _1901 + _1953;
    float _1957 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1943);
    float _1959 = _1933 * _1865;
    float _1961 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1957);
    float _1963 = _1933 * _1881;
    float _1965 = _1933 * _1873;
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1969 = -_1837;
    float _1971 = _1823 + _1969;
    float _1973 = log2(_1951);
    float _1975 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1977 = -_1967;
    float _1979 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1977);
    float _1981 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1983 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1975);
    float _1985 = -_1965;
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1979);
    float _1989 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1991 = 1.0 / _1961;
    float _1993 = _1963 + 1.0;
    float _1995 = fma(_1987, -0.5, 0.5);
    float _1997 = fma(_1987, 0.5, 0.5);
    float _1999 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1989);
    float _2001 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1983);
    float _2003 = fma(_1997, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2005 = exp2(_1981);
    float _2007 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1999);
    float _2009 = _1973 * 0.693147182464599609375;
    float _2011 = fma(_1997, _2003, -0.212114393711090087890625);
    float _2013 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2015 = fma(_1997, _2011, 1.570728778839111328125);
    float _2017 = sqrt(_1995);
    float _2019 = -_1963;
    float _2021 = fma(_2005, _1993, _2019);
    float _2023 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2001);
    float _2025 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2007);
    float _2027 = fma(_2021, 0.5, 0.5);
    float _2029 = _2023 * _1991;
    float _2031 = _2025 * _1991;
    float _2033 = _2017 * 0.636619746685028076171875;
    float _2035 = fma(_2029, 0.5, 0.5);
    float _2037 = fma(_2031, -0.5, 0.5);
    float _2039 = -_2015;
    float _2041 = fma(_2033, _2039, 1.0);
    float2 _6449 = float2(_1971, _1955);
    float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6449, float2(0.0), isnan(_6449)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6449, float2(0.0), isnan(_6449)), level(0.0)).x;
    float3 _6460 = float3(_2035, _2037, _2013);
    float _2045 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6460, float3(0.0), isnan(_6460)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6460, float3(0.0), isnan(_6460)), level(0.0)).x;
    float3 _6471 = float3(_2035, _2037, _2013);
    float4 _2048 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6471, float3(0.0), isnan(_6471)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6471, float3(0.0), isnan(_6471)), level(0.0)).xyzw;
    float _2050 = _2048.x;
    float _2052 = _2048.y;
    float _2054 = _2048.z;
    float _2056 = _2048.w;
    float2 _6487 = float2(_2041, _2027);
    float3 _2060 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6487, float2(0.0), isnan(_6487)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6487, float2(0.0), isnan(_6487)), level(0.0)).xyz;
    float _2062 = _2060.x;
    float _2064 = _2060.y;
    float _2066 = _2060.z;
    float _2068 = float(uint(_877));
    float _2070 = trunc(_979);
    int _2072 = int(_2070);
    int _2074 = ~_877;
    int _2076 = _2074 + 1;
    float _2078 = -_977;
    float _2080 = _2078 + 1.0;
    int _2082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2084 = _2082 != 0;
    float _2086 = _973 * _169;
    int _2088 = ~_877;
    int _2090 = _2088 + 1;
    float _2092 = -_927;
    float _2094 = _2092 + 1.0;
    bool _2096 = _159 > 0.5;
    float _2098 = 1.0 / _2068;
    out.m_78.x = _1263;
    out.m_78.y = _1253;
    out.m_78.z = _1257;
    bool _2100 = _709 > 0.5;
    float _2102 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2106 = _2104 != 0;
    out.m_80.w = _1033;
    int _2108 = abs(_801);
    float _2110 = trunc(_2086);
    int _2112 = int(_2110);
    float _2114 = float(uint(_2072));
    out.m_82.x = _1139;
    float _2116 = float(_2072);
    int _2118 = abs(_779);
    float _2120 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2122 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2124 = isnan(_691);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2130 = _2126 || _2128;
    float _2132 = float(_2130);
    float _2134 = exp2(_2102);
    int _2136 = as_type<int>(_2098) + (-2);
    out.m_84.x = _1577;
    out.m_84.y = _1575;
    out.m_84.z = _1579;
    float _2138 = -_2132;
    float _2140 = _2138 + 1.0;
    float _2142 = as_type<float>(_2136) * _2114;
    int _2144 = ~_877;
    int _2146 = _2144 + 1;
    float _2148 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2150 = _2148 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2152 = trunc(_2142);
    float _2154 = precise::max(_2152, 0.0);
    uint _2157 = uint(_2154);
    float _2159 = -_2134;
    float _2161 = _2159 + 1.0;
    float _2163 = 1.0 / _2150;
    int _2165 = _2090 * int(_2157);
    int _2167 = _2165 + _2072;
    float _2169 = float(uint(_2167));
    float _2171 = as_type<float>(_2136) * _2169;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2175 = _2173 != 0;
    float _2177 = trunc(_2171);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    bool _2183 = !_2175;
    float _2185 = _2183 ? 7.345489978790283203125 : 1.0;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2191 = _2185 * _159;
    bool _2193 = _2116 >= _957;
    bool _2195 = isnan(_2116);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan(_957);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = floor(_2191);
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2209 = _2207 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2211 = int(_2157) + int(_2181);
    float _2213 = trunc(_2203);
    int _2215 = int(_2213);
    int _2217 = _2076 * _2211;
    int _2219 = _2217 + _2072;
    bool _2221 = uint(_2219) >= uint(_877);
    float _2223 = -_2205;
    float _2225 = _2191 + _2223;
    float _2227 = 1.0 / _2189;
    bool _2229 = !_2221;
    int _2231 = _2229 ? 0 : (-1);
    float _2233 = _2225 * _957;
    bool _2235 = _877 == 0;
    float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2239 = _2237 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2241 = ~_2211;
    int _2243 = _2241 + _2231;
    int _2245 = _2243 + 1;
    float _2247 = 1.0 / _2209;
    int _2249 = _877 * _2245;
    int _2251 = _2249 + _2072;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2255 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2253;
    float _2257 = trunc(_2233);
    int _2259 = int(_2257);
    int _2261 = ~_2215;
    int _2263 = _2261 + 1;
    int _2265 = _2263 + 1;
    float _2267 = _2255 * _2227;
    bool _2269 = !_2235;
    int _2271 = _2269 ? _2251 : (-1);
    float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2277 = !_2106;
    int _2279 = _2277 ? 0 : 1;
    int _2281 = _2271 * _2265;
    int _2283 = _877 + (-1);
    float _2285 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2289 = abs(_2279);
    float _2291 = 1.0 / _2275;
    float _2293 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2295 = _2293 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2297 = _2215 * _2283;
    int _2299 = _2297 + _2281;
    float _2301 = _2287 * _2247;
    int _2303 = abs(_881);
    float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2307 = _691 + _2305;
    int _2309 = _2299 * _2108;
    float _2311 = fma(_2267, _2307, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2313 = _2259 * _2289;
    int _2315 = _2313 + _2072;
    int _2317 = _2112 * _2118;
    int _2319 = _2317 + _2309;
    bool _2321 = !_2084;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = 1.0 / _2239;
    bool _2327 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2329 = isnan(_691);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2335 = _2331 || _2333;
    float _2337 = float(_2335);
    int _2339 = _2315 * _2303;
    int _2341 = _2339 + _2319;
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2343;
    bool _2347 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2349 = isnan(_691);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2355 = _2351 || _2353;
    float _2357 = float(_2355);
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2363 = abs(_2323);
    float _2365 = _2345 * _2291;
    bool _2367 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2369 = isnan(_691);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2375 = _2371 || _2373;
    float _2377 = float(_2375);
    float _2379 = -_2357;
    float _2381 = _2379 + 1.0;
    bool _2383 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2385 = isnan(_691);
    bool _2387 = _2383 || _2385;
    bool _2389 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2391 = _2387 || _2389;
    float _2393 = float(_2391);
    float _2395 = 1.0 / _2295;
    float _2397 = _2337 * _2381;
    float _2399 = -_2337;
    float _2401 = _2399 + 1.0;
    float _2403 = -_2377;
    float _2405 = _2403 + 1.0;
    float _2407 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2409 = _2407 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2411 = _2377 * _2401;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2415 = _2413 != 0;
    int _2417 = _2259 * _2363;
    int _2419 = _2417 + _2341;
    bool _2421 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2423 = isnan(_691);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2429 = _2425 || _2427;
    float _2431 = float(_2429);
    float _2433 = _2393 * _2405;
    float _2435 = -_2393;
    float _2437 = _2435 + 1.0;
    bool _2439 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2441 = isnan(_691);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2447 = _2443 || _2445;
    float _2449 = float(_2447);
    float _2451 = 1.0 / _2409;
    float _2453 = float(uint(_2419));
    float _2455 = _2431 * _2437;
    float _2457 = -_2431;
    float _2459 = _2457 + 1.0;
    int _2461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2463 = _2461 != 0;
    float _2465 = as_type<float>(_2136) * _2453;
    float _2467 = _2449 * _2459;
    float _2469 = -_2449;
    float _2471 = _2469 + 1.0;
    bool _2473 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2475 = isnan(_691);
    bool _2477 = _2473 || _2475;
    bool _2479 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2481 = _2477 || _2479;
    float _2483 = float(_2481);
    float _2485 = trunc(_2465);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = _2132 * _2471;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2493;
    float _2497 = _2483 * _2140;
    float _2499 = -_2483;
    float _2501 = _2499 + 1.0;
    float _2503 = _2361 * _2451;
    float _2505 = _2495 * _2325;
    float _2507 = _2311 * _2497;
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2511 = _2509 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2513 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2515 = _691 + _2513;
    float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2517;
    float _2521 = fma(_2301, _2515, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2523 = _2146 * int(_2489);
    int _2525 = _2523 + _2419;
    float _2527 = _2511 * _2395;
    float _2529 = _2519 * _2163;
    float _2531 = fma(_2501, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2507);
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2535 = _691 + _2533;
    float _2537 = float(uint(_2525));
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2541 = _691 + _2539;
    float _2543 = fma(_2521, _2491, _2531);
    float _2545 = fma(_2365, _2535, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2549 = _691 + _2547;
    float _2551 = as_type<float>(_2136) * _2537;
    float _2553 = float(uint(_2315));
    float _2555 = fma(_2503, _2541, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2559 = _691 + _2557;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2563 = _691 + _2561;
    float _2565 = fma(_2505, _2549, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2567 = trunc(_2551);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    float _2573 = as_type<float>(_2136) * _2553;
    float _2575 = fma(_2527, _2559, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2577 = -_231;
    int _2579 = _2100 ? as_type<int>(_2577) : as_type<int>(_231);
    float _2581 = fma(_2545, _2467, _2543);
    int _2583 = ~_877;
    int _2585 = _2583 + 1;
    float _2587 = fma(_2529, _2563, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2589 = ~_877;
    int _2591 = _2589 + 1;
    float _2593 = trunc(_2573);
    float _2595 = precise::max(_2593, 0.0);
    uint _2597 = uint(_2595);
    float _2599 = fma(_2555, _2455, _2581);
    float _2601 = -_239;
    int _2603 = _2096 ? as_type<int>(_2601) : as_type<int>(_239);
    float _2605 = fma(_2565, _2433, _2599);
    int _2607 = int(_2489) + int(_2571);
    float _2609 = fma(_2575, _2411, _2605);
    bool _2611 = !_2415;
    float _2613 = _2611 ? _231 : as_type<float>(_2579);
    float _2615 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2617 = fma(_2587, _2397, _2609);
    bool _2619 = !_2463;
    float _2621 = _2619 ? _239 : as_type<float>(_2603);
    int _2623 = _2591 * int(_2597);
    int _2625 = _2623 + _2315;
    float _2627 = _2613 + (-0.5);
    int _2629 = _2585 * _2607;
    int _2631 = _2629 + _2419;
    float _2633 = _2621 + 0.5;
    float _2635 = fma(_2357, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2617);
    float _2637 = float(uint(_2625));
    float _2639 = -_2627;
    float _2641 = -_855;
    float _2643 = fma(_2639, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2641);
    bool _2645 = uint(_2631) >= uint(_877);
    float _2647 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[80].x, _809);
    int _2649 = ~_877;
    int _2651 = _2649 + 1;
    float _2653 = as_type<float>(_2136) * _2637;
    bool _2655 = !_2645;
    int _2657 = _2655 ? 0 : (-1);
    float _2659 = -_2080;
    float _2661 = fma(_2621, _2659, _2647);
    int _2663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2665 = _2663 != 0;
    float _2667 = trunc(_2653);
    float _2669 = precise::max(_2667, 0.0);
    uint _2671 = uint(_2669);
    int _2673 = ~_2607;
    int _2675 = _2673 + _2657;
    int _2677 = _2675 + 1;
    float _2679 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2681 = fma(_2613, _2094, _2643);
    float _2683 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_86.x = _2635;
    int _2685 = _877 * _2677;
    int _2687 = _2685 + _2419;
    float _2689 = -_1161;
    float _2691 = fma(_2689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2679);
    out.m_88.x = _2661;
    out.m_88.y = _2681;
    bool _2693 = !_2235;
    int _2695 = _2693 ? _2687 : (-1);
    int _2697 = _2695 >> 31;
    int _2699 = int(_2597) + int(_2671);
    int _2701 = _2697 & 3;
    float _2703 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2120);
    float _2705 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2707 = _2695 + _2701;
    float _2709 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2711 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2713 = _2651 * _2699;
    int _2715 = _2713 + _2315;
    int _2717 = _2707 >> 2;
    float _2719 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2691);
    float _2721 = -_1161;
    float _2723 = fma(_2721, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2705);
    float _2725 = -_1161;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2709);
    int _2729 = _2717 << 4;
    int _2731 = _2729 + 368;
    float _2733 = _2615 * _2719;
    float _2735 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2723);
    float _2737 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2727);
    uint _2739 = uint(int(uint(_2731) >> uint(2)));
    uint _2741 = uint(int(uint(int(_2739)) >> uint(2)));
    int _2743 = int(_2739) & 3;
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[int(_2741)][_2743];
    int _2747 = int(_2739) + 1;
    uint _2749 = uint(int(uint(_2747) >> uint(2)));
    int _2751 = _2747 & 3;
    float _2753 = (*spvDescriptorSet0.vp_c9)._m0[int(_2749)][_2751];
    bool _2755 = uint(_2715) >= uint(_877);
    float _2757 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2711);
    float _2759 = _2615 * _2735;
    float _2761 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2763 = _2615 * _2737;
    int _2765 = _2695 & 3;
    bool _2767 = _2765 != 0;
    float _2769 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2703);
    int _2771 = _2731 + 8;
    uint _2773 = uint(int(uint(_2771) >> uint(2)));
    uint _2775 = uint(int(uint(int(_2773)) >> uint(2)));
    int _2777 = int(_2773) & 3;
    float _2779 = (*spvDescriptorSet0.vp_c9)._m0[int(_2775)][_2777];
    int _2781 = int(_2773) + 1;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    int _2785 = _2781 & 3;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[int(_2783)][_2785];
    float _2789 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2761);
    bool _2791 = uint(_2765) > 1u;
    float _2793 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2683);
    int _2795 = _2695 & 3;
    bool _2797 = _2795 != 0;
    float _2799 = abs(_1587);
    float _2801 = log2(_2799);
    float _2803 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2805 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2807 = _2797 ? 0 : 1;
    float _2809 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2757);
    float _2811 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2813 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2789);
    int _2815 = ~_2807;
    int _2817 = _2815 + 1;
    int _2819 = _2817 + 1;
    float _2821 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2803);
    bool _2823 = !_2755;
    int _2825 = _2823 ? 0 : (-1);
    float _2827 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2805);
    int _2829 = _2819;
    float _2831 = _2025;
    if (!_2791)
    {
        int _2833 = ~_2807;
        int _2835 = _2833 + 1;
        _2829 = _2835;
    }
    int _2837 = _2829;
    float _2839 = fma(_2811, _2769, _2759);
    bool _2841 = _2765 != 3;
    float _2843 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2793);
    int _2845 = abs(_2837);
    float _2847 = _2801 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2849 = ~_2699;
    int _2851 = _2849 + _2825;
    int _2853 = _2851 + 1;
    float _2855 = fma(_2811, _2809, _2733);
    bool _2857 = uint(_2765) >= 2u;
    float _2859 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2821);
    float _2861 = exp2(_2847);
    int _2863 = _2857 ? 0 : 1;
    int _2865 = _877 * _2853;
    int _2867 = _2865 + _2315;
    int _2869 = ~_2845;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    float _2875 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2827);
    bool _2877 = !_2767;
    int _2879 = _2877 ? 0 : 1;
    float _2881 = -_2043;
    float _2883 = _2881 + 1.0;
    int _2885 = ~_2863;
    int _2887 = _2885 + 1;
    int _2889 = _2887 + 1;
    bool _2891 = _2765 != 3;
    int _2893 = _2889;
    float _2895 = _2050;
    float _2897 = _2859;
    if (_2841)
    {
        int _2899 = ~_2863;
        int _2901 = _2899 + 1;
        _2893 = _2901;
    }
    int _2903 = _2893;
    int _2905 = abs(_2879);
    int _2907 = _2873 * as_type<int>(_2753);
    bool _2909 = !_2891;
    int _2911 = _2909 ? 0 : (-1);
    int _2913 = abs(_2903);
    int _2915 = ~_2905;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    bool _2921 = !_2665;
    int _2923 = _2921 ? 0 : 1;
    int _2925 = _2919 * as_type<int>(_2745);
    int _2927 = _2925 + _2907;
    int _2929 = abs(_2911);
    float _2931 = fma(_2861, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2933 = precise::clamp(_2931, 0.0, 1.0);
    int _2935 = abs(_2923);
    int _2937 = ~_2913;
    int _2939 = _2937 + 1;
    int _2941 = _2939 + 1;
    float _2943 = fma(_2933, -2.0, 3.0);
    float _2945 = _2933 * _2933;
    int _2947 = ~_2929;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    int _2953 = _2941 * as_type<int>(_2779);
    int _2955 = _2953 + _2927;
    int _2957 = ~_2935;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    float _2963 = _2945 * _2943;
    float _2965 = in.m_90.x;
    int _2967 = _2951 * as_type<int>(_2787);
    int _2969 = _2967 + _2955;
    bool _2971 = !_2235;
    int _2973 = _2971 ? _2867 : (-1);
    float _2975 = -_2963;
    float _2977 = _2975 + 1.0;
    float _2979 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2981 = _2969 * _2961;
    bool _2983 = _1587 <= 8000.0;
    bool _2985 = isnan(_1587);
    bool _2987 = _2983 || _2985;
    bool _2989 = isnan(8000.0);
    bool _2991 = _2987 || _2989;
    float _2993 = float(_2991);
    float _2995 = fma(_2977, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2963);
    float _2997 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2979);
    int _2999 = _2973 * _2935;
    int _3001 = _2999 + _2981;
    float _3003 = fma(_2811, _2813, _2763);
    float _3005 = _2993 * _2995;
    float _3007 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2997);
    float _3009 = _2023 + _1961;
    float _3011 = float(_3001);
    float _3013 = _1961 * 0.5;
    float _3015 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3017 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3007);
    float _3019 = fma(_2025, -0.5, _3013);
    float _3021 = _2843 + _2839;
    float _3023 = _2883 * _3015;
    float _3025 = precise::clamp(_3023, 0.0, 1.0);
    float _3027 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2023;
    out.gl_Position.y = _2025;
    out.gl_Position.z = _3017;
    out.gl_Position.w = _1961;
    float _3029 = _3017 + _1961;
    float _3031 = -_3025;
    float _3033 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3035 = _3009 * 0.5;
    out.m_92.x = _3011;
    float _3037 = _3029 * 0.5;
    float _3039 = _3033 * _2965;
    float _3041 = _2859 + _2855;
    float _3043 = _2875 + _3003;
    bool _3045 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3047 = isnan(_1731);
    bool _3049 = _3045 || _3047;
    bool _3051 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3053 = _3049 || _3051;
    float _3055 = _3039 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _3035;
    out.m_94.y = _3019;
    out.m_94.z = _3037;
    out.m_94.w = _1961;
    float _3057 = _3027 * _2045;
    float _3059 = -_3027;
    float _3061 = _3059 + 1.0;
    out.m_96.x = _3055;
    float _3063 = _2056 * _3057;
    float _3065 = _2066 * _3057;
    float _3067 = _2056 * _3061;
    float _3069 = in.m_90.z;
    float _3071 = fma(_2062, _3063, _2050);
    float _3073 = fma(_2064, _3063, _2052);
    float _3075 = fma(_2056, _3065, _2054);
    out.m_98.x = _3021;
    out.m_98.y = _3041;
    out.m_98.z = _3043;
    float _3077 = _1645 * _1707;
    float _3079 = _3017;
    if (!_3053)
    {
        _2831 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3081 = _2831;
    out.m_100.x = _3071;
    out.m_100.y = _3073;
    out.m_100.z = _3075;
    out.m_100.w = _3067;
    float _3083 = _3077 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3085 = _3083;
    float _3087 = _3081;
    float _3089 = _3081;
    if (!_3053)
    {
        _2895 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3091 = _2895;
    float _3093 = _3091;
    float _3095 = _3091;
    if (!_3053)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3097 = _3079;
    float _3099 = _3097;
    float _3101 = _3097;
    if (!_3053)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3103 = _2897;
    float _3105 = _3083 * _3069;
    float _3107 = _3069;
    float _3109 = _3103;
    float _3111 = _3103;
    if (!_3053)
    {
        _3107 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3113 = _3107;
    float _3115 = _3113;
    float _3117 = _3113;
    if (!_3053)
    {
        _3085 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3119 = _3085;
    bool _3121 = !_3053;
    float _3123 = _3119;
    float _3125 = _3119;
    if (!_3121)
    {
        bool _3127 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3129 = isnan(_1731);
        bool _3131 = _3127 || _3129;
        bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3135 = _3131 || _3133;
        if (!_3135)
        {
            float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3139 = _1731 + _3137;
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3141;
            float _3145 = 1.0 / _3143;
            float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3167 = _3139 * _3145;
            float _3169 = precise::clamp(_3167, 0.0, 1.0);
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3095 = _3175;
            _3111 = _3183;
            _3089 = _3177;
            _3117 = _3181;
            _3101 = _3179;
            _3125 = _3185;
            _3187 = true;
        }
        else
        {
            bool _3189 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3191 = isnan(_1731);
            bool _3193 = _3189 || _3191;
            bool _3195 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3197 = _3193 || _3195;
            if (!_3197)
            {
                _3087 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3199 = _3087;
            _3089 = _3199;
            if (!_3197)
            {
                _3093 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3201 = _3093;
            _3095 = _3201;
            if (!_3197)
            {
                _3099 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3203 = _3099;
            _3101 = _3203;
            if (!_3197)
            {
                _3115 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3205 = _3115;
            _3117 = _3205;
            if (!_3197)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3207 = _3109;
            _3111 = _3207;
            if (!_3197)
            {
                _3123 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3209 = _3123;
            bool _3211 = !_3197;
            _3125 = _3209;
            if (!_3211)
            {
                bool _3213 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3215 = isnan(_1731);
                bool _3217 = _3213 || _3215;
                bool _3219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3221 = _3217 || _3219;
                if (!_3221)
                {
                    float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3225 = _1731 + _3223;
                    float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3229 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3227;
                    float _3231 = 1.0 / _3229;
                    float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3253 = _3225 * _3231;
                    float _3255 = precise::clamp(_3253, 0.0, 1.0);
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3261 = fma(_3255, _3235, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3263 = fma(_3255, _3259, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3265 = fma(_3255, _3239, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3267 = fma(_3255, _3243, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3269 = fma(_3255, _3247, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3271 = fma(_3255, _3251, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3095 = _3261;
                    _3111 = _3269;
                    _3089 = _3263;
                    _3117 = _3267;
                    _3101 = _3265;
                    _3125 = _3271;
                    _3187 = true;
                }
                else
                {
                    _3095 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3089 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3117 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3101 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3125 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3187 = false;
    float _3273 = _3095;
    float _3275 = _3111;
    float _3277 = _3089;
    float _3279 = _3117;
    float _3281 = _3101;
    float _3283 = _3125;
    float _3285 = fma(_3041, -0.5, 0.5);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = -_3273;
    float _3291 = _3289 + _3275;
    float _3293 = _3105 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3295 = -_3277;
    float _3297 = _3295 + _3279;
    out.m_102.x = 0.0;
    float _3299 = fma(_3287, _3291, _3273);
    float _3301 = fma(_3287, _3297, _3277);
    out.m_53.x = _3293;
    float _3303 = -_3281;
    float _3305 = _3303 + _3283;
    float _3307 = _3299 * 0.586610972881317138671875;
    bool _3309 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3311 = fma(_3287, _3305, _3281);
    float _3313 = fma(_3301, 0.298911988735198974609375, _3307);
    bool _3315 = _1645 > 0.0;
    bool _3317 = isnan(_1645);
    bool _3319 = _3315 || _3317;
    bool _3321 = isnan(0.0);
    bool _3323 = _3319 || _3321;
    float _3325 = fma(_3311, 0.114477999508380889892578125, _3313);
    bool _3327 = _1707 <= 0.0;
    bool _3329 = !_3323;
    bool _3331 = _3327 || _3329;
    float _3333 = -_3325;
    float _3335 = _3301 + _3333;
    float _3337 = -_3325;
    float _3339 = _3299 + _3337;
    float _3341 = -_3325;
    float _3343 = _3311 + _3341;
    float _3345 = fma(_3335, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3325);
    float _3347 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3325);
    float _3349 = fma(_3343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3325);
    bool _3351 = !_3309;
    if (!_3351)
    {
        float _3353 = -_1575;
        float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3357 = -_1577;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3361 = -_1579;
        float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3365 = _3355 * _3355;
        float _3367 = fma(_3359, _3359, _3365);
        float _3369 = fma(_3363, _3363, _3367);
        float _3371 = sqrt(_3369);
        float _3373 = rsqrt(_3369);
        float _3375 = -_3371;
        float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3379 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = _3359 * _3373;
        float _3385 = _3355 * _3373;
        float _3387 = abs(_3381);
        float _3389 = log2(_3387);
        float _3391 = _3363 * _3373;
        float _3393 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3395 = _3041 * _3385;
        float _3397 = -_3385;
        float _3399 = -_3393;
        float _3401 = fma(_3397, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3399);
        float _3403 = fma(_3021, _3383, _3395);
        float _3405 = -_3391;
        float _3407 = fma(_3405, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3401);
        float _3409 = fma(_3043, _3391, _3403);
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3415 = _3407 + _3413;
        float _3417 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3419 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3421 = precise::clamp(_3419, 0.0, 1.0);
        float _3423 = exp2(_3417);
        float _3425 = _3423 * _3421;
        float _3427 = _3411 * _3425;
        float _3429 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3431 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3433 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3429;
        out.m_102.y = _3431;
        out.m_102.z = _3433;
    }
    out.m_80.x = _3345;
    out.m_80.y = _3347;
    out.m_80.z = _3349;
    if (!_3331)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3435 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3435;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3187 = false;
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
        float _3504 = as_type<float>(_145);
        out.gl_Position.z = _3504;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3569 = as_type<float>(_175);
        out.gl_Position.z = _3569;
    }
    out.m_51.x = _177;
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _229 = !_213;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_183, _201, _223);
    float _235 = fma(_187, _199, _225);
    bool _237 = !_209;
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
    float _477 = _443 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _491 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _493 = isnan(_471);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _481;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _509 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _511 = isnan(_471);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _527 = 1.0 / _489;
    float _529 = _485 * _503;
    bool _531 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_471);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _507;
    float _545 = -_501;
    float _547 = _545 + 1.0;
    float _549 = fma(_529, _475, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _555 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _557 = isnan(_471);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -_541;
    float _569 = _567 + 1.0;
    float _571 = _541 * _547;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _577 = 1.0 / _553;
    float _579 = -_565;
    float _581 = _579 + 1.0;
    float _583 = _519 * _569;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _585;
    float _589 = _575 * _527;
    float _591 = _501 * _581;
    float _593 = _549 * _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = _471 + _595;
    float _599 = -_519;
    float _601 = _599 + 1.0;
    bool _603 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _605 = isnan(_471);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _587 * _543;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _623 = _471 + _621;
    float _625 = fma(_589, _597, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _627 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[115].x, _593);
    float _629 = -_613;
    float _631 = _629 + 1.0;
    float _633 = _619 * _577;
    float _635 = fma(_615, _623, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _639 = _471 + _637;
    float _641 = fma(_625, _571, _627);
    float _643 = _565 * _631;
    float _645 = fma(_633, _639, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _647 = fma(_635, _591, _641);
    float _649 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_645, _643, _647);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _657 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[119].x, _651);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _661 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _667 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _667;
    out.m_72.y = _669;
    out.m_72.z = _671;
    out.m_72.w = _665;
    out.m_74.x = _661;
    out.m_74.y = _663;
    out.m_74.z = _649;
    out.m_74.w = _673;
    bool _675 = !_525;
    if (!_675)
    {
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _679 = _159 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _179 = _689;
    }
    float _691 = _179;
    float _693 = in.m_46.x;
    float _695 = in.m_46.y;
    float _697 = in.m_46.z;
    float _699 = _159 * 2.0;
    float _701 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _703 = log2(_701);
    float _705 = in.m_55.z;
    float _707 = _341 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _709 = in.m_55.y;
    float _711 = _343 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _713 = floor(_699);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _717 = in.m_64.w;
    float _719 = in.m_68.w;
    float _721 = _703 * _127;
    float _723 = _191 * _695;
    float _725 = _197 * _695;
    float _727 = _203 * _695;
    bool _729 = _713 > 0.0;
    float _731 = fma(_189, _693, _723);
    float _733 = fma(_195, _693, _725);
    float _735 = fma(_201, _693, _727);
    float _737 = _705 * 2.0;
    bool _739 = _713 >= 0.0;
    bool _741 = isnan(_713);
    bool _743 = _739 || _741;
    bool _745 = isnan(0.0);
    bool _747 = _743 || _745;
    float _749 = _709 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _751 = in.m_66.w;
    float _753 = _709 * 2.0;
    float _755 = floor(_737);
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _767 = _765 != 0;
    float _769 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _773 = _747 ? 0 : 1;
    float _775 = fma(_199, _697, _733);
    bool _777 = !_759;
    int _779 = _777 ? 0 : 1;
    float _781 = fma(_749, -2.0, _771);
    float _783 = exp2(_721);
    float _785 = fma(_193, _697, _731);
    float _787 = _709 + _705;
    float _789 = -_715;
    float _791 = fma(_769, 2.0, _789);
    float _793 = fma(_205, _697, _735);
    float _795 = _159 + _709;
    float _797 = _787 + (-1.0);
    bool _799 = !_763;
    int _801 = _799 ? 0 : 1;
    float _803 = floor(_753);
    bool _805 = _755 > 0.0;
    float _807 = -_127;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[76].x, _791);
    bool _811 = _755 >= 0.0;
    bool _813 = isnan(_755);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    float _821 = _785 + _717;
    float _823 = _775 + _751;
    float _825 = _795 + (-1.0);
    float _827 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _829 = int(_827);
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _833 = -_783;
    float _835 = _833 + 1.0;
    bool _837 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _845 = _841 || _843;
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _849 = _823 + _847;
    int _851 = _819 ? 0 : 1;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _855 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _781);
    bool _857 = _803 > 0.0;
    float _859 = _793 + _719;
    bool _861 = _803 >= 0.0;
    bool _863 = isnan(_803);
    bool _865 = _861 || _863;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _873 = _821 + _871;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _877 = int(_875);
    bool _879 = !_767;
    int _881 = _879 ? 0 : 1;
    float _883 = _849 * _849;
    int _885 = ~_851;
    int _887 = _885 + 1;
    int _889 = _887 + 1;
    float _891 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _893 = _845 ? _835 : 0.0;
    float _895 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[78].w, _853);
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _899 = _897 != 0;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _907 = _905 != 0;
    float _909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _911 = _859 + _909;
    int _913 = _889;
    float _915 = _859;
    if (!_805)
    {
        int _917 = ~_851;
        int _919 = _917 + 1;
        _913 = _919;
    }
    int _921 = _913;
    float _923 = fma(_873, _873, _883);
    float _925 = float(_829);
    float _927 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _895);
    bool _929 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _931 = isnan(1.0);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _937 = _933 || _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _941 = 1.0 + _939;
    float _943 = 1.0 / _925;
    bool _945 = !_899;
    int _947 = _945 ? 0 : 1;
    float _949 = fma(_911, _911, _923);
    bool _951 = !_903;
    int _953 = _951 ? 0 : 1;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _957 = float(_877);
    int _959 = abs(_953);
    float _961 = 1.0 / _941;
    float _963 = in.m_76.x;
    float _965 = in.m_76.y;
    float _967 = in.m_76.z;
    float _969 = float(_921);
    float _971 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _955);
    float _973 = _957 * _127;
    int _975 = _869 ? 0 : 1;
    float _977 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _971);
    float _979 = _943 * _127;
    int _981 = abs(_947);
    float _983 = sqrt(_949);
    int _985 = ~_773;
    int _987 = _985 + 1;
    int _989 = _987 + 1;
    float _991 = float(_981);
    int _993 = _989;
    if (_937)
    {
        float _995 = _893 * _961;
        _137 = _995;
    }
    float _997 = _137;
    if (!_729)
    {
        int _999 = ~_773;
        int _1001 = _999 + 1;
        _993 = _1001;
    }
    int _1003 = _993;
    float _1005 = _991 * _969;
    float _1007 = rsqrt(_949);
    float _1009 = float(_1003);
    float _1011 = _1005 * (-2.0);
    float _1013 = float(_959);
    float _1015 = _707 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1017 = ~_975;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    float _1023 = _983 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1025 = fma(_1011, _963, _963);
    float _1027 = _1013 * _1009;
    float _1029 = _159 + (-0.5);
    float _1031 = fma(_891, _1011, _891);
    float _1033 = precise::min(_1015, _1023);
    float _1035 = _1027 * (-2.0);
    float _1037 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1025);
    bool _1039 = !_907;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = _1007 * _1033;
    float _1045 = fma(_831, _1035, _831);
    float _1047 = fma(_1031, _997, _1037);
    float _1049 = fma(_1035, _965, _965);
    float _1051 = _849 * _1043;
    int _1053 = abs(_1041);
    float _1055 = _709 + (-0.5);
    int _1057 = _1021;
    if (!_857)
    {
        int _1059 = ~_975;
        int _1061 = _1059 + 1;
        _1057 = _1061;
    }
    int _1063 = _1057;
    float _1065 = _1047 * 0.15915493667125701904296875;
    float _1067 = _873 * _1043;
    float _1069 = -_1051;
    float _1071 = _849 + _1069;
    float _1073 = float(_1063);
    float _1075 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1049);
    float _1077 = float(_1053);
    float _1079 = -_1067;
    float _1081 = _873 + _1079;
    float _1083 = _1071 * _1071;
    float _1085 = fma(_1045, _997, _1075);
    float _1087 = _159 + _705;
    float _1089 = _1077 * _1073;
    float _1091 = fma(_1081, _1081, _1083);
    float _1093 = _911 * _1043;
    float _1095 = _1087 + (-1.0);
    float _1097 = _1089 * (-2.0);
    float _1099 = -_1093;
    float _1101 = _911 + _1099;
    float _1103 = _705 + (-0.5);
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1107 = fma(_1097, _967, _967);
    float _1109 = fma(_1101, _1101, _1091);
    float _1111 = _1085 * 0.15915493667125701904296875;
    float _1113 = fma(_1105, _1097, _1105);
    float _1115 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1107);
    float _1117 = sqrt(_1109);
    float _1119 = fma(_1113, _997, _1115);
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _1123 = _1119 * 0.15915493667125701904296875;
    float _1125 = _1065 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1111 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    float _1133 = _1007 * _1117;
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _1137 = _711 * _1133;
    float _1139 = _707 * _1133;
    float _1141 = _1111 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1137 * _1121;
    float _1147 = _1065 * 6.283185482025146484375;
    float _1149 = sin(_1147);
    float _1151 = _1127 * _1131;
    float _1153 = _1123 * 6.283185482025146484375;
    float _1155 = cos(_1153);
    float _1157 = _1127 * _1143;
    float _1159 = _1123 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = _1149 * _1131;
    float _1165 = _1149 * _1143;
    float _1167 = _1127 * _1155;
    float _1169 = _1149 * _1155;
    float _1171 = _1143 * _1155;
    float _1173 = _1131 * _1155;
    float _1175 = _1139 * _1135;
    float _1177 = _1167 * _1145;
    float _1179 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1181 = _1179 * 0.5;
    float _1183 = fma(_1161, _1157, _1163);
    float _1185 = -_1165;
    float _1187 = fma(_1161, _1151, _1185);
    float _1189 = -_1145;
    float _1191 = _1161 * _1189;
    float _1193 = -_1151;
    float _1195 = fma(_1161, _1165, _1193);
    float _1197 = fma(_1183, _1175, _1177);
    float _1199 = _1169 * _1145;
    float _1201 = fma(_1171, _1175, _1191);
    float _1203 = fma(_1161, _1163, _1157);
    float _1205 = fma(_1187, _1181, _1197);
    float _1207 = fma(_1195, _1175, _1199);
    float _1209 = fma(_1173, _1181, _1201);
    float _1211 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1213 = fma(_1203, _1181, _1207);
    float _1215 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1217 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1211);
    float _1219 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1215);
    float _1221 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1217);
    float _1223 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1219);
    float _1225 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1227 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1229 = _859 + _1225;
    float _1231 = _821 + _1227;
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1235 = _1229 + _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1239 = _1231 + _1237;
    float _1241 = _1235 * _1235;
    float _1243 = fma(_1239, _1239, _1241);
    float _1245 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1247 = sqrt(_1243);
    float _1249 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1245);
    float _1251 = -_1051;
    float _1253 = _823 + _1251;
    float _1255 = -_1093;
    float _1257 = _859 + _1255;
    float _1259 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1249);
    float _1261 = -_1067;
    float _1263 = _821 + _1261;
    float _1265 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1269 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1265);
    float _1271 = _823 + _1267;
    float _1273 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1269);
    bool _1275 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = _1267;
    float _1279 = _1259;
    float _1281 = _1231;
    if (!_1275)
    {
        _1277 = _1229;
    }
    float _1283 = _1277;
    float _1285 = _1283;
    if (!_1275)
    {
        _1279 = _1271;
    }
    float _1287 = _1279;
    bool _1289 = !_1275;
    float _1291 = _1287;
    if (!_1289)
    {
        float _1293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1297 = _1247 + _1295;
        float _1299 = rsqrt(_1243);
        float _1301 = _1297 * _1293;
        float _1303 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = _1301 * 0.15915493667125701904296875;
        float _1307 = _1305 * 6.283185482025146484375;
        float _1309 = cos(_1307);
        float _1311 = _1305 * 6.283185482025146484375;
        float _1313 = sin(_1311);
        float _1315 = _1309 + (-1.0);
        float _1317 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1319 = fma(_1313, _1303, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1321 = fma(_1271, _1309, _1317);
        float _1323 = _1299 * _1319;
        float _1325 = fma(_1239, _1323, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1327 = fma(_1235, _1323, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1291 = _1321;
        _1281 = _1325;
        _1285 = _1327;
    }
    float _1329 = _1291;
    float _1331 = _1281;
    float _1333 = _1285;
    float _1335 = -_823;
    float _1337 = _1335 + _1329;
    float _1339 = -_821;
    float _1341 = _1339 + _1331;
    float _1343 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1345 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1347 = _1337 * _1337;
    float _1349 = -_859;
    float _1351 = _1349 + _1333;
    float _1353 = 1.0 / _1343;
    float _1355 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1357 = fma(_1341, _1341, _1347);
    float _1359 = -_1067;
    float _1361 = _1359 + _1331;
    float _1363 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1355);
    float _1365 = fma(_1351, _1351, _1357);
    float _1367 = -_1093;
    float _1369 = _1367 + _1333;
    float _1371 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1373 = sqrt(_1365);
    bool _1375 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1377 = isnan(0.5);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1383 = _1379 || _1381;
    float _1385 = _1371 + _1343;
    float _1387 = -_1051;
    float _1389 = _1387 + _1329;
    bool _1391 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1399 = _1395 || _1397;
    float _1401 = _1385 * _1353;
    float _1403 = _1401 * 0.5;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1407 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1405);
    bool _1409 = _1373 > 0.0;
    float _1411 = 1.0 / _1407;
    float _1413 = _1373;
    float _1415 = _1403;
    float _1417 = _1333;
    float _1419 = _1353;
    float _1421 = _1369;
    float _1423 = _1361;
    float _1425 = _1329;
    if (!_1409)
    {
        _1413 = _1361;
    }
    float _1427 = _1413;
    float _1429 = _1427;
    if (!_1409)
    {
        _1415 = _1389;
    }
    float _1431 = _1415;
    float _1433 = _1431;
    if (!_1409)
    {
        _915 = _1369;
    }
    float _1435 = _915;
    bool _1437 = !_1409;
    float _1439 = _1435;
    float _1441 = _1435;
    if (!_1437)
    {
        float _1443 = _235 * _235;
        float _1445 = fma(_227, _227, _1443);
        float _1447 = rsqrt(_1365);
        float _1449 = fma(_241, _241, _1445);
        float _1451 = sqrt(_1449);
        float _1453 = _1341 * _1447;
        float _1455 = _1337 * _1447;
        float _1457 = _1351 * _1447;
        bool _1459 = _1451 > 0.0;
        float _1461 = _1447;
        float _1463 = _1451;
        _1417 = _1453;
        _1419 = _1455;
        if (!_1459)
        {
            _1461 = _1361;
        }
        float _1465 = _1461;
        _1429 = _1465;
        if (!_1459)
        {
            _1463 = _1389;
        }
        float _1467 = _1463;
        _1433 = _1467;
        if (!_1459)
        {
            _1439 = _1369;
        }
        float _1469 = _1439;
        bool _1471 = !_1459;
        _1441 = _1469;
        if (!_1471)
        {
            float _1473 = rsqrt(_1449);
            float _1475 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1477 = _235 * _1473;
            float _1479 = _227 * _1473;
            float _1481 = _1455 * _1477;
            float _1483 = _241 * _1473;
            float _1485 = fma(_1453, _1479, _1481);
            float _1487 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1489 = fma(_1457, _1483, _1485);
            float _1491 = _1489 * _1487;
            float _1493 = fma(_227, _1491, _1361);
            float _1495 = fma(_235, _1491, _1389);
            float _1497 = fma(_241, _1491, _1369);
            _1429 = _1493;
            _1433 = _1495;
            _1441 = _1497;
        }
    }
    float _1499 = _1429;
    float _1501 = _1433;
    float _1503 = _1441;
    float _1505 = _1417;
    float _1507 = _1419;
    float _1509 = _1505;
    float _1511 = _1501;
    float _1513 = _1499;
    float _1515 = _1503;
    float _1517 = _1507;
    if (_1399)
    {
        _1421 = 1.0;
    }
    float _1519 = _1421;
    float _1521 = _1519;
    if (!_1383)
    {
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1525 = _1253 + _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1529 = _1263 + _1527;
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1533 = _1525 * _1525;
        float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1537 = _1257 + _1535;
        float _1539 = fma(_1529, _1529, _1533);
        float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1543 = fma(_1537, _1537, _1539);
        float _1545 = sqrt(_1543);
        float _1547 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = precise::min(_1545, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1551 = _1549 * _1541;
        float _1553 = -_1263;
        float _1555 = _1553 + _1499;
        float _1557 = _1547 * _1551;
        float _1559 = -_1253;
        float _1561 = _1559 + _1501;
        float _1563 = -_1257;
        float _1565 = _1563 + _1503;
        float _1567 = fma(_1555, _1557, _1263);
        float _1569 = fma(_1561, _1557, _1253);
        float _1571 = fma(_1565, _1557, _1257);
        _1509 = _1541;
        _1511 = _1569;
        _1513 = _1567;
        _1515 = _1571;
    }
    float _1573 = _1509;
    float _1575 = _1511;
    float _1577 = _1513;
    float _1579 = _1515;
    float _1581 = _1573;
    if (_1399)
    {
        _1517 = 1.0;
    }
    float _1583 = _1517;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1587 = _1411 * _1585;
    float _1589 = _1583;
    if (!_1399)
    {
        float _1591 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1593 = _1591 * 0.15915493667125701904296875;
        float _1595 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1599 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1597;
        float _1601 = _1593 * 6.283185482025146484375;
        float _1603 = cos(_1601);
        float _1605 = _1595 * 0.15915493667125701904296875;
        float _1607 = _1593 * 6.283185482025146484375;
        float _1609 = sin(_1607);
        float _1611 = 1.0 / _1603;
        float _1613 = _1605 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        float _1617 = _1609 * _1611;
        float _1619 = _1605 * 6.283185482025146484375;
        float _1621 = sin(_1619);
        float _1623 = _1615 * _1617;
        float _1625 = 1.0 / _1599;
        float _1627 = 1.0 / _1623;
        float _1629 = _1621 * _1627;
        float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1633 = fma(_1587, _1629, _1631);
        float _1635 = _1633 * _1625;
        float _1637 = precise::clamp(_1635, 0.0, 1.0);
        _1581 = _1625;
        _1423 = _1593;
        _1425 = _1605;
        _1521 = _1637;
    }
    float _1639 = _1581;
    float _1641 = _1423;
    float _1643 = _1425;
    float _1645 = _1521;
    float _1647 = _1641;
    float _1649 = _1639;
    if (!_1399)
    {
        float _1651 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1653 = _1651 * 0.15915493667125701904296875;
        float _1655 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1657 = _1653 * 6.283185482025146484375;
        float _1659 = cos(_1657);
        float _1661 = _1655 * 0.15915493667125701904296875;
        float _1663 = _1653 * 6.283185482025146484375;
        float _1665 = sin(_1663);
        float _1667 = 1.0 / _1659;
        float _1669 = _1661 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = _1665 * _1667;
        float _1675 = _1661 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        float _1679 = _1671 * _1673;
        float _1681 = 1.0 / _1679;
        float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1685 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1683;
        float _1687 = 1.0 / _1685;
        float _1689 = _1677 * _1681;
        float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1693 = fma(_1587, _1689, _1691);
        float _1695 = _1693 * _1687;
        float _1697 = precise::clamp(_1695, 0.0, 1.0);
        float _1699 = -_1697;
        float _1701 = _1699 + 1.0;
        _1647 = _1679;
        _1649 = _1667;
        _1589 = _1701;
    }
    float _1703 = _1647;
    float _1705 = _1649;
    float _1707 = _1589;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1575 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1715 = _1577 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1719 = _1579 + _1717;
    float _1721 = _1711 * _1711;
    float _1723 = fma(_1715, _1715, _1721);
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1727 = fma(_1719, _1719, _1723);
    float _1729 = rsqrt(_1727);
    float _1731 = sqrt(_1727);
    float _1733 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1735 = _1715 * _1733;
    float _1737 = _1719 * _1733;
    float _1739 = _1735 * _1735;
    float _1741 = _1737 * _1737;
    float _1743 = _1739 + _1741;
    float _1745 = sqrt(_1743);
    bool _1747 = _1745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1751 = _1745 + _1749;
    float _1753 = _1719;
    float _1755 = _1721;
    float _1757 = _1751;
    float _1759 = _1703;
    float _1761 = _1733;
    float _1763 = _1705;
    if (_1747)
    {
        float _1765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1753 = _1765;
    }
    float _1767 = _1753;
    if (_1747)
    {
        float _1769 = rsqrt(_1743);
        _1755 = _1769;
    }
    float _1771 = _1755;
    float _1773 = _1771;
    if (_1747)
    {
        float _1775 = _1751 * _1767;
        _1757 = _1775;
    }
    float _1777 = _1757;
    float _1779 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1747)
    {
        float _1781 = _1777 * 0.15915493667125701904296875;
        _1759 = _1781;
    }
    float _1783 = _1759;
    float _1785 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1779);
    float _1787 = _1767;
    float _1789 = _1783;
    if (_1747)
    {
        float _1791 = _1783 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        _1787 = _1793;
    }
    float _1795 = _1787;
    float _1797 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1799 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1785);
    float _1801 = precise::max(0.0, _1797);
    float _1803 = _1643;
    if (_1747)
    {
        float _1805 = _1783 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        _1803 = _1807;
    }
    float _1809 = _1803;
    float _1811 = _1799 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1813 = -_1733;
    float _1815 = -_1801;
    float _1817 = fma(_1711, _1813, _1815);
    if (_1747)
    {
        float _1819 = _1817 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1761 = _1819;
    }
    float _1821 = _1761;
    float _1823 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1825 = _1795;
    float _1827 = _1821;
    if (_1747)
    {
        float _1829 = fma(_1795, _1821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1763 = _1829;
    }
    float _1831 = _1763;
    float _1833 = _1831;
    if (!_1747)
    {
        _1825 = _1735;
    }
    float _1835 = _1825;
    float _1837 = floor(_1823);
    float _1839 = _1835;
    float _1841 = _1809;
    if (_1747)
    {
        float _1843 = _1809 + (-1.0);
        _1827 = _1843;
    }
    float _1845 = _1827;
    float _1847 = 0.0;
    float _1849 = _1845;
    if (_1747)
    {
        float _1851 = _1771 * _1831;
        _1847 = _1851;
    }
    float _1853 = _1847;
    if (!_1747)
    {
        _1773 = _1817;
    }
    float _1855 = _1773;
    float _1857 = _1855;
    if (_1747)
    {
        float _1859 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1789 = _1859;
    }
    float _1861 = _1789;
    if (_1747)
    {
        float _1863 = _1735 * _1853;
        _1839 = _1863;
    }
    float _1865 = _1839;
    if (!_1747)
    {
        _1849 = _1737;
    }
    float _1867 = _1849;
    float _1869 = _1867;
    if (_1747)
    {
        float _1871 = _1737 * _1853;
        _1869 = _1871;
    }
    float _1873 = _1869;
    if (!_1747)
    {
        _1833 = _1739;
    }
    float _1875 = _1833;
    float _1877 = _1875;
    if (_1747)
    {
        float _1879 = fma(_1817, _1809, _1861);
        _1857 = _1879;
    }
    float _1881 = _1857;
    if (_1747)
    {
        float _1883 = _1865 * _1865;
        _1877 = _1883;
    }
    float _1885 = _1877;
    if (!_1747)
    {
        _1841 = _1741;
    }
    float _1887 = _1841;
    float _1889 = _1887;
    if (_1747)
    {
        float _1891 = _1873 * _1873;
        _1889 = _1891;
    }
    float _1893 = _1889;
    float _1895 = fma(_1881, _1881, _1885);
    float _1897 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1899 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1901 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1903 = _1895 + _1893;
    float _1905 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1907 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1897);
    float _1909 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1899);
    float _1911 = floor(_1901);
    float _1913 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1905);
    float _1915 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1907);
    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1919 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1917);
    float _1921 = precise::clamp(_1919, 0.0, 1.0);
    float _1923 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1909);
    float _1925 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1913);
    float _1927 = _1915 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1929 = -_1921;
    float _1931 = _1929 + 1.0;
    float _1933 = rsqrt(_1903);
    float _1935 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1937 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1939 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1941 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1943 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1939);
    float _1945 = abs(_1931);
    float _1947 = log2(_1945);
    float _1949 = -_1941;
    float _1951 = fma(_1949, _1725, 1.0);
    float _1953 = -_1911;
    float _1955 = _1901 + _1953;
    float _1957 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1943);
    float _1959 = _1933 * _1865;
    float _1961 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1957);
    float _1963 = _1933 * _1881;
    float _1965 = _1933 * _1873;
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1969 = -_1837;
    float _1971 = _1823 + _1969;
    float _1973 = log2(_1951);
    float _1975 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1977 = -_1967;
    float _1979 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1977);
    float _1981 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1983 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1975);
    float _1985 = -_1965;
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1979);
    float _1989 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1991 = 1.0 / _1961;
    float _1993 = _1963 + 1.0;
    float _1995 = fma(_1987, -0.5, 0.5);
    float _1997 = fma(_1987, 0.5, 0.5);
    float _1999 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1989);
    float _2001 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1983);
    float _2003 = fma(_1997, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2005 = exp2(_1981);
    float _2007 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1999);
    float _2009 = _1973 * 0.693147182464599609375;
    float _2011 = fma(_1997, _2003, -0.212114393711090087890625);
    float _2013 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2015 = fma(_1997, _2011, 1.570728778839111328125);
    float _2017 = sqrt(_1995);
    float _2019 = -_1963;
    float _2021 = fma(_2005, _1993, _2019);
    float _2023 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2001);
    float _2025 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2007);
    float _2027 = fma(_2021, 0.5, 0.5);
    float _2029 = _2023 * _1991;
    float _2031 = _2025 * _1991;
    float _2033 = _2017 * 0.636619746685028076171875;
    float _2035 = fma(_2029, 0.5, 0.5);
    float _2037 = fma(_2031, -0.5, 0.5);
    float _2039 = -_2015;
    float _2041 = fma(_2033, _2039, 1.0);
    float2 _6449 = float2(_1971, _1955);
    float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6449, float2(0.0), isnan(_6449)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6449, float2(0.0), isnan(_6449)), level(0.0)).x;
    float3 _6460 = float3(_2035, _2037, _2013);
    float _2045 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6460, float3(0.0), isnan(_6460)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6460, float3(0.0), isnan(_6460)), level(0.0)).x;
    float3 _6471 = float3(_2035, _2037, _2013);
    float4 _2048 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6471, float3(0.0), isnan(_6471)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6471, float3(0.0), isnan(_6471)), level(0.0)).xyzw;
    float _2050 = _2048.x;
    float _2052 = _2048.y;
    float _2054 = _2048.z;
    float _2056 = _2048.w;
    float2 _6487 = float2(_2041, _2027);
    float3 _2060 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6487, float2(0.0), isnan(_6487)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6487, float2(0.0), isnan(_6487)), level(0.0)).xyz;
    float _2062 = _2060.x;
    float _2064 = _2060.y;
    float _2066 = _2060.z;
    float _2068 = float(uint(_877));
    float _2070 = trunc(_979);
    int _2072 = int(_2070);
    int _2074 = ~_877;
    int _2076 = _2074 + 1;
    float _2078 = -_977;
    float _2080 = _2078 + 1.0;
    int _2082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2084 = _2082 != 0;
    float _2086 = _973 * _169;
    int _2088 = ~_877;
    int _2090 = _2088 + 1;
    float _2092 = -_927;
    float _2094 = _2092 + 1.0;
    bool _2096 = _159 > 0.5;
    float _2098 = 1.0 / _2068;
    out.m_78.x = _1263;
    out.m_78.y = _1253;
    out.m_78.z = _1257;
    bool _2100 = _709 > 0.5;
    float _2102 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2106 = _2104 != 0;
    out.m_80.w = _1033;
    int _2108 = abs(_801);
    float _2110 = trunc(_2086);
    int _2112 = int(_2110);
    float _2114 = float(uint(_2072));
    out.m_82.x = _1139;
    float _2116 = float(_2072);
    int _2118 = abs(_779);
    float _2120 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2122 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2124 = isnan(_691);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2130 = _2126 || _2128;
    float _2132 = float(_2130);
    float _2134 = exp2(_2102);
    int _2136 = as_type<int>(_2098) + (-2);
    out.m_84.x = _1577;
    out.m_84.y = _1575;
    out.m_84.z = _1579;
    float _2138 = -_2132;
    float _2140 = _2138 + 1.0;
    float _2142 = as_type<float>(_2136) * _2114;
    int _2144 = ~_877;
    int _2146 = _2144 + 1;
    float _2148 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2150 = _2148 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2152 = trunc(_2142);
    float _2154 = precise::max(_2152, 0.0);
    uint _2157 = uint(_2154);
    float _2159 = -_2134;
    float _2161 = _2159 + 1.0;
    float _2163 = 1.0 / _2150;
    int _2165 = _2090 * int(_2157);
    int _2167 = _2165 + _2072;
    float _2169 = float(uint(_2167));
    float _2171 = as_type<float>(_2136) * _2169;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2175 = _2173 != 0;
    float _2177 = trunc(_2171);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    bool _2183 = !_2175;
    float _2185 = _2183 ? 7.345489978790283203125 : 1.0;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2191 = _2185 * _159;
    bool _2193 = _2116 >= _957;
    bool _2195 = isnan(_2116);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan(_957);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = floor(_2191);
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2209 = _2207 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2211 = int(_2157) + int(_2181);
    float _2213 = trunc(_2203);
    int _2215 = int(_2213);
    int _2217 = _2076 * _2211;
    int _2219 = _2217 + _2072;
    bool _2221 = uint(_2219) >= uint(_877);
    float _2223 = -_2205;
    float _2225 = _2191 + _2223;
    float _2227 = 1.0 / _2189;
    bool _2229 = !_2221;
    int _2231 = _2229 ? 0 : (-1);
    float _2233 = _2225 * _957;
    bool _2235 = _877 == 0;
    float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2239 = _2237 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2241 = ~_2211;
    int _2243 = _2241 + _2231;
    int _2245 = _2243 + 1;
    float _2247 = 1.0 / _2209;
    int _2249 = _877 * _2245;
    int _2251 = _2249 + _2072;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2255 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2253;
    float _2257 = trunc(_2233);
    int _2259 = int(_2257);
    int _2261 = ~_2215;
    int _2263 = _2261 + 1;
    int _2265 = _2263 + 1;
    float _2267 = _2255 * _2227;
    bool _2269 = !_2235;
    int _2271 = _2269 ? _2251 : (-1);
    float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2277 = !_2106;
    int _2279 = _2277 ? 0 : 1;
    int _2281 = _2271 * _2265;
    int _2283 = _877 + (-1);
    float _2285 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2289 = abs(_2279);
    float _2291 = 1.0 / _2275;
    float _2293 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2295 = _2293 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2297 = _2215 * _2283;
    int _2299 = _2297 + _2281;
    float _2301 = _2287 * _2247;
    int _2303 = abs(_881);
    float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2307 = _691 + _2305;
    int _2309 = _2299 * _2108;
    float _2311 = fma(_2267, _2307, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2313 = _2259 * _2289;
    int _2315 = _2313 + _2072;
    int _2317 = _2112 * _2118;
    int _2319 = _2317 + _2309;
    bool _2321 = !_2084;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = 1.0 / _2239;
    bool _2327 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2329 = isnan(_691);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2335 = _2331 || _2333;
    float _2337 = float(_2335);
    int _2339 = _2315 * _2303;
    int _2341 = _2339 + _2319;
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2343;
    bool _2347 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2349 = isnan(_691);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2355 = _2351 || _2353;
    float _2357 = float(_2355);
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2363 = abs(_2323);
    float _2365 = _2345 * _2291;
    bool _2367 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2369 = isnan(_691);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2375 = _2371 || _2373;
    float _2377 = float(_2375);
    float _2379 = -_2357;
    float _2381 = _2379 + 1.0;
    bool _2383 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2385 = isnan(_691);
    bool _2387 = _2383 || _2385;
    bool _2389 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2391 = _2387 || _2389;
    float _2393 = float(_2391);
    float _2395 = 1.0 / _2295;
    float _2397 = _2337 * _2381;
    float _2399 = -_2337;
    float _2401 = _2399 + 1.0;
    float _2403 = -_2377;
    float _2405 = _2403 + 1.0;
    float _2407 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2409 = _2407 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2411 = _2377 * _2401;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2415 = _2413 != 0;
    int _2417 = _2259 * _2363;
    int _2419 = _2417 + _2341;
    bool _2421 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2423 = isnan(_691);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2429 = _2425 || _2427;
    float _2431 = float(_2429);
    float _2433 = _2393 * _2405;
    float _2435 = -_2393;
    float _2437 = _2435 + 1.0;
    bool _2439 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2441 = isnan(_691);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2447 = _2443 || _2445;
    float _2449 = float(_2447);
    float _2451 = 1.0 / _2409;
    float _2453 = float(uint(_2419));
    float _2455 = _2431 * _2437;
    float _2457 = -_2431;
    float _2459 = _2457 + 1.0;
    int _2461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2463 = _2461 != 0;
    float _2465 = as_type<float>(_2136) * _2453;
    float _2467 = _2449 * _2459;
    float _2469 = -_2449;
    float _2471 = _2469 + 1.0;
    bool _2473 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2475 = isnan(_691);
    bool _2477 = _2473 || _2475;
    bool _2479 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2481 = _2477 || _2479;
    float _2483 = float(_2481);
    float _2485 = trunc(_2465);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = _2132 * _2471;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2493;
    float _2497 = _2483 * _2140;
    float _2499 = -_2483;
    float _2501 = _2499 + 1.0;
    float _2503 = _2361 * _2451;
    float _2505 = _2495 * _2325;
    float _2507 = _2311 * _2497;
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2511 = _2509 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2513 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2515 = _691 + _2513;
    float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2517;
    float _2521 = fma(_2301, _2515, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2523 = _2146 * int(_2489);
    int _2525 = _2523 + _2419;
    float _2527 = _2511 * _2395;
    float _2529 = _2519 * _2163;
    float _2531 = fma(_2501, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2507);
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2535 = _691 + _2533;
    float _2537 = float(uint(_2525));
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2541 = _691 + _2539;
    float _2543 = fma(_2521, _2491, _2531);
    float _2545 = fma(_2365, _2535, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2549 = _691 + _2547;
    float _2551 = as_type<float>(_2136) * _2537;
    float _2553 = float(uint(_2315));
    float _2555 = fma(_2503, _2541, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2559 = _691 + _2557;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2563 = _691 + _2561;
    float _2565 = fma(_2505, _2549, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2567 = trunc(_2551);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    float _2573 = as_type<float>(_2136) * _2553;
    float _2575 = fma(_2527, _2559, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2577 = -_231;
    int _2579 = _2100 ? as_type<int>(_2577) : as_type<int>(_231);
    float _2581 = fma(_2545, _2467, _2543);
    int _2583 = ~_877;
    int _2585 = _2583 + 1;
    float _2587 = fma(_2529, _2563, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2589 = ~_877;
    int _2591 = _2589 + 1;
    float _2593 = trunc(_2573);
    float _2595 = precise::max(_2593, 0.0);
    uint _2597 = uint(_2595);
    float _2599 = fma(_2555, _2455, _2581);
    float _2601 = -_239;
    int _2603 = _2096 ? as_type<int>(_2601) : as_type<int>(_239);
    float _2605 = fma(_2565, _2433, _2599);
    int _2607 = int(_2489) + int(_2571);
    float _2609 = fma(_2575, _2411, _2605);
    bool _2611 = !_2415;
    float _2613 = _2611 ? _231 : as_type<float>(_2579);
    float _2615 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2617 = fma(_2587, _2397, _2609);
    bool _2619 = !_2463;
    float _2621 = _2619 ? _239 : as_type<float>(_2603);
    int _2623 = _2591 * int(_2597);
    int _2625 = _2623 + _2315;
    float _2627 = _2613 + (-0.5);
    int _2629 = _2585 * _2607;
    int _2631 = _2629 + _2419;
    float _2633 = _2621 + 0.5;
    float _2635 = fma(_2357, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2617);
    float _2637 = float(uint(_2625));
    float _2639 = -_2627;
    float _2641 = -_855;
    float _2643 = fma(_2639, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2641);
    bool _2645 = uint(_2631) >= uint(_877);
    float _2647 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[80].x, _809);
    int _2649 = ~_877;
    int _2651 = _2649 + 1;
    float _2653 = as_type<float>(_2136) * _2637;
    bool _2655 = !_2645;
    int _2657 = _2655 ? 0 : (-1);
    float _2659 = -_2080;
    float _2661 = fma(_2621, _2659, _2647);
    int _2663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2665 = _2663 != 0;
    float _2667 = trunc(_2653);
    float _2669 = precise::max(_2667, 0.0);
    uint _2671 = uint(_2669);
    int _2673 = ~_2607;
    int _2675 = _2673 + _2657;
    int _2677 = _2675 + 1;
    float _2679 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2681 = fma(_2613, _2094, _2643);
    float _2683 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_86.x = _2635;
    int _2685 = _877 * _2677;
    int _2687 = _2685 + _2419;
    float _2689 = -_1161;
    float _2691 = fma(_2689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2679);
    out.m_88.x = _2661;
    out.m_88.y = _2681;
    bool _2693 = !_2235;
    int _2695 = _2693 ? _2687 : (-1);
    int _2697 = _2695 >> 31;
    int _2699 = int(_2597) + int(_2671);
    int _2701 = _2697 & 3;
    float _2703 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2120);
    float _2705 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2707 = _2695 + _2701;
    float _2709 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2711 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2713 = _2651 * _2699;
    int _2715 = _2713 + _2315;
    int _2717 = _2707 >> 2;
    float _2719 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2691);
    float _2721 = -_1161;
    float _2723 = fma(_2721, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2705);
    float _2725 = -_1161;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2709);
    int _2729 = _2717 << 4;
    int _2731 = _2729 + 368;
    float _2733 = _2615 * _2719;
    float _2735 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2723);
    float _2737 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2727);
    uint _2739 = uint(int(uint(_2731) >> uint(2)));
    uint _2741 = uint(int(uint(int(_2739)) >> uint(2)));
    int _2743 = int(_2739) & 3;
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[int(_2741)][_2743];
    int _2747 = int(_2739) + 1;
    uint _2749 = uint(int(uint(_2747) >> uint(2)));
    int _2751 = _2747 & 3;
    float _2753 = (*spvDescriptorSet0.vp_c9)._m0[int(_2749)][_2751];
    bool _2755 = uint(_2715) >= uint(_877);
    float _2757 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2711);
    float _2759 = _2615 * _2735;
    float _2761 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2763 = _2615 * _2737;
    int _2765 = _2695 & 3;
    bool _2767 = _2765 != 0;
    float _2769 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2703);
    int _2771 = _2731 + 8;
    uint _2773 = uint(int(uint(_2771) >> uint(2)));
    uint _2775 = uint(int(uint(int(_2773)) >> uint(2)));
    int _2777 = int(_2773) & 3;
    float _2779 = (*spvDescriptorSet0.vp_c9)._m0[int(_2775)][_2777];
    int _2781 = int(_2773) + 1;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    int _2785 = _2781 & 3;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[int(_2783)][_2785];
    float _2789 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2761);
    bool _2791 = uint(_2765) > 1u;
    float _2793 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2683);
    int _2795 = _2695 & 3;
    bool _2797 = _2795 != 0;
    float _2799 = abs(_1587);
    float _2801 = log2(_2799);
    float _2803 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2805 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2807 = _2797 ? 0 : 1;
    float _2809 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2757);
    float _2811 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2813 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2789);
    int _2815 = ~_2807;
    int _2817 = _2815 + 1;
    int _2819 = _2817 + 1;
    float _2821 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2803);
    bool _2823 = !_2755;
    int _2825 = _2823 ? 0 : (-1);
    float _2827 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2805);
    int _2829 = _2819;
    float _2831 = _2025;
    if (!_2791)
    {
        int _2833 = ~_2807;
        int _2835 = _2833 + 1;
        _2829 = _2835;
    }
    int _2837 = _2829;
    float _2839 = fma(_2811, _2769, _2759);
    bool _2841 = _2765 != 3;
    float _2843 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2793);
    int _2845 = abs(_2837);
    float _2847 = _2801 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2849 = ~_2699;
    int _2851 = _2849 + _2825;
    int _2853 = _2851 + 1;
    float _2855 = fma(_2811, _2809, _2733);
    bool _2857 = uint(_2765) >= 2u;
    float _2859 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2821);
    float _2861 = exp2(_2847);
    int _2863 = _2857 ? 0 : 1;
    int _2865 = _877 * _2853;
    int _2867 = _2865 + _2315;
    int _2869 = ~_2845;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    float _2875 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2827);
    bool _2877 = !_2767;
    int _2879 = _2877 ? 0 : 1;
    float _2881 = -_2043;
    float _2883 = _2881 + 1.0;
    int _2885 = ~_2863;
    int _2887 = _2885 + 1;
    int _2889 = _2887 + 1;
    bool _2891 = _2765 != 3;
    int _2893 = _2889;
    float _2895 = _2050;
    float _2897 = _2859;
    if (_2841)
    {
        int _2899 = ~_2863;
        int _2901 = _2899 + 1;
        _2893 = _2901;
    }
    int _2903 = _2893;
    int _2905 = abs(_2879);
    int _2907 = _2873 * as_type<int>(_2753);
    bool _2909 = !_2891;
    int _2911 = _2909 ? 0 : (-1);
    int _2913 = abs(_2903);
    int _2915 = ~_2905;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    bool _2921 = !_2665;
    int _2923 = _2921 ? 0 : 1;
    int _2925 = _2919 * as_type<int>(_2745);
    int _2927 = _2925 + _2907;
    int _2929 = abs(_2911);
    float _2931 = fma(_2861, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2933 = precise::clamp(_2931, 0.0, 1.0);
    int _2935 = abs(_2923);
    int _2937 = ~_2913;
    int _2939 = _2937 + 1;
    int _2941 = _2939 + 1;
    float _2943 = fma(_2933, -2.0, 3.0);
    float _2945 = _2933 * _2933;
    int _2947 = ~_2929;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    int _2953 = _2941 * as_type<int>(_2779);
    int _2955 = _2953 + _2927;
    int _2957 = ~_2935;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    float _2963 = _2945 * _2943;
    float _2965 = in.m_90.x;
    int _2967 = _2951 * as_type<int>(_2787);
    int _2969 = _2967 + _2955;
    bool _2971 = !_2235;
    int _2973 = _2971 ? _2867 : (-1);
    float _2975 = -_2963;
    float _2977 = _2975 + 1.0;
    float _2979 = _1927 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2981 = _2969 * _2961;
    bool _2983 = _1587 <= 8000.0;
    bool _2985 = isnan(_1587);
    bool _2987 = _2983 || _2985;
    bool _2989 = isnan(8000.0);
    bool _2991 = _2987 || _2989;
    float _2993 = float(_2991);
    float _2995 = fma(_2977, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2963);
    float _2997 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2979);
    int _2999 = _2973 * _2935;
    int _3001 = _2999 + _2981;
    float _3003 = fma(_2811, _2813, _2763);
    float _3005 = _2993 * _2995;
    float _3007 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2997);
    float _3009 = _2023 + _1961;
    float _3011 = float(_3001);
    float _3013 = _1961 * 0.5;
    float _3015 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3017 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3007);
    float _3019 = fma(_2025, -0.5, _3013);
    float _3021 = _2843 + _2839;
    float _3023 = _2883 * _3015;
    float _3025 = precise::clamp(_3023, 0.0, 1.0);
    float _3027 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2023;
    out.gl_Position.y = _2025;
    out.gl_Position.z = _3017;
    out.gl_Position.w = _1961;
    float _3029 = _3017 + _1961;
    float _3031 = -_3025;
    float _3033 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3035 = _3009 * 0.5;
    out.m_92.x = _3011;
    float _3037 = _3029 * 0.5;
    float _3039 = _3033 * _2965;
    float _3041 = _2859 + _2855;
    float _3043 = _2875 + _3003;
    bool _3045 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3047 = isnan(_1731);
    bool _3049 = _3045 || _3047;
    bool _3051 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3053 = _3049 || _3051;
    float _3055 = _3039 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _3035;
    out.m_94.y = _3019;
    out.m_94.z = _3037;
    out.m_94.w = _1961;
    float _3057 = _3027 * _2045;
    float _3059 = -_3027;
    float _3061 = _3059 + 1.0;
    out.m_96.x = _3055;
    float _3063 = _2056 * _3057;
    float _3065 = _2066 * _3057;
    float _3067 = _2056 * _3061;
    float _3069 = in.m_90.z;
    float _3071 = fma(_2062, _3063, _2050);
    float _3073 = fma(_2064, _3063, _2052);
    float _3075 = fma(_2056, _3065, _2054);
    out.m_98.x = _3021;
    out.m_98.y = _3041;
    out.m_98.z = _3043;
    float _3077 = _1645 * _1707;
    float _3079 = _3017;
    if (!_3053)
    {
        _2831 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3081 = _2831;
    out.m_100.x = _3071;
    out.m_100.y = _3073;
    out.m_100.z = _3075;
    out.m_100.w = _3067;
    float _3083 = _3077 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3085 = _3083;
    float _3087 = _3081;
    float _3089 = _3081;
    if (!_3053)
    {
        _2895 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3091 = _2895;
    float _3093 = _3091;
    float _3095 = _3091;
    if (!_3053)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3097 = _3079;
    float _3099 = _3097;
    float _3101 = _3097;
    if (!_3053)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3103 = _2897;
    float _3105 = _3083 * _3069;
    float _3107 = _3069;
    float _3109 = _3103;
    float _3111 = _3103;
    if (!_3053)
    {
        _3107 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3113 = _3107;
    float _3115 = _3113;
    float _3117 = _3113;
    if (!_3053)
    {
        _3085 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3119 = _3085;
    bool _3121 = !_3053;
    float _3123 = _3119;
    float _3125 = _3119;
    if (!_3121)
    {
        bool _3127 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3129 = isnan(_1731);
        bool _3131 = _3127 || _3129;
        bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3135 = _3131 || _3133;
        if (!_3135)
        {
            float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3139 = _1731 + _3137;
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3141;
            float _3145 = 1.0 / _3143;
            float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3167 = _3139 * _3145;
            float _3169 = precise::clamp(_3167, 0.0, 1.0);
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3095 = _3175;
            _3111 = _3183;
            _3089 = _3177;
            _3117 = _3181;
            _3101 = _3179;
            _3125 = _3185;
            _3187 = true;
        }
        else
        {
            bool _3189 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3191 = isnan(_1731);
            bool _3193 = _3189 || _3191;
            bool _3195 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3197 = _3193 || _3195;
            if (!_3197)
            {
                _3087 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3199 = _3087;
            _3089 = _3199;
            if (!_3197)
            {
                _3093 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3201 = _3093;
            _3095 = _3201;
            if (!_3197)
            {
                _3099 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3203 = _3099;
            _3101 = _3203;
            if (!_3197)
            {
                _3115 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3205 = _3115;
            _3117 = _3205;
            if (!_3197)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3207 = _3109;
            _3111 = _3207;
            if (!_3197)
            {
                _3123 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3209 = _3123;
            bool _3211 = !_3197;
            _3125 = _3209;
            if (!_3211)
            {
                bool _3213 = _1731 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3215 = isnan(_1731);
                bool _3217 = _3213 || _3215;
                bool _3219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3221 = _3217 || _3219;
                if (!_3221)
                {
                    float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3225 = _1731 + _3223;
                    float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3229 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3227;
                    float _3231 = 1.0 / _3229;
                    float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3253 = _3225 * _3231;
                    float _3255 = precise::clamp(_3253, 0.0, 1.0);
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3261 = fma(_3255, _3235, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3263 = fma(_3255, _3259, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3265 = fma(_3255, _3239, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3267 = fma(_3255, _3243, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3269 = fma(_3255, _3247, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3271 = fma(_3255, _3251, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3095 = _3261;
                    _3111 = _3269;
                    _3089 = _3263;
                    _3117 = _3267;
                    _3101 = _3265;
                    _3125 = _3271;
                    _3187 = true;
                }
                else
                {
                    _3095 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3089 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3117 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3101 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3125 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3187 = false;
    float _3273 = _3095;
    float _3275 = _3111;
    float _3277 = _3089;
    float _3279 = _3117;
    float _3281 = _3101;
    float _3283 = _3125;
    float _3285 = fma(_3041, -0.5, 0.5);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = -_3273;
    float _3291 = _3289 + _3275;
    float _3293 = _3105 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3295 = -_3277;
    float _3297 = _3295 + _3279;
    out.m_102.x = 0.0;
    float _3299 = fma(_3287, _3291, _3273);
    float _3301 = fma(_3287, _3297, _3277);
    out.m_53.x = _3293;
    float _3303 = -_3281;
    float _3305 = _3303 + _3283;
    float _3307 = _3299 * 0.586610972881317138671875;
    bool _3309 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3311 = fma(_3287, _3305, _3281);
    float _3313 = fma(_3301, 0.298911988735198974609375, _3307);
    bool _3315 = _1645 > 0.0;
    bool _3317 = isnan(_1645);
    bool _3319 = _3315 || _3317;
    bool _3321 = isnan(0.0);
    bool _3323 = _3319 || _3321;
    float _3325 = fma(_3311, 0.114477999508380889892578125, _3313);
    bool _3327 = _1707 <= 0.0;
    bool _3329 = !_3323;
    bool _3331 = _3327 || _3329;
    float _3333 = -_3325;
    float _3335 = _3301 + _3333;
    float _3337 = -_3325;
    float _3339 = _3299 + _3337;
    float _3341 = -_3325;
    float _3343 = _3311 + _3341;
    float _3345 = fma(_3335, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3325);
    float _3347 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3325);
    float _3349 = fma(_3343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3325);
    bool _3351 = !_3309;
    if (!_3351)
    {
        float _3353 = -_1575;
        float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3357 = -_1577;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3361 = -_1579;
        float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3365 = _3355 * _3355;
        float _3367 = fma(_3359, _3359, _3365);
        float _3369 = fma(_3363, _3363, _3367);
        float _3371 = sqrt(_3369);
        float _3373 = rsqrt(_3369);
        float _3375 = -_3371;
        float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3379 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = _3359 * _3373;
        float _3385 = _3355 * _3373;
        float _3387 = abs(_3381);
        float _3389 = log2(_3387);
        float _3391 = _3363 * _3373;
        float _3393 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3395 = _3041 * _3385;
        float _3397 = -_3385;
        float _3399 = -_3393;
        float _3401 = fma(_3397, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3399);
        float _3403 = fma(_3021, _3383, _3395);
        float _3405 = -_3391;
        float _3407 = fma(_3405, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3401);
        float _3409 = fma(_3043, _3391, _3403);
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3415 = _3407 + _3413;
        float _3417 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3419 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3421 = precise::clamp(_3419, 0.0, 1.0);
        float _3423 = exp2(_3417);
        float _3425 = _3423 * _3421;
        float _3427 = _3411 * _3425;
        float _3429 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3431 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3433 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3429;
        out.m_102.y = _3431;
        out.m_102.z = _3433;
    }
    out.m_80.x = _3345;
    out.m_80.y = _3347;
    out.m_80.z = _3349;
    if (!_3331)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3435 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3435;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

