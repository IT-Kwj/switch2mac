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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_58 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_90 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_80 [[user(locn13)]];
    float4 m_76 [[user(locn14)]];
    float4 m_78 [[user(locn15)]];
    float4 m_66 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4501 = false;
    bool _639 = false;
    bool _453 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4800 = as_type<float>(_125);
        out.gl_Position.z = _4800;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_49.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4869 = as_type<float>(_163);
        out.gl_Position.z = _4869;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _169 = as_type<int>(_165) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_165) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_167;
    float _203;
    if (!_185)
    {
        float _187 = in.m_54.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_109);
        float _209 = 1.0 / _207;
        float _211 = _143 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _213 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _239 = in.m_56.x;
    float _241 = in.m_56.y;
    float _243 = 1.0 / _225;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = 1.0 / _229;
    float _249 = 1.0 / _233;
    float _251 = _217 * _243;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = _213 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _259 = _213 + _257;
    float _261 = 1.0 / _237;
    float _263 = _221 * _247;
    bool _265 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _267 = isnan(_213);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_213);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _255 * _249;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _291;
    bool _295 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _297 = isnan(_213);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = fma(_293, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = -_305;
    float _311 = _309 + 1.0;
    float _313 = _259 * _261;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    bool _319 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _321 = isnan(_213);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _275 * _311;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = fma(_317, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = -_275;
    float _341 = _339 + 1.0;
    bool _343 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _345 = isnan(_213);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = fma(_335, _263, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = _329 * _341;
    float _363 = -_329;
    float _365 = _363 + 1.0;
    float _367 = fma(_357, _263, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = -_353;
    float _371 = _369 + 1.0;
    float _373 = _287 * _365;
    float _375 = -_287;
    float _377 = _375 + 1.0;
    float _379 = _353 * _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = _307 * _379;
    float _391 = _337 * _379;
    float _393 = fma(_383, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_387, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _389);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _391);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _409 = fma(_367, _373, _397);
    float _411 = fma(_359, _373, _399);
    float _413 = fma(_403, _313, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _415 = fma(_407, _313, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _417 = fma(_393, _361, _409);
    float _419 = fma(_395, _361, _411);
    float _421 = fma(_413, _331, _417);
    float _423 = fma(_415, _331, _419);
    float _425 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[147].x, _421);
    float _427 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[147].y, _423);
    float _429 = _425 * _239;
    float _431 = _427 * _241;
    bool _433 = !_245;
    float _451;
    if (!_433)
    {
        float _435 = in.m_54.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].x, _143);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_109);
        float _457 = 1.0 / _455;
        float _459 = _143 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _461 + _463;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _461 + _479;
    bool _483 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _485 = isnan(_461);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _503 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _505 = isnan(_461);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_477;
    float _517 = _515 + 1.0;
    float _519 = 1.0 / _501;
    float _521 = _513 * _517;
    float _523 = -_513;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _533 = 1.0 / _497;
    float _535 = _493 * _525;
    float _537 = -_493;
    float _539 = _537 + 1.0;
    float _541 = _481 * _519;
    float _543 = _465 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_529, _543, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _555 = fma(_547, _543, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = fma(_551, _543, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _559 = _553 * _535;
    float _561 = _555 * _535;
    float _563 = _557 * _535;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _577 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].x, _559);
    float _579 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].y, _561);
    float _581 = fma(_567, _541, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _583 = fma(_571, _541, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _585 = fma(_575, _541, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].z, _563);
    float _589 = fma(_581, _521, _577);
    float _591 = fma(_583, _521, _579);
    float _593 = fma(_585, _521, _587);
    float _595 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].x, _589);
    float _597 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].y, _591);
    float _599 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    float _601 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _607 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _607;
    out.m_58.y = _609;
    out.m_58.z = _611;
    bool _613 = !_531;
    float _615 = _541;
    float _617 = _587;
    int _619 = as_type<int>(_605);
    float _637;
    if (!_613)
    {
        float _621 = in.m_54.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].z, _143);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_109);
        float _643 = 1.0 / _641;
        float _645 = _143 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = in.m_54.z;
    float _651 = in.m_54.w;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _655 = _653 != 0;
    float _657 = _577;
    float _659 = _559;
    if (_655)
    {
        float _661 = in.m_54.x;
        float _663 = in.m_54.y;
        _657 = _661;
        _659 = _663;
    }
    float _665 = _657;
    float _667 = _659;
    float _669 = 0.0;
    if (_655)
    {
        _669 = 1.0;
    }
    float _671 = _669;
    float _673 = 0.0;
    float _675 = _671;
    if (_655)
    {
        _673 = 1.0;
    }
    float _677 = _673;
    float _679 = 0.0;
    float _681 = _677;
    if (_655)
    {
        _679 = 1.0;
    }
    float _683 = _679;
    float _685 = _649 * 2.0;
    float _687 = floor(_685);
    float _689 = 0.0;
    float _691 = _665;
    float _693 = _667;
    float _695 = _683;
    if (_655)
    {
        _689 = _665;
    }
    float _697 = _689;
    float _699 = _697;
    if (_655)
    {
        _615 = _667;
    }
    float _701 = _615;
    bool _703 = _687 > 0.0;
    bool _705 = _687 >= 0.0;
    bool _707 = isnan(_687);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    float _715 = _687;
    float _717 = _701;
    if (_655)
    {
        _715 = _697;
    }
    float _719 = _715;
    int _721 = _713 ? 0 : 1;
    int _723 = _721;
    float _725 = _719;
    if (_655)
    {
        _617 = _697;
    }
    float _727 = _617;
    int _729 = ~_721;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    int _735 = _733;
    float _737 = _727;
    if (!_703)
    {
        int _739 = ~_721;
        int _741 = _739 + 1;
        _735 = _741;
    }
    int _743 = _735;
    if (_655)
    {
        _619 = 0;
        _723 = 0;
    }
    int _745 = _619;
    int _747 = _723;
    int _749 = _745;
    int _751 = _747;
    if (!_655)
    {
        float _753 = in.m_54.x;
        float _755 = in.m_54.y;
        float _757 = in.m_54.z;
        float _759 = _753 * 3.1415927410125732421875;
        float _761 = _755 * 3.1415927410125732421875;
        float _763 = _759 * 0.15915493667125701904296875;
        float _765 = _761 * 0.15915493667125701904296875;
        float _767 = _763 * 6.283185482025146484375;
        float _769 = sin(_767);
        float _771 = _765 * 6.283185482025146484375;
        float _773 = sin(_771);
        _691 = _753;
        _693 = _755;
        _749 = 1;
        _725 = _769;
        _751 = 2;
        _717 = _773;
        _681 = 1.2345600128173828125;
        _699 = _755;
        _675 = 7.345489978790283203125;
        _695 = 5.839270114898681640625;
        _737 = _757;
    }
    float _775 = _691;
    float _777 = _693;
    int _779 = _749;
    float _781 = _725;
    int _783 = _751;
    float _785 = _717;
    float _787 = _681;
    float _789 = _699;
    float _791 = _675;
    float _793 = _695;
    float _795 = _737;
    float _797 = _775 * 2.0;
    float _799 = _777 * 2.0;
    bool _801 = _779 != 1;
    float _803 = _781 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _805 = floor(_797);
    float _807 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _809 = _777 + _775;
    bool _811 = _783 != 2;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _815 = floor(_799);
    bool _817 = _649 > 0.5;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _821 = fma(_807, -2.0, _813);
    float _823 = _797;
    float _825 = _807;
    float _827 = _799;
    float _829 = _803;
    if (!_801)
    {
        _823 = _649;
    }
    float _831 = _823;
    float _833 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _835 = int(_811);
    int _837 = _801 ? 2 : 0;
    int _839 = _835 | _837;
    int _841 = _817 ? 4 : 0;
    int _843 = _839 | _841;
    int _845 = false ? 8 : 0;
    int _847 = _843 | _845;
    int _849 = false ? 16 : 0;
    int _851 = _847 | _849;
    int _853 = false ? 32 : 0;
    int _855 = _851 | _853;
    int _857 = false ? 64 : 0;
    int _859 = _855 | _857;
    int _861 = _859 & 4;
    float _863 = -_819;
    float _865 = fma(_803, 2.0, _863);
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _869 = _867 != 0;
    int _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _873 = _871 != 0;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _877 = _875 != 0;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _881 = int(_879);
    float _883 = -_183;
    float _885 = _817 ? _883 : _183;
    float _887 = -_143;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[91].x, _865);
    bool _891 = _777 > 0.5;
    float _893 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _821);
    float _895 = _831;
    float _897 = _885;
    if (!_801)
    {
        _825 = _649;
    }
    float _899 = _825;
    float _901 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = _899;
    if (!_801)
    {
        _827 = _777;
    }
    float _905 = _827;
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _909 = int(_907);
    float _911 = _905;
    if (!_801)
    {
        _829 = _777;
    }
    float _913 = _829;
    int _915 = int(_811);
    int _917 = _801 ? 2 : 0;
    int _919 = _915 | _917;
    int _921 = _891 ? 4 : 0;
    int _923 = _919 | _921;
    int _925 = _869 ? 8 : 0;
    int _927 = _923 | _925;
    int _929 = _873 ? 16 : 0;
    int _931 = _927 | _929;
    int _933 = _877 ? 32 : 0;
    int _935 = _931 | _933;
    int _937 = false ? 64 : 0;
    int _939 = _935 | _937;
    int _941 = _939 & 4;
    float _943 = -_179;
    int _945 = _891 ? as_type<int>(_943) : as_type<int>(_179);
    float _947 = _913;
    float _949 = as_type<float>(_941);
    if (_801)
    {
        _895 = _777;
    }
    float _951 = _895;
    if (_801)
    {
        _903 = _777;
    }
    float _953 = _903;
    if (_801)
    {
        _911 = _775;
    }
    float _955 = _911;
    if (_801)
    {
        _947 = _775;
    }
    float _957 = _947;
    float _959 = _955 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _961 = _805 >= 0.0;
    bool _963 = isnan(_805);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _973 = _815 >= 0.0;
    bool _975 = isnan(_815);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.0);
    bool _981 = _977 || _979;
    bool _983 = !_877;
    float _985 = _983 ? _183 : _885;
    float _987 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[93].z, _971);
    bool _989 = !_873;
    float _991 = _989 ? _179 : as_type<float>(_945);
    float _993 = _775 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1005 = _1003 != 0;
    float _1007 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[92].z, _987);
    bool _1009 = !_1001;
    float _1011 = _1009 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1015 = !_997;
    int _1017 = _1015 ? 0 : 1;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1021 = !_1005;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = -_1013;
    float _1027 = fma(_993, 2.0, _1025);
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1039 = _1037 != 0;
    float _1041 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1019);
    float _1043 = _785 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1045 = _993;
    float _1047 = _1011;
    if (_811)
    {
        _1045 = _777;
    }
    float _1049 = _1045;
    float _1051 = _809 + (-1.0);
    float _1053 = _1049;
    if (_811)
    {
        _897 = _775;
    }
    float _1055 = _897;
    float _1057 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1041);
    bool _1059 = !_1035;
    int _1061 = _1059 ? 0 : 1;
    bool _1063 = !_1031;
    int _1065 = _1063 ? 0 : 1;
    bool _1067 = !_1039;
    float _1069 = _1067 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1071 = _1055;
    float _1073 = _1069;
    if (!_811)
    {
        _1071 = _649;
    }
    float _1075 = _1071;
    if (!_811)
    {
        _1053 = _775;
    }
    float _1077 = _1053;
    int _1079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1081 = _1079 != 0;
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1085 = _1083 != 0;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1089 = _1087 != 0;
    float _1091 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1093 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1095 = _805 > 0.0;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1099 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1101 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1097);
    float _1103 = float(_109);
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1109 = _969 ? 0 : 1;
    float _1111 = -_1105;
    float _1113 = fma(_959, 2.0, _1111);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1117 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1107);
    bool _1119 = _815 > 0.0;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1123 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1125 = log2(_1123);
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1129 = !_1081;
    int _1131 = _1129 ? 0 : 1;
    float _1133 = _951 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1135 = -_1121;
    float _1137 = fma(_1091, 2.0, _1135);
    float _1139 = fma(_1043, -2.0, _1127);
    int _1141 = abs(_1131);
    float _1143 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1145 = int(_1143);
    float _1147 = fma(_1133, -2.0, _1115);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1151 = float(_743);
    float _1153 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1139);
    float _1155 = float(_1141);
    float _1157 = fma(_1093, -2.0, _1149);
    float _1159 = float(_881);
    float _1161 = 1.0 / _1103;
    float _1163 = _1125 * _143;
    float _1165 = _1155 * _1151;
    float _1167 = in.m_60.x;
    float _1169 = in.m_60.y;
    float _1171 = in.m_60.z;
    float _1173 = float(_909);
    float _1175 = _1165 * (-2.0);
    float _1177 = 1.0 / _1159;
    float _1179 = float(_1145);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1183 = 1.0 + _1181;
    int _1185 = _981 ? 0 : 1;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1189 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1101);
    int _1191 = ~_1185;
    int _1193 = _1191 + 1;
    int _1195 = _1193 + 1;
    float _1197 = exp2(_1163);
    float _1199 = _1161 * _143;
    float _1201 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1187);
    int _1203 = _1195;
    if (!_1119)
    {
        int _1205 = ~_1185;
        int _1207 = _1205 + 1;
        _1203 = _1207;
    }
    int _1209 = _1203;
    float _1211 = -_143;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1027);
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1217 = 1.0 / _1173;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1221 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1223 = isnan(1.0);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1229 = _1225 || _1227;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1233 = ~_1109;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    float _1239 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1219);
    int _1241 = _1237;
    if (!_1095)
    {
        int _1243 = ~_1109;
        int _1245 = _1243 + 1;
        _1241 = _1245;
    }
    int _1247 = _1241;
    float _1249 = _1177 * _143;
    float _1251 = 1.0 / _1179;
    float _1253 = -_1197;
    float _1255 = _1253 + 1.0;
    bool _1257 = !_1085;
    int _1259 = _1257 ? 0 : 1;
    float _1261 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1231);
    bool _1263 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1265 = isnan(0.0);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1271 = _1267 || _1269;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1275 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1201);
    float _1277 = 1.0 / _1183;
    float _1279 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1215);
    float _1281 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1273);
    float _1283 = _1271 ? _1255 : 0.0;
    float _1285 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1239);
    float _1287 = _775 + (-0.5);
    float _1289 = fma(_1175, _1167, _1167);
    bool _1291 = !_1089;
    int _1293 = _1291 ? 0 : 1;
    float _1295 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1279);
    float _1297 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1147);
    int _1299 = abs(_1259);
    float _1301 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1281);
    float _1303 = float(_1247);
    float _1305 = _1217 * _143;
    float _1307 = float(_1299);
    float _1309 = _1251 * _143;
    float _1311 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1261);
    float _1313 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1117);
    float _1315 = -_143;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1113);
    float _1319 = -_143;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1137);
    float _1323 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1157);
    if (_1229)
    {
        float _1325 = _1283 * _1277;
        _147 = _1325;
    }
    float _1327 = _147;
    float _1329 = fma(_1099, _1175, _1099);
    float _1331 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1289);
    int _1333 = abs(_1293);
    float _1335 = _1307 * _1303;
    float _1337 = _777 + _649;
    float _1339 = fma(_1329, _1327, _1331);
    float _1341 = _1335 * (-2.0);
    float _1343 = _1337 + (-1.0);
    float _1345 = float(_1209);
    float _1347 = _777 + (-0.5);
    float _1349 = float(_1333);
    float _1351 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1353 = _775 + _649;
    float _1355 = _649 + (-0.5);
    float _1357 = _1339 * 0.15915493667125701904296875;
    float _1359 = _1349 * _1345;
    float _1361 = fma(_1341, _1169, _1169);
    float _1363 = _1353 + (-1.0);
    float _1365 = _1359 * (-2.0);
    float _1367 = fma(_1351, _1341, _1351);
    float _1369 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1361);
    float _1371 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1373 = fma(_1365, _1171, _1171);
    float _1375 = _1357 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = fma(_1367, _1327, _1369);
    float _1381 = fma(_1371, _1365, _1371);
    float _1383 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1373);
    bool _1385 = _651 > 0.5;
    float _1387 = _1379 * 0.15915493667125701904296875;
    float _1389 = fma(_1381, _1327, _1383);
    float _1391 = _1357 * 6.283185482025146484375;
    float _1393 = sin(_1391);
    float _1395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1399 = _1389 * 0.15915493667125701904296875;
    float _1401 = -_183;
    int _1403 = _1385 ? as_type<int>(_1401) : as_type<int>(_183);
    float _1405 = _833 * _1395;
    float _1407 = in.m_44.x;
    float _1409 = in.m_44.y;
    float _1411 = in.m_44.z;
    float _1413 = _1387 * 6.283185482025146484375;
    float _1415 = sin(_1413);
    bool _1417 = !_869;
    float _1419 = _1417 ? _183 : as_type<float>(_1403);
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1423 = _1421 != 0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1431 = _1429 != 0;
    int _1433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1435 = _1433 != 0;
    float _1437 = _1387 * 6.283185482025146484375;
    float _1439 = cos(_1437);
    bool _1441 = !_1427;
    int _1443 = _1441 ? 0 : 1;
    bool _1445 = !_1423;
    int _1447 = _1445 ? 0 : 1;
    bool _1449 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1451 = isnan(0.5);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1457 = _1453 || _1455;
    bool _1459 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1461 = isnan(0.5);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1467 = _1463 || _1465;
    float _1469 = _1399 * 6.283185482025146484375;
    float _1471 = cos(_1469);
    float _1473 = _1377 * _1415;
    float _1475 = _1393 * _1415;
    float _1477 = _901 * _1397;
    bool _1479 = !_1431;
    int _1481 = _1479 ? 0 : 1;
    bool _1483 = !_1435;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = _1399 * 6.283185482025146484375;
    float _1489 = sin(_1487);
    float _1491 = _1377 * _1439;
    float _1493 = _1393 * _1439;
    float _1495 = _1377 * _1471;
    float _1497 = _1393 * _1471;
    float _1499 = _1439 * _1471;
    float _1501 = _1415 * _1471;
    float _1503 = _1495 * _1477;
    float _1505 = _1497 * _1477;
    float _1507 = fma(_1489, _1491, _1475);
    float _1509 = -_1473;
    float _1511 = fma(_1489, _1493, _1509);
    float _1513 = -_1493;
    float _1515 = fma(_1489, _1473, _1513);
    float _1517 = -_1477;
    float _1519 = _1489 * _1517;
    float _1521 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1523 = fma(_1507, _1405, _1503);
    float _1525 = fma(_1489, _1475, _1491);
    float _1527 = fma(_1499, _1405, _1519);
    float _1529 = fma(_1511, _1405, _1505);
    float _1531 = fma(_1515, _1521, _1523);
    float _1533 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1535 = fma(_1501, _1521, _1527);
    float _1537 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1541 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1533);
    float _1543 = fma(_1525, _1521, _1529);
    float _1545 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1539);
    float _1549 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1537);
    float _1551 = fma(_1411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1541);
    float _1553 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1545);
    float _1555 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1547);
    float _1557 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1559 = fma(_1411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1549);
    float _1561 = _1551 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1563 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1553);
    float _1565 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1567 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1557);
    float _1569 = _1559 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1571 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1573 = _1561 + _1565;
    float _1575 = fma(_1411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1567);
    float _1577 = _1569 + _1571;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1581 = _1573 + _1579;
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1585 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1589 = _1577 + _1587;
    float _1591 = _1581 * _1581;
    float _1593 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1585);
    float _1597 = fma(_1589, _1589, _1591);
    float _1599 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1601 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1603 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1595);
    float _1605 = sqrt(_1597);
    float _1607 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1599);
    float _1609 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1601);
    float _1611 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1613 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1615 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1609);
    float _1617 = 1.0 / _1613;
    float _1619 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1621 = _1619 + _1613;
    bool _1623 = _1605 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1625 = _1621 * _1617;
    float _1627 = _1625 * 0.5;
    float _1629 = _1583 + _1611;
    float _1631 = _1621;
    float _1633 = _1607;
    float _1635 = _1611;
    float _1637 = _1573;
    float _1639 = _1629;
    bool _1641 = _1623;
    if (!_1623)
    {
        _1631 = _1577;
    }
    float _1643 = _1631;
    float _1645 = _1643;
    if (!_1623)
    {
        _1633 = _1573;
    }
    float _1647 = _1633;
    float _1649 = _1647;
    if (!_1623)
    {
        _1635 = _1629;
    }
    float _1651 = _1635;
    bool _1653 = !_1623;
    float _1655 = _1651;
    if (!_1653)
    {
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1661 = _1605 + _1659;
        float _1663 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1665 = rsqrt(_1597);
        float _1667 = _1661 * _1657;
        float _1669 = _1667 * 0.15915493667125701904296875;
        float _1671 = _1669 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1669 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        float _1679 = _1673 + (-1.0);
        float _1681 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = fma(_1677, _1663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1685 = fma(_1629, _1673, _1681);
        float _1687 = _1665 * _1683;
        float _1689 = fma(_1589, _1687, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1691 = fma(_1581, _1687, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1645 = _1689;
        _1649 = _1691;
        _1655 = _1685;
    }
    float _1693 = _1645;
    float _1695 = _1649;
    float _1697 = _1655;
    float _1699 = _1697;
    float _1701 = _1693;
    float _1703 = _1695;
    if (_1467)
    {
        _1637 = 1.0;
    }
    float _1705 = _1637;
    float _1707 = _1705;
    if (!_1457)
    {
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1711 = _1583 + _1709;
        float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1715 = _1569 + _1713;
        float _1717 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1719 = -_1569;
        float _1721 = _1719 + _1693;
        float _1723 = _1711 * _1711;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1727 = _1561 + _1725;
        float _1729 = -_1561;
        float _1731 = _1729 + _1695;
        float _1733 = -_1583;
        float _1735 = _1733 + _1697;
        float _1737 = fma(_1715, _1715, _1723);
        float _1739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1741 = fma(_1727, _1727, _1737);
        float _1743 = sqrt(_1741);
        float _1745 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1747 = precise::min(_1743, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1749 = _1747 * _1739;
        float _1751 = _1745 * _1749;
        float _1753 = fma(_1721, _1751, _1569);
        float _1755 = fma(_1731, _1751, _1561);
        float _1757 = fma(_1735, _1751, _1583);
        _1699 = _1757;
        _1701 = _1753;
        _1703 = _1755;
        _1639 = _1739;
    }
    float _1759 = _1699;
    float _1761 = _1701;
    float _1763 = _1703;
    float _1765 = _1639;
    float _1767 = _1765;
    if (!_1467)
    {
        float _1769 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1771 = _1769 * 0.15915493667125701904296875;
        float _1773 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1777 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1775);
        float _1779 = _1771 * 6.283185482025146484375;
        float _1781 = cos(_1779);
        float _1783 = _1773 * 0.15915493667125701904296875;
        float _1785 = _1771 * 6.283185482025146484375;
        float _1787 = sin(_1785);
        float _1789 = 1.0 / _1781;
        float _1791 = _1783 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = _1787 * _1789;
        float _1797 = _1783 * 6.283185482025146484375;
        float _1799 = sin(_1797);
        float _1801 = _1793 * _1795;
        float _1803 = 1.0 / _1777;
        float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1807 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1805;
        float _1809 = 1.0 / _1801;
        float _1811 = 1.0 / _1807;
        float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1815 = _1803 * _1813;
        float _1817 = _1799 * _1809;
        float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1821 = fma(_1817, _1815, _1819);
        float _1823 = _1821 * _1811;
        float _1825 = precise::clamp(_1823, 0.0, 1.0);
        float _1827 = -_1825;
        float _1829 = _1827 + 1.0;
        _1767 = _1783;
        _1707 = _1829;
    }
    float _1831 = _1767;
    float _1833 = _1707;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1837 = _1759 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1841 = _1761 + _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1845 = _1763 + _1843;
    bool _1847 = _861 != 0;
    float _1849 = _1837 * _1837;
    bool _1851 = _941 != 0;
    float _1853 = fma(_1841, _1841, _1849);
    float _1855 = fma(_1845, _1845, _1853);
    float _1857 = rsqrt(_1855);
    float _1859 = sqrt(_1855);
    float _1861 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1863 = _1841 * _1861;
    float _1865 = _1845 * _1861;
    float _1867 = _1863 * _1863;
    float _1869 = _1865 * _1865;
    float _1871 = _1867 + _1869;
    float _1873 = sqrt(_1871);
    bool _1875 = _1873 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = _1873 + _1877;
    float _1881 = _1845;
    float _1883 = _1871;
    float _1885 = _1879;
    float _1887 = _1831;
    float _1889 = _1837;
    if (_1875)
    {
        float _1891 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1891;
    }
    float _1893 = _1881;
    if (_1875)
    {
        float _1895 = rsqrt(_1871);
        _1883 = _1895;
    }
    float _1897 = _1883;
    if (_1875)
    {
        float _1899 = _1879 * _1893;
        _1885 = _1899;
    }
    float _1901 = _1885;
    if (_1875)
    {
        float _1903 = _1901 * 0.15915493667125701904296875;
        _1887 = _1903;
    }
    float _1905 = _1887;
    float _1907 = _1857;
    float _1909 = _1905;
    if (_1875)
    {
        float _1911 = _1905 * 6.283185482025146484375;
        float _1913 = sin(_1911);
        _1907 = _1913;
    }
    float _1915 = _1907;
    float _1917 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1919 = precise::max(0.0, _1917);
    float _1921 = _1849;
    float _1923 = _1919;
    float _1925 = _1917;
    if (_1875)
    {
        float _1927 = _1905 * 6.283185482025146484375;
        float _1929 = cos(_1927);
        _1921 = _1929;
    }
    float _1931 = _1921;
    float _1933 = -_1861;
    float _1935 = -_1919;
    float _1937 = fma(_1837, _1933, _1935);
    if (!_1875)
    {
        _1889 = _1863;
    }
    float _1939 = _1889;
    float _1941 = _1939;
    if (_1875)
    {
        float _1943 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1923 = _1943;
    }
    float _1945 = _1923;
    float _1947 = _1915;
    float _1949 = _1945;
    if (_1875)
    {
        float _1951 = fma(_1915, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1947 = _1951;
    }
    float _1953 = _1947;
    float _1955 = _1953;
    if (!_1875)
    {
        _1949 = _1937;
    }
    float _1957 = _1949;
    float _1959 = _1957;
    float _1961 = _1931;
    if (_1875)
    {
        float _1963 = _1931 + (-1.0);
        _1925 = _1963;
    }
    float _1965 = _1925;
    float _1967 = _1965;
    if (_1875)
    {
        float _1969 = _1897 * _1953;
        _949 = _1969;
    }
    float _1971 = _949;
    if (!_1875)
    {
        _1955 = _1867;
    }
    float _1973 = _1955;
    float _1975 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1977 = _1973;
    if (_1875)
    {
        float _1979 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1909 = _1979;
    }
    float _1981 = _1909;
    if (_1875)
    {
        float _1983 = _1863 * _1971;
        _1941 = _1983;
    }
    float _1985 = _1941;
    if (!_1875)
    {
        _1967 = _1865;
    }
    float _1987 = _1967;
    float _1989 = _1987;
    if (_1875)
    {
        float _1991 = _1865 * _1971;
        _1989 = _1991;
    }
    float _1993 = _1989;
    if (_1875)
    {
        float _1995 = fma(_1937, _1931, _1981);
        _1959 = _1995;
    }
    float _1997 = _1959;
    if (_1875)
    {
        float _1999 = _1985 * _1985;
        _1977 = _1999;
    }
    float _2001 = _1977;
    if (!_1875)
    {
        _1961 = _1869;
    }
    float _2003 = _1961;
    float _2005 = _2003;
    if (_1875)
    {
        float _2007 = _1993 * _1993;
        _2005 = _2007;
    }
    float _2009 = _2005;
    float _2011 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2013 = fma(_1997, _1997, _2001);
    float _2015 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2017 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2011);
    float _2019 = _2013 + _2009;
    float _2021 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2023 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2015);
    float _2025 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2017);
    float _2027 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2029 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2021);
    float _2031 = rsqrt(_2019);
    float _2033 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2023);
    float _2035 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2037 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2029);
    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2041 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2039);
    float _2043 = precise::clamp(_2041, 0.0, 1.0);
    float _2045 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2047 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2027);
    float _2049 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2051 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2053 = -_2043;
    float _2055 = _2053 + 1.0;
    float _2057 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2059 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2047);
    float _2061 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2051);
    float _2063 = -_2057;
    float _2065 = fma(_2063, _1975, 1.0);
    float _2067 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2069 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2061);
    float _2071 = _2031 * _1985;
    float _2073 = abs(_2055);
    float _2075 = log2(_2073);
    float _2077 = _2031 * _1993;
    float _2079 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2069);
    float _2081 = _2031 * _1997;
    float _2083 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2085 = -_2083;
    float _2087 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2085);
    float _2089 = 1.0 / _2079;
    float _2091 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2093 = -_2077;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2087);
    float _2097 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2091);
    float _2101 = fma(_2095, -0.5, 0.5);
    float _2103 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2105 = log2(_2065);
    float _2107 = fma(_2095, 0.5, 0.5);
    float _2109 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2111 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2099);
    float _2113 = _2081 + 1.0;
    float _2115 = fma(_2107, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2117 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2109);
    float _2119 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2111);
    float _2121 = exp2(_2103);
    float _2123 = fma(_2107, _2115, -0.212114393711090087890625);
    float _2125 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2117);
    float _2127 = fma(_2107, _2123, 1.570728778839111328125);
    float _2129 = _2125 * _2089;
    float _2131 = sqrt(_2101);
    float _2133 = _2105 * 0.693147182464599609375;
    float _2135 = fma(_2129, 0.5, 0.5);
    float _2137 = -_2081;
    float _2139 = fma(_2121, _2113, _2137);
    float _2141 = _2119 * _2089;
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2145 = fma(_2141, -0.5, 0.5);
    float _2147 = _2131 * 0.636619746685028076171875;
    float _2149 = -_2127;
    float _2151 = fma(_2147, _2149, 1.0);
    float _2153 = fma(_2139, 0.5, 0.5);
    float3 _7957 = float3(_2135, _2145, _2143);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7957, float3(0.0), isnan(_7957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7957, float3(0.0), isnan(_7957)), level(0.0)).x;
    float3 _7968 = float3(_2135, _2145, _2143);
    float4 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7968, float3(0.0), isnan(_7968)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7968, float3(0.0), isnan(_7968)), level(0.0)).xyzw;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2158.w;
    float2 _7985 = float2(_2151, _2153);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7985, float2(0.0), isnan(_7985)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7985, float2(0.0), isnan(_7985)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    float _2178 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2180 = int(_2178);
    float _2182 = _787 * _789;
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2186 = _2184 != 0;
    out.m_62.y = _901;
    int _2188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2190 = _2188 != 0;
    float _2192 = -_1057;
    float _2194 = _2192 + 1.0;
    int _2196 = abs(_1017);
    float _2198 = -_1311;
    float _2200 = _2198 + 1.0;
    float _2202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2204 = int(_2202);
    int _2206 = abs(_1443);
    float _2208 = -_1301;
    float _2210 = _2208 + 1.0;
    int _2212 = abs(_1023);
    out.m_64.y = _1583;
    int _2214 = abs(_1485);
    float _2216 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2218 = abs(_1065);
    float _2220 = trunc(_1249);
    int _2222 = int(_2220);
    float _2224 = float(uint(_2180));
    float _2226 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2228 = ~_2180;
    int _2230 = _2228 + 1;
    float _2232 = -_1189;
    float _2234 = _2232 + 1.0;
    float _2236 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2226);
    float _2238 = 1.0 / _2224;
    float _2240 = float(uint(_2204));
    float _2242 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2236);
    int _2244 = ~_2204;
    int _2246 = _2244 + 1;
    float _2248 = -_1313;
    float _2250 = _2248 + 1.0;
    int _2252 = ~_2204;
    int _2254 = _2252 + 1;
    out.m_66.x = _1761;
    out.m_66.y = _1759;
    out.m_66.z = _1763;
    float _2256 = 1.0 / _2240;
    float _2258 = trunc(_1305);
    int _2260 = int(_2258);
    int _2262 = as_type<int>(_2238) + (-2);
    float _2264 = float(uint(_2222));
    float _2266 = float(_2222);
    int _2268 = as_type<int>(_2256) + (-2);
    float _2270 = as_type<float>(_2262) * _2264;
    float _2272 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2274 = int(_2272);
    float _2276 = float(uint(_2260));
    float _2278 = trunc(_2270);
    float _2280 = precise::max(_2278, 0.0);
    uint _2283 = uint(_2280);
    float _2285 = as_type<float>(_2268) * _2276;
    int _2287 = ~_2180;
    int _2289 = _2287 + 1;
    float _2291 = trunc(_2285);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    float _2297 = float(uint(_2274));
    int _2299 = _2289 * int(_2283);
    int _2301 = _2299 + _2222;
    float _2303 = 1.0 / _2297;
    float _2305 = _791 * _775;
    float _2307 = float(uint(_2301));
    int _2309 = _2246 * int(_2295);
    int _2311 = _2309 + _2260;
    float _2313 = trunc(_1309);
    int _2315 = int(_2313);
    float _2317 = as_type<float>(_2262) * _2307;
    float _2319 = float(uint(_2311));
    float _2321 = trunc(_2317);
    float _2323 = precise::max(_2321, 0.0);
    uint _2325 = uint(_2323);
    float _2327 = as_type<float>(_2268) * _2319;
    float _2329 = trunc(_2327);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    float _2335 = floor(_2305);
    int _2337 = int(_2283) + int(_2325);
    float _2339 = _793 * _795;
    int _2341 = as_type<int>(_2303) + (-2);
    float _2343 = float(uint(_2315));
    int _2345 = _2230 * _2337;
    int _2347 = _2345 + _2222;
    int _2349 = int(_2295) + int(_2333);
    float _2351 = exp2(_2216);
    float _2353 = as_type<float>(_2341) * _2343;
    float _2355 = float(_2180);
    int _2357 = _2254 * _2349;
    int _2359 = _2357 + _2260;
    bool _2361 = uint(_2347) >= uint(_2180);
    float _2363 = -_2335;
    float _2365 = _2305 + _2363;
    float _2367 = floor(_2182);
    bool _2369 = _2266 >= _2355;
    bool _2371 = isnan(_2266);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(_2355);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    bool _2381 = uint(_2359) >= uint(_2204);
    float _2383 = float(_2204);
    float _2385 = float(_2260);
    float _2387 = trunc(_2353);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    bool _2393 = !_2186;
    int _2395 = _2393 ? 0 : 1;
    float _2397 = -_2351;
    float _2399 = _2397 + 1.0;
    int _2401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2403 = _2401 != 0;
    float _2405 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2407 = -_2367;
    float _2409 = _2182 + _2407;
    float _2411 = _2365 * _2355;
    float _2413 = trunc(_2379);
    int _2415 = int(_2413);
    bool _2417 = _2385 >= _2383;
    bool _2419 = isnan(_2385);
    bool _2421 = _2417 || _2419;
    bool _2423 = isnan(_2383);
    bool _2425 = _2421 || _2423;
    float _2427 = float(_2425);
    float _2429 = _2355 * _1199;
    int _2431 = abs(_2395);
    int _2433 = ~_2274;
    int _2435 = _2433 + 1;
    bool _2437 = !_2381;
    int _2439 = _2437 ? 0 : (-1);
    float _2441 = trunc(_2411);
    int _2443 = int(_2441);
    bool _2445 = !_2361;
    int _2447 = _2445 ? 0 : (-1);
    int _2449 = ~_2349;
    int _2451 = _2449 + _2439;
    int _2453 = _2451 + 1;
    int _2455 = ~_2337;
    int _2457 = _2455 + _2447;
    int _2459 = _2457 + 1;
    float _2461 = _2409 * _2383;
    bool _2463 = !_2403;
    int _2465 = _2463 ? 0 : 1;
    int _2467 = _2435 * int(_2391);
    int _2469 = _2467 + _2315;
    float _2471 = trunc(_2427);
    int _2473 = int(_2471);
    float _2475 = as_type<float>(_2435);
    float _2477 = _2339;
    float _2479 = _2079;
    float _2481 = _2119;
    if (_2190)
    {
        float _2483 = in.m_54.w;
        _2475 = _2483;
    }
    float _2485 = _2475;
    int _2487 = abs(_2465);
    float _2489 = _2383 * _1199;
    float _2491 = float(uint(_2469));
    int _2493 = _2204 * _2453;
    int _2495 = _2493 + _2260;
    bool _2497 = _2180 == 0;
    int _2499 = _2443 * _2431;
    int _2501 = _2499 + _2222;
    float _2503 = trunc(_2461);
    int _2505 = int(_2503);
    float _2507 = as_type<float>(_2341) * _2491;
    int _2509 = _2180 * _2459;
    int _2511 = _2509 + _2222;
    int _2513 = ~_2415;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    bool _2519 = _2204 == 0;
    bool _2521 = !_2497;
    int _2523 = _2521 ? _2511 : (-1);
    float _2525 = trunc(_2507);
    float _2527 = precise::max(_2525, 0.0);
    uint _2529 = uint(_2527);
    int _2531 = ~_2473;
    int _2533 = _2531 + 1;
    int _2535 = _2533 + 1;
    bool _2537 = !_2519;
    int _2539 = _2537 ? _2495 : (-1);
    int _2541 = _2523 * _2517;
    int _2543 = _2204 + (-1);
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2547 = _2545 != 0;
    int _2549 = _2505 * _2487;
    int _2551 = _2549 + _2260;
    int _2553 = _2180 + (-1);
    float _2555 = trunc(_2429);
    int _2557 = int(_2555);
    int _2559 = _2539 * _2535;
    int _2561 = _2415 * _2553;
    int _2563 = _2561 + _2541;
    int _2565 = abs(as_type<int>(_1011));
    float _2567 = as_type<float>(_2563);
    if (_2190)
    {
        float _2569 = _2485 * 3.1415927410125732421875;
        _1047 = _2569;
    }
    float _2571 = _1047;
    int _2573 = int(_2391) + int(_2529);
    float _2575 = trunc(_2489);
    int _2577 = int(_2575);
    int _2579 = ~_2274;
    int _2581 = _2579 + 1;
    int _2583 = _2473 * _2543;
    int _2585 = _2583 + _2559;
    int _2587 = abs(_1447);
    int _2589 = _2563 * _2565;
    if (_2190)
    {
        float _2591 = _2571 * 0.15915493667125701904296875;
        _2567 = _2591;
    }
    float _2593 = _2567;
    int _2595 = _2581 * _2573;
    int _2597 = _2595 + _2315;
    bool _2599 = !_2547;
    int _2601 = _2599 ? 0 : 1;
    int _2603 = _2557 * _2196;
    int _2605 = _2603 + _2589;
    float _2607 = float(_2315);
    int _2609 = _2585 * _2206;
    bool _2611 = uint(_2597) >= uint(_2274);
    float _2613 = _2593;
    if (_2190)
    {
        float _2615 = _2593 * 6.283185482025146484375;
        float _2617 = sin(_2615);
        _2613 = _2617;
    }
    float _2619 = _2613;
    int _2621 = abs(_2601);
    int _2623 = _2501 * _2212;
    int _2625 = _2623 + _2605;
    float _2627 = float(_2274);
    int _2629 = _2577 * _2587;
    int _2631 = _2629 + _2609;
    bool _2633 = !_2611;
    int _2635 = _2633 ? 0 : (-1);
    int _2637 = _2443 * _2621;
    int _2639 = _2637 + _2625;
    int _2641 = abs(_1481);
    float _2643 = floor(_2339);
    bool _2645 = _2607 >= _2627;
    bool _2647 = isnan(_2607);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan(_2627);
    bool _2653 = _2649 || _2651;
    float _2655 = float(_2653);
    float _2657 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2657;
    int _2661 = ~_2573;
    int _2663 = _2661 + _2635;
    int _2665 = _2663 + 1;
    float _2667 = _2627 * _1199;
    int _2669 = _2551 * _2641;
    int _2671 = _2669 + _2631;
    float _2673 = float(uint(_2639));
    float _2675 = trunc(_2655);
    int _2677 = int(_2675);
    bool _2679 = _2274 == 0;
    int _2681 = _2505 * _2214;
    int _2683 = _2681 + _2671;
    int _2685 = ~_2180;
    int _2687 = _2685 + 1;
    float _2689 = as_type<float>(_2262) * _2673;
    int _2691 = _2274 * _2665;
    int _2693 = _2691 + _2315;
    if (_2190)
    {
        bool _2695 = _2619 > 0.5;
        _1641 = _2695;
    }
    bool _2697 = _1641;
    float _2699 = float(uint(_2683));
    float _2701 = -_2643;
    float _2703 = _2339 + _2701;
    float _2705 = trunc(_2689);
    float _2707 = precise::max(_2705, 0.0);
    uint _2709 = uint(_2707);
    bool _2711 = !_2679;
    int _2713 = _2711 ? _2693 : (-1);
    float _2715 = as_type<float>(_2268) * _2699;
    if (!_2190)
    {
        _2477 = _179;
    }
    float _2717 = _2477;
    float _2719 = _2703 * _2627;
    int _2721 = ~_2677;
    int _2723 = _2721 + 1;
    int _2725 = _2723 + 1;
    float _2727 = float(uint(_2501));
    float _2729 = trunc(_2715);
    float _2731 = precise::max(_2729, 0.0);
    uint _2733 = uint(_2731);
    float _2735 = _2717;
    if (_2190)
    {
        float _2737 = -_179;
        float _2739 = _2697 ? _2737 : _179;
        _2735 = _2739;
    }
    float _2741 = _2735;
    int _2743 = _2713 * _2725;
    int _2745 = _2274 + (-1);
    float _2747 = as_type<float>(_2262) * _2727;
    int _2749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2751 = _2749 != 0;
    int _2753 = _2687 * int(_2709);
    int _2755 = _2753 + _2639;
    int _2757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2759 = _2757 != 0;
    int _2761 = _2677 * _2745;
    int _2763 = _2761 + _2743;
    int _2765 = ~_2204;
    int _2767 = _2765 + 1;
    float _2769 = trunc(_2719);
    int _2771 = int(_2769);
    float _2773 = float(uint(_2755));
    int _2775 = abs(_1061);
    bool _2777 = !_2759;
    int _2779 = _2777 ? 0 : 1;
    int _2781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2783 = _2781 != 0;
    float _2785 = as_type<float>(_2262) * _2773;
    int _2787 = _2767 * int(_2733);
    int _2789 = _2787 + _2683;
    float _2791 = trunc(_2667);
    int _2793 = int(_2791);
    float _2795 = _2619;
    if (_2751)
    {
        float _2797 = in.m_54.x;
        _2795 = _2797;
    }
    float _2799 = _2795;
    int _2801 = _2763 * _2775;
    int _2803 = abs(_2779);
    float _2805 = float(uint(_2789));
    float _2807 = float(uint(_2551));
    float _2809 = trunc(_2747);
    float _2811 = precise::max(_2809, 0.0);
    uint _2813 = uint(_2811);
    int _2815 = ~_2180;
    int _2817 = _2815 + 1;
    float _2819 = as_type<float>(_2268) * _2805;
    int _2821 = _2771 * _2803;
    int _2823 = _2821 + _2315;
    float _2825 = as_type<float>(_2268) * _2807;
    int _2827 = abs(as_type<int>(_1069));
    float _2829 = trunc(_2785);
    float _2831 = precise::max(_2829, 0.0);
    uint _2833 = uint(_2831);
    int _2835 = _2793 * _2218;
    int _2837 = _2835 + _2801;
    int _2839 = ~_2180;
    int _2841 = _2839 + 1;
    int _2843 = ~_2274;
    int _2845 = _2843 + 1;
    int _2847 = _2823 * _2827;
    int _2849 = _2847 + _2837;
    int _2851 = ~_2204;
    int _2853 = _2851 + 1;
    float _2855 = trunc(_2819);
    float _2857 = precise::max(_2855, 0.0);
    uint _2859 = uint(_2857);
    int _2861 = _2817 * int(_2813);
    int _2863 = _2861 + _2501;
    float _2865 = _2799;
    if (_2751)
    {
        float _2867 = _2799 * 3.1415927410125732421875;
        _1073 = _2867;
    }
    float _2869 = _1073;
    float _2871 = _2869;
    if (!_2751)
    {
        _2865 = _183;
    }
    float _2873 = _2865;
    int _2875 = ~_2274;
    int _2877 = _2875 + 1;
    float _2879 = _2873;
    if (_2751)
    {
        float _2881 = _2869 * 0.15915493667125701904296875;
        _2871 = _2881;
    }
    float _2883 = _2871;
    float _2885 = float(uint(_2863));
    float _2887 = trunc(_2825);
    float _2889 = precise::max(_2887, 0.0);
    uint _2891 = uint(_2889);
    int _2893 = int(_2709) + int(_2833);
    bool _2895 = !_2783;
    int _2897 = _2895 ? 0 : 1;
    float _2899 = as_type<float>(_2262) * _2885;
    int _2901 = _2841 * _2893;
    int _2903 = _2901 + _2639;
    int _2905 = abs(_2897);
    float _2907 = _2883;
    if (_2751)
    {
        float _2909 = _2883 * 6.283185482025146484375;
        float _2911 = sin(_2909);
        _2907 = _2911;
    }
    float _2913 = _2907;
    int _2915 = int(_2733) + int(_2859);
    int _2917 = ~_2204;
    int _2919 = _2917 + 1;
    int _2921 = _2771 * _2905;
    int _2923 = _2921 + _2849;
    bool _2925 = uint(_2903) >= uint(_2180);
    int _2927 = _2853 * _2915;
    int _2929 = _2927 + _2683;
    float _2931 = float(uint(_2823));
    float _2933 = trunc(_2899);
    float _2935 = precise::max(_2933, 0.0);
    uint _2937 = uint(_2935);
    bool _2939 = !_2925;
    int _2941 = _2939 ? 0 : (-1);
    int _2943 = _2919 * int(_2891);
    int _2945 = _2943 + _2551;
    bool _2947 = uint(_2929) >= uint(_2204);
    float _2949 = as_type<float>(_2341) * _2931;
    int _2951 = ~_2893;
    int _2953 = _2951 + _2941;
    int _2955 = _2953 + 1;
    float _2957 = float(uint(_2945));
    float _2959 = trunc(_2949);
    float _2961 = precise::max(_2959, 0.0);
    uint _2963 = uint(_2961);
    float _2965 = float(uint(_2923));
    int _2967 = _2180 * _2955;
    int _2969 = _2967 + _2639;
    bool _2971 = !_2947;
    int _2973 = _2971 ? 0 : (-1);
    float _2975 = as_type<float>(_2268) * _2957;
    int _2977 = ~_2274;
    int _2979 = _2977 + 1;
    float _2981 = as_type<float>(_2341) * _2965;
    float _2983 = -_179;
    int _2985 = _1847 ? as_type<int>(_2983) : as_type<int>(_179);
    int _2987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2989 = _2987 != 0;
    float _2991 = trunc(_2981);
    float _2993 = precise::max(_2991, 0.0);
    uint _2995 = uint(_2993);
    bool _2997 = _2947;
    if (_2751)
    {
        bool _2999 = _2913 > 0.5;
        _2997 = _2999;
    }
    bool _3001 = _2997;
    int _3003 = ~_2915;
    int _3005 = _3003 + _2973;
    int _3007 = _3005 + 1;
    bool _3009 = !_2989;
    float _3011 = _3009 ? _179 : as_type<float>(_2985);
    int _3013 = _2979 * int(_2963);
    int _3015 = _3013 + _2823;
    int _3017 = ~_2274;
    int _3019 = _3017 + 1;
    int _3021 = _2204 * _3007;
    int _3023 = _3021 + _2683;
    bool _3025 = !_2497;
    int _3027 = _3025 ? _2969 : (-1);
    float _3029 = trunc(_2975);
    float _3031 = precise::max(_3029, 0.0);
    uint _3033 = uint(_3031);
    float _3035 = float(uint(_3015));
    int _3037 = int(_2813) + int(_2937);
    int _3039 = ~_2180;
    int _3041 = _3039 + 1;
    int _3043 = _3019 * int(_2995);
    int _3045 = _3043 + _2923;
    if (_2751)
    {
        float _3047 = -_183;
        float _3049 = _3001 ? _3047 : _183;
        _2879 = _3049;
    }
    float _3051 = _2879;
    float _3053 = as_type<float>(_2341) * _3035;
    int _3055 = _3027 & 3;
    bool _3057 = _3055 != 0;
    float _3059 = float(uint(_3045));
    int _3061 = _3041 * _3037;
    int _3063 = _3061 + _2501;
    float _3065 = -_183;
    int _3067 = _1851 ? as_type<int>(_3065) : as_type<int>(_183);
    float _3069 = trunc(_3053);
    float _3071 = precise::max(_3069, 0.0);
    uint _3073 = uint(_3071);
    bool _3075 = uint(_3055) > 1u;
    float _3077 = as_type<float>(_2341) * _3059;
    int _3079 = _3027 & 3;
    bool _3081 = _3079 != 0;
    int _3083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3085 = _3083 != 0;
    bool _3087 = !_2519;
    int _3089 = _3087 ? _3023 : (-1);
    float _3091 = trunc(_3077);
    float _3093 = precise::max(_3091, 0.0);
    uint _3095 = uint(_3093);
    int _3097 = _3081 ? 0 : 1;
    bool _3099 = !_3085;
    float _3101 = _3099 ? _183 : as_type<float>(_3067);
    bool _3103 = uint(_3063) >= uint(_2180);
    int _3105 = _3089 & 3;
    bool _3107 = _3105 != 0;
    bool _3109 = !_3103;
    int _3111 = _3109 ? 0 : (-1);
    bool _3113 = uint(_3105) > 1u;
    int _3115 = ~_3097;
    int _3117 = _3115 + 1;
    int _3119 = _3117 + 1;
    int _3121 = _3119;
    if (!_3075)
    {
        int _3123 = ~_3097;
        int _3125 = _3123 + 1;
        _3121 = _3125;
    }
    int _3127 = _3121;
    int _3129 = _3089 & 3;
    bool _3131 = _3129 != 0;
    int _3133 = int(_2891) + int(_3033);
    int _3135 = _3131 ? 0 : 1;
    int _3137 = int(_2963) + int(_3073);
    int _3139 = ~_3135;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    int _3145 = _3143;
    if (!_3113)
    {
        int _3147 = ~_3135;
        int _3149 = _3147 + 1;
        _3145 = _3149;
    }
    int _3151 = _3145;
    bool _3153 = !_3107;
    int _3155 = _3153 ? 0 : 1;
    bool _3157 = _3105 != 3;
    int _3159 = ~_2204;
    int _3161 = _3159 + 1;
    bool _3163 = uint(_3105) >= 2u;
    int _3165 = int(_2995) + int(_3095);
    int _3167 = _3163 ? 0 : 1;
    float _3169 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _3173 = _775 > 0.5;
    int _3175 = _3161 * _3133;
    int _3177 = _3175 + _2551;
    float _3179 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _3181 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _3179;
    int _3183 = ~_3167;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    int _3189 = _2845 * _3165;
    int _3191 = _3189 + _2923;
    int _3193 = _3187;
    if (_3157)
    {
        int _3195 = ~_3167;
        int _3197 = _3195 + 1;
        _3193 = _3197;
    }
    int _3199 = _3193;
    float _3201 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _3203 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _3201;
    float _3205 = 1.0 / _3171;
    bool _3207 = uint(_3177) >= uint(_2204);
    int _3209 = _2877 * _3137;
    int _3211 = _3209 + _2823;
    float _3213 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _3215 = _3213 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _3217 = uint(_3191) >= uint(_2274);
    float _3219 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _3221 = _647 + _3219;
    bool _3223 = !_3207;
    int _3225 = _3223 ? 0 : (-1);
    float _3227 = 1.0 / _3181;
    bool _3229 = uint(_3211) >= uint(_2274);
    float _3231 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _3233 = _647 + _3231;
    bool _3235 = !_3217;
    int _3237 = _3235 ? 0 : (-1);
    bool _3239 = !_3229;
    int _3241 = _3239 ? 0 : (-1);
    bool _3243 = _3105 != 3;
    float _3245 = 1.0 / _3203;
    int _3247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3249 = _3247 != 0;
    float _3251 = _3221 * _3205;
    float _3253 = -_179;
    int _3255 = _3173 ? as_type<int>(_3253) : as_type<int>(_179);
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _3259 = _647 + _3257;
    bool _3261 = !_3243;
    int _3263 = _3261 ? 0 : (-1);
    bool _3265 = !_3249;
    float _3267 = _3265 ? _179 : as_type<float>(_3255);
    float _3269 = 1.0 / _3215;
    int _3271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3273 = _3271 != 0;
    float _3275 = _3233 * _3227;
    int _3277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3279 = _3277 != 0;
    float _3281 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _3283 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _3281;
    int _3285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3287 = _3285 != 0;
    float _3289 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _3291 = _647 + _3289;
    float _3293 = fma(_2659, _3275, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _3295 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _3297 = isnan(_647);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _3303 = _3299 || _3301;
    float _3305 = float(_3303);
    float _3307 = _3291 * _3245;
    float _3309 = fma(_3283, _3275, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _3311 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _3313 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _3311;
    bool _3315 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _3317 = isnan(_647);
    bool _3319 = _3315 || _3317;
    bool _3321 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _3323 = _3319 || _3321;
    float _3325 = float(_3323);
    float _3327 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _3329 = _3327 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _3331 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _3333 = isnan(_647);
    bool _3335 = _3331 || _3333;
    bool _3337 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _3339 = _3335 || _3337;
    float _3341 = float(_3339);
    float _3343 = _3259 * _3269;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _3349 = fma(_3313, _3275, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _3351 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _3353 = _3351 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _3355 = -_3305;
    float _3357 = _3355 + 1.0;
    float _3359 = fma(_3347, _3251, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _3361 = fma(_3329, _3251, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _3363 = fma(_3353, _3251, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _3365 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _3367 = isnan(_647);
    bool _3369 = _3365 || _3367;
    bool _3371 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _3373 = _3369 || _3371;
    float _3375 = float(_3373);
    float _3377 = _3325 * _3357;
    bool _3379 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _3381 = isnan(_647);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _3387 = _3383 || _3385;
    float _3389 = float(_3387);
    float _3391 = -_3325;
    float _3393 = _3391 + 1.0;
    float _3395 = -_3341;
    float _3397 = _3395 + 1.0;
    float _3399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3401 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _3403 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _3401;
    float _3405 = _3375 * _3393;
    float _3407 = _3389 * _3397;
    float _3409 = -_3375;
    float _3411 = _3409 + 1.0;
    float _3413 = -_3389;
    float _3415 = _3413 + 1.0;
    int _3417 = ~_3133;
    int _3419 = _3417 + _3225;
    int _3421 = _3419 + 1;
    float _3423 = _3349 * _3407;
    float _3425 = _3341 * _3411;
    float _3427 = _3309 * _3407;
    float _3429 = _3293 * _3407;
    float _3431 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _3431;
    float _3435 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _3437 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _3435;
    float _3439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3441 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _3443 = _3441 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _3445 = fma(_3433, _3307, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _3447 = fma(_3437, _3307, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _3449 = fma(_3403, _3307, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _3451 = fma(_3415, (*spvDescriptorSet0.vp_c9)._m0[123].x, _3423);
    float _3453 = fma(_3415, (*spvDescriptorSet0.vp_c9)._m0[123].y, _3427);
    float _3455 = fma(_3415, (*spvDescriptorSet0.vp_c9)._m0[123].z, _3429);
    float _3457 = fma(_3443, _3343, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _3459 = _1275 * (-0.15915493667125701904296875);
    float _3461 = fma(_3361, _3425, _3453);
    float _3463 = fma(_3359, _3425, _3451);
    float _3465 = fma(_3363, _3425, _3455);
    float _3467 = _3399 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3469 = fma(_3447, _3405, _3461);
    float _3471 = _3459 * 6.283185482025146484375;
    float _3473 = sin(_3471);
    float _3475 = fma(_3445, _3405, _3463);
    float _3477 = fma(_3449, _3405, _3465);
    float _3479 = _2741 + 0.5;
    float _3481 = _3439 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3483 = _3051 + (-0.5);
    float _3485 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _3487 = _3485 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _3489 = fma(_3467, _3479, _889);
    float _3491 = _3459 * 6.283185482025146484375;
    float _3493 = cos(_3491);
    float _3495 = -_3481;
    float _3497 = -_1153;
    float _3499 = fma(_3495, _3483, _3497);
    float _3501 = -_1007;
    float _3503 = _3501 + 1.0;
    int _3505 = _3089 >> 31;
    float _3507 = _985 + (-0.5);
    float _3509 = fma(_2194, _3051, _3499);
    float _3511 = -_3503;
    float _3513 = fma(_3511, _2741, _3489);
    int _3515 = _3505 & 3;
    float _3517 = _3101 * _3473;
    float _3519 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _3521 = _3519 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _3523 = fma(_3487, _3343, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    int _3525 = _3089 + _3515;
    out.m_68.x = _3513;
    out.m_68.y = _3509;
    float _3527 = -_3507;
    float _3529 = -_1323;
    float _3531 = fma(_3527, (*spvDescriptorSet0.vp_c9)._m0[90].y, _3529);
    float _3533 = fma(_3521, _3343, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _3535 = _3525 >> 2;
    float _3537 = _3101 * _3493;
    float _3539 = -_3517;
    float _3541 = fma(_3267, _3493, _3539);
    float _3543 = fma(_985, _2200, _3531);
    float _3545 = fma(_3457, _3377, _3475);
    float _3547 = fma(_3267, _3473, _3537);
    int _3549 = _3535 << 4;
    int _3551 = _3549 + 512;
    float _3553 = _3541 + 0.5;
    float _3555 = fma(_3523, _3377, _3469);
    float _3557 = fma(_3533, _3377, _3477);
    uint _3559 = uint(int(uint(_3551) >> uint(2)));
    uint _3561 = uint(int(uint(int(_3559)) >> uint(2)));
    int _3563 = int(_3559) & 3;
    float _3565 = (*spvDescriptorSet0.vp_c9)._m0[int(_3561)][_3563];
    int _3567 = int(_3559) + 1;
    uint _3569 = uint(int(uint(_3567) >> uint(2)));
    int _3571 = _3567 & 3;
    float _3573 = (*spvDescriptorSet0.vp_c9)._m0[int(_3569)][_3571];
    float _3575 = fma(_3553, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1213);
    float _3577 = _991 + 0.5;
    float _3579 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[127].x, _3545);
    float _3581 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[127].y, _3555);
    float _3583 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[127].z, _3557);
    float _3585 = fma(_3577, (*spvDescriptorSet0.vp_c9)._m0[90].x, _1321);
    float _3587 = _3579 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3589 = _3551 + 8;
    uint _3591 = uint(int(uint(_3589) >> uint(2)));
    uint _3593 = uint(int(uint(int(_3591)) >> uint(2)));
    int _3595 = int(_3591) & 3;
    float _3597 = (*spvDescriptorSet0.vp_c9)._m0[int(_3593)][_3595];
    int _3599 = int(_3591) + 1;
    uint _3601 = uint(int(uint(_3599) >> uint(2)));
    int _3603 = _3599 & 3;
    float _3605 = (*spvDescriptorSet0.vp_c9)._m0[int(_3601)][_3603];
    float _3607 = _3581 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3609 = _3583 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3611 = _3587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3613 = -_2210;
    float _3615 = fma(_991, _3613, _3585);
    float _3617 = _3607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3619 = _3609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3621 = _3547 + (-0.5);
    int _3623 = ~_3037;
    int _3625 = _3623 + _3111;
    int _3627 = _3625 + 1;
    out.m_70.x = _3615;
    out.m_70.y = _3543;
    int _3629 = abs(_3155);
    float _3631 = -_3621;
    float _3633 = -_893;
    float _3635 = fma(_3631, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3633);
    float _3637 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_72.x = _3611;
    out.m_72.y = _3617;
    out.m_72.z = _3619;
    int _3639 = _2180 * _3627;
    int _3641 = _3639 + _2501;
    int _3643 = ~_3165;
    int _3645 = _3643 + _3237;
    int _3647 = _3645 + 1;
    float _3649 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3651 = ~_3137;
    int _3653 = _3651 + _3241;
    int _3655 = _3653 + 1;
    float _3657 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3659 = !_2497;
    int _3661 = _3659 ? _3641 : (-1);
    int _3663 = _2274 * _3655;
    int _3665 = _3663 + _2823;
    float _3667 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3657);
    float _3669 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3671 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3673 = _2204 * _3421;
    int _3675 = _3673 + _2551;
    float _3677 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3679 = -_1489;
    float _3681 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3637);
    float _3683 = -_1489;
    float _3685 = fma(_3683, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3671);
    float _3687 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3689 = -_1489;
    float _3691 = fma(_3689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3677);
    float _3693 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3681);
    int _3695 = abs(_3151);
    float _3697 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3687);
    float _3699 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3701 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3669);
    int _3703 = ~_3695;
    int _3705 = _3703 + 1;
    int _3707 = _3705 + 1;
    float _3709 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3711 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3699);
    float _3713 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3685);
    int _3715 = _3707 * as_type<int>(_3573);
    int _3717 = abs(_3199);
    float _3719 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3721 = ~_3629;
    int _3723 = _3721 + 1;
    int _3725 = _3723 + 1;
    float _3727 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3729 = int(_3727);
    float _3731 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3709);
    float _3733 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3719);
    float _3735 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3711);
    int _3737 = _3725 * as_type<int>(_3565);
    int _3739 = _3737 + _3715;
    int _3741 = ~_3717;
    int _3743 = _3741 + 1;
    int _3745 = _3743 + 1;
    float _3747 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3701);
    float _3749 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3731);
    int _3751 = _2274 * _3647;
    int _3753 = _3751 + _2923;
    int _3755 = _3027 >> 31;
    int _3757 = _3745 * as_type<int>(_3597);
    int _3759 = _3757 + _3739;
    bool _3761 = !_3279;
    int _3763 = _3761 ? 0 : 1;
    float _3765 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3691);
    int _3767 = abs(_3263);
    bool _3769 = uint(_3055) >= 2u;
    int _3771 = abs(_3763);
    int _3773 = ~_3767;
    int _3775 = _3773 + 1;
    int _3777 = _3775 + 1;
    int _3779 = _3769 ? 0 : 1;
    bool _3781 = !_2679;
    int _3783 = _3781 ? _3753 : (-1);
    int _3785 = _3777 * as_type<int>(_3605);
    int _3787 = _3785 + _3759;
    bool _3789 = _3055 != 3;
    int _3791 = ~_3771;
    int _3793 = _3791 + 1;
    int _3795 = _3793 + 1;
    int _3797 = _3755 & 3;
    int _3799 = abs(_3729);
    int _3801 = _3787 * _3795;
    int _3803 = _3783 >> 31;
    int _3805 = _3027 + _3797;
    float _3807 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3809 = float(uint(_3799));
    int _3811 = _3803 & 3;
    float _3813 = float(uint(_3729));
    float _3815 = 1.0 / _3809;
    int _3817 = _3805 >> 2;
    int _3819 = _3783 + _3811;
    float _3821 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3667);
    int _3823 = ~_3779;
    int _3825 = _3823 + 1;
    int _3827 = _3825 + 1;
    int _3829 = _3827;
    if (_3789)
    {
        int _3831 = ~_3779;
        int _3833 = _3831 + 1;
        _3829 = _3833;
    }
    int _3835 = _3829;
    float _3837 = 1.0 / _3813;
    bool _3839 = !_2519;
    int _3841 = _3839 ? _3675 : (-1);
    float _3843 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3697);
    int _3845 = _3819 >> 2;
    int _3847 = _3783 & 3;
    bool _3849 = _3847 != 0;
    int _3851 = _3841 * _3771;
    int _3853 = _3851 + _3801;
    int _3855 = _3845 << 4;
    int _3857 = _3855 + 656;
    int _3859 = _3817 << 4;
    int _3861 = _3859 + 368;
    float _3863 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3733);
    uint _3865 = uint(int(uint(_3857) >> uint(2)));
    uint _3867 = uint(int(uint(int(_3865)) >> uint(2)));
    int _3869 = int(_3865) & 3;
    float _3871 = (*spvDescriptorSet0.vp_c9)._m0[int(_3867)][_3869];
    int _3873 = int(_3865) + 1;
    uint _3875 = uint(int(uint(_3873) >> uint(2)));
    int _3877 = _3873 & 3;
    float _3879 = (*spvDescriptorSet0.vp_c9)._m0[int(_3875)][_3877];
    int _3881 = _3783 & 3;
    bool _3883 = _3881 != 0;
    float _3885 = _3807 * _3713;
    int _3887 = abs(_3853);
    out.m_74.x = _3843;
    out.m_74.y = _3821;
    out.m_74.z = _3863;
    int _3889 = _3849 ? 0 : 1;
    float _3891 = fma(_3649, _3843, _3885);
    int _3893 = as_type<int>(_3815) + (-2);
    uint _3895 = uint(int(uint(_3861) >> uint(2)));
    uint _3897 = uint(int(uint(int(_3895)) >> uint(2)));
    int _3899 = int(_3895) & 3;
    float _3901 = (*spvDescriptorSet0.vp_c9)._m0[int(_3897)][_3899];
    int _3903 = int(_3895) + 1;
    uint _3905 = uint(int(uint(_3903) >> uint(2)));
    int _3907 = _3903 & 3;
    float _3909 = (*spvDescriptorSet0.vp_c9)._m0[int(_3905)][_3907];
    bool _3911 = uint(_3881) > 1u;
    float _3913 = _3735 + _3891;
    float _3915 = _3807 * _3765;
    int _3917 = as_type<int>(_3837) + (-2);
    float _3919 = float(uint(_3887));
    float _3921 = float(uint(_3853));
    int _3923 = ~_3889;
    int _3925 = _3923 + 1;
    int _3927 = _3925 + 1;
    float _3929 = as_type<float>(_3893) * _3919;
    float _3931 = fma(_3649, _3863, _3915);
    int _3933 = _3927;
    if (!_3911)
    {
        int _3935 = ~_3889;
        int _3937 = _3935 + 1;
        _3933 = _3937;
    }
    int _3939 = _3933;
    int _3941 = _3861 + 8;
    uint _3943 = uint(int(uint(_3941) >> uint(2)));
    uint _3945 = uint(int(uint(int(_3943)) >> uint(2)));
    int _3947 = int(_3943) & 3;
    float _3949 = (*spvDescriptorSet0.vp_c9)._m0[int(_3945)][_3947];
    int _3951 = int(_3943) + 1;
    uint _3953 = uint(int(uint(_3951) >> uint(2)));
    int _3955 = _3951 & 3;
    float _3957 = (*spvDescriptorSet0.vp_c9)._m0[int(_3953)][_3955];
    float _3959 = _3807 * _3693;
    bool _3961 = !_3057;
    int _3963 = _3961 ? 0 : 1;
    float _3965 = as_type<float>(_3917) * _3921;
    bool _3967 = _3881 != 3;
    float _3969 = trunc(_3929);
    float _3971 = precise::max(_3969, 0.0);
    uint _3973 = uint(_3971);
    bool _3975 = uint(_3881) >= 2u;
    float _3977 = fma(_3649, _3821, _3959);
    float _3979 = fma(_3807, _3807, 1.0);
    int _3981 = ~_3799;
    int _3983 = _3981 + 1;
    int _3985 = _3975 ? 0 : 1;
    float _3987 = trunc(_3965);
    float _3989 = precise::max(_3987, 0.0);
    uint _3991 = uint(_3989);
    bool _3993 = _3055 != 3;
    int _3995 = ~_3985;
    int _3997 = _3995 + 1;
    int _3999 = _3997 + 1;
    int _4001 = abs(_3939);
    int _4003 = _3999;
    if (_3967)
    {
        int _4005 = ~_3985;
        int _4007 = _4005 + 1;
        _4003 = _4007;
    }
    int _4009 = _4003;
    float _4011 = rsqrt(_3979);
    int _4013 = _3857 + 8;
    uint _4015 = uint(int(uint(_4013) >> uint(2)));
    uint _4017 = uint(int(uint(int(_4015)) >> uint(2)));
    int _4019 = int(_4015) & 3;
    float _4021 = (*spvDescriptorSet0.vp_c9)._m0[int(_4017)][_4019];
    int _4023 = int(_4015) + 1;
    uint _4025 = uint(int(uint(_4023) >> uint(2)));
    int _4027 = _4023 & 3;
    float _4029 = (*spvDescriptorSet0.vp_c9)._m0[int(_4025)][_4027];
    int _4031 = ~_3729;
    int _4033 = _4031 + 1;
    int _4035 = abs(_3127);
    int _4037 = _3983 * int(_3973);
    int _4039 = _4037 + _3887;
    int _4041 = abs(_3963);
    int _4043 = _4033 * int(_3991);
    int _4045 = _4043 + _3853;
    int _4047 = ~_4035;
    int _4049 = _4047 + 1;
    int _4051 = _4049 + 1;
    int _4053 = ~_4041;
    int _4055 = _4053 + 1;
    int _4057 = _4055 + 1;
    int _4059 = ~_4001;
    int _4061 = _4059 + 1;
    int _4063 = _4061 + 1;
    int _4065 = _4051 * as_type<int>(_3909);
    float _4067 = float(uint(_4039));
    float _4069 = _3807 * _4011;
    float _4071 = float(uint(_4045));
    int _4073 = _4057 * as_type<int>(_3901);
    int _4075 = _4073 + _4065;
    bool _4077 = !_2679;
    int _4079 = _4077 ? _3665 : (-1);
    int _4081 = _4063 * as_type<int>(_3879);
    float _4083 = as_type<float>(_3893) * _4067;
    float _4085 = -_3735;
    float _4087 = _4069 * _4085;
    float _4089 = as_type<float>(_3917) * _4071;
    bool _4091 = !_3883;
    int _4093 = _4091 ? 0 : 1;
    float _4095 = -_3747;
    float _4097 = _4069 * _4095;
    bool _4099 = !_3993;
    int _4101 = _4099 ? 0 : (-1);
    float _4103 = fma(_4011, _3713, _4087);
    int _4105 = abs(_4093);
    float _4107 = trunc(_4089);
    float _4109 = precise::max(_4107, 0.0);
    uint _4111 = uint(_4109);
    int _4113 = abs(_4101);
    float _4115 = fma(_4011, _3693, _4097);
    int _4117 = abs(_3835);
    float _4119 = -_3749;
    float _4121 = _4069 * _4119;
    int _4123 = ~_4105;
    int _4125 = _4123 + 1;
    int _4127 = _4125 + 1;
    float _4129 = _3747 + _3977;
    float _4131 = trunc(_4083);
    float _4133 = precise::max(_4131, 0.0);
    uint _4135 = uint(_4133);
    int _4137 = ~_4117;
    int _4139 = _4137 + 1;
    int _4141 = _4139 + 1;
    int _4143 = _4127 * as_type<int>(_3871);
    int _4145 = _4143 + _4081;
    int _4147 = ~_4113;
    int _4149 = _4147 + 1;
    int _4151 = _4149 + 1;
    float _4153 = fma(_4011, _3765, _4121);
    bool _4155 = _3881 != 3;
    int _4157 = _4141 * as_type<int>(_3949);
    int _4159 = _4157 + _4075;
    int _4161 = ~_3799;
    int _4163 = _4161 + 1;
    float _4165 = _3749 + _3931;
    bool _4167 = !_4155;
    int _4169 = _4167 ? 0 : (-1);
    int _4171 = _4151 * as_type<int>(_3957);
    int _4173 = _4171 + _4159;
    int _4175 = int(_3991) + int(_4111);
    out.m_76.x = _4103;
    out.m_76.y = _4115;
    out.m_76.z = _4153;
    int _4177 = ~_3729;
    int _4179 = _4177 + 1;
    bool _4181 = !_3273;
    int _4183 = _4181 ? 0 : 1;
    out.m_78.x = _3913;
    out.m_78.y = _4129;
    out.m_78.z = _4165;
    int _4185 = int(_3973) + int(_4135);
    int _4187 = abs(_4009);
    int _4189 = abs(_4169);
    int _4191 = abs(_4183);
    int _4193 = _4179 * _4175;
    int _4195 = _4193 + _3853;
    bool _4197 = !_3287;
    int _4199 = _4197 ? 0 : 1;
    int _4201 = _4163 * _4185;
    int _4203 = _4201 + _3887;
    int _4205 = ~_4187;
    int _4207 = _4205 + 1;
    int _4209 = _4207 + 1;
    int _4211 = abs(_4199);
    int _4213 = _4209 * as_type<int>(_4021);
    int _4215 = _4213 + _4145;
    int _4217 = ~_4191;
    int _4219 = _4217 + 1;
    int _4221 = _4219 + 1;
    int _4223 = ~_4189;
    int _4225 = _4223 + 1;
    int _4227 = _4225 + 1;
    bool _4229 = uint(_4195) >= uint(_3729);
    int _4231 = _4173 * _4221;
    bool _4233 = uint(_4203) >= uint(_3799);
    int _4235 = _4227 * as_type<int>(_4029);
    int _4237 = _4235 + _4215;
    int _4239 = _3853 ^ _3729;
    int _4241 = _3661 * _4191;
    int _4243 = _4241 + _4231;
    bool _4245 = !_4229;
    int _4247 = _4245 ? 0 : (-1);
    float _4249 = _1419 + (-0.5);
    bool _4251 = !_4233;
    int _4253 = _4251 ? 0 : (-1);
    uint _4255 = uint(int(uint(_4239) >> uint(31)));
    float _4257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4259 = ~_4175;
    int _4261 = _4259 + _4247;
    int _4263 = _4261 + 1;
    int _4265 = ~_4253;
    int _4267 = _4185 + _4265;
    int _4269 = _4267 + 1;
    int _4271 = ~int(_4255);
    int _4273 = _4271 + 1;
    int _4275 = _3729 * _4263;
    int _4277 = _4275 + _3853;
    bool _4279 = _3729 == 0;
    float _4281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4283 = _4269 ^ _4273;
    int _4285 = ~_4211;
    int _4287 = _4285 + 1;
    int _4289 = _4287 + 1;
    bool _4291 = _3729 == 0;
    int _4293 = ~_4273;
    int _4295 = _4293 + _4283;
    int _4297 = _4295 + 1;
    int _4299 = _4237 * _4289;
    bool _4301 = !_4279;
    int _4303 = _4301 ? _4277 : (-1);
    float _4305 = _4257 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4307 = !_4291;
    int _4309 = _4307 ? _4297 : (-1);
    int _4311 = _4079 * _4211;
    int _4313 = _4311 + _4299;
    float _4315 = float(_4303);
    float _4317 = _3011 + 0.5;
    float _4319 = float(_4309);
    float _4321 = _4281 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4323 = float(_4243);
    float _4325 = fma(_4305, _4315, _1317);
    float _4327 = -_1297;
    float _4329 = fma(_4321, _4319, _4327);
    float _4331 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2242);
    float _4333 = fma(_4305, _4317, _4325);
    float _4335 = -_1295;
    float _4337 = _4335 + 1.0;
    float _4339 = -_4321;
    float _4341 = fma(_4339, _4249, _4329);
    out.m_80.x = _4323;
    float _4343 = -_2234;
    float _4345 = fma(_3011, _4343, _4333);
    float _4347 = _2405 * _2155;
    float _4349 = _4331 + _2079;
    float _4351 = fma(_1419, _2250, _4341);
    float _4353 = -_2405;
    float _4355 = _4353 + 1.0;
    float _4357 = _2166 * _4347;
    bool _4359 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4361 = isnan(_1859);
    bool _4363 = _4359 || _4361;
    bool _4365 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4367 = _4363 || _4365;
    float _4369 = -_1285;
    float _4371 = _4369 + 1.0;
    float _4373 = float(_4313);
    float _4375 = _2176 * _4347;
    float _4377 = _4349 * 0.5;
    float _4379 = fma(_2172, _4357, _2160);
    float _4381 = fma(_2174, _4357, _2162);
    out.m_80.z = _4373;
    float _4383 = _2166 * _4355;
    float _4385 = -_4337;
    float _4387 = fma(_3541, _4385, _3575);
    float _4389 = fma(_3547, _4371, _3635);
    out.m_82.z = _4377;
    out.m_82.w = _2079;
    float _4391 = _4357;
    float _4393 = _4387;
    float _4395 = _4331;
    float _4397 = _2125;
    if (!_4367)
    {
        _4391 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4399 = _4391;
    float _4401 = fma(_2166, _4375, _2164);
    out.m_84.x = _4387;
    out.m_84.y = _4389;
    out.m_84.z = _4345;
    out.m_84.w = _4351;
    out.m_86.x = _4379;
    out.m_86.y = _4381;
    out.m_86.z = _4401;
    out.m_86.w = _4383;
    out.gl_Position.x = _2125;
    out.gl_Position.y = _2119;
    out.gl_Position.z = _4331;
    out.gl_Position.w = _2079;
    float _4403 = _1833 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4405 = _4399;
    float _4407 = _4399;
    if (!_4367)
    {
        _4393 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4409 = _4393;
    float _4411 = _4409;
    float _4413 = _4409;
    if (!_4367)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4415 = _2479;
    float _4417 = _4415;
    float _4419 = _4415;
    if (!_4367)
    {
        _4395 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4421 = _4395;
    float _4423 = _4421;
    float _4425 = _4421;
    if (!_4367)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4427 = _2481;
    float _4429 = _4427;
    float _4431 = _4427;
    if (!_4367)
    {
        _4397 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4433 = _4397;
    bool _4435 = !_4367;
    float _4437 = _4433;
    float _4439 = _4433;
    if (!_4435)
    {
        bool _4441 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4443 = isnan(_1859);
        bool _4445 = _4441 || _4443;
        bool _4447 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4449 = _4445 || _4447;
        if (!_4449)
        {
            float _4451 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4453 = _1859 + _4451;
            float _4455 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4457 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4455;
            float _4459 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4461 = _4459 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4463 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4465 = _4463 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4467 = 1.0 / _4457;
            float _4469 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4471 = _4469 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4473 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4475 = _4473 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4477 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4479 = _4477 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4481 = _4453 * _4467;
            float _4483 = precise::clamp(_4481, 0.0, 1.0);
            float _4485 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4487 = _4485 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4489 = fma(_4483, _4461, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4491 = fma(_4483, _4465, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4493 = fma(_4483, _4487, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4495 = fma(_4483, _4471, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4497 = fma(_4483, _4475, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4499 = fma(_4483, _4479, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4439 = _4489;
            _4419 = _4497;
            _4431 = _4491;
            _4413 = _4495;
            _4407 = _4493;
            _4425 = _4499;
            _4501 = true;
        }
        else
        {
            bool _4503 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4505 = isnan(_1859);
            bool _4507 = _4503 || _4505;
            bool _4509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4511 = _4507 || _4509;
            if (!_4511)
            {
                _4411 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4513 = _4411;
            _4413 = _4513;
            if (!_4511)
            {
                _4417 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4515 = _4417;
            _4419 = _4515;
            if (!_4511)
            {
                _4423 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4517 = _4423;
            _4425 = _4517;
            if (!_4511)
            {
                _4429 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4519 = _4429;
            _4431 = _4519;
            if (!_4511)
            {
                _4437 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4521 = _4437;
            _4439 = _4521;
            if (!_4511)
            {
                _4405 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4523 = _4405;
            bool _4525 = !_4511;
            _4407 = _4523;
            if (!_4525)
            {
                bool _4527 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4529 = isnan(_1859);
                bool _4531 = _4527 || _4529;
                bool _4533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4535 = _4531 || _4533;
                if (!_4535)
                {
                    float _4537 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4539 = _1859 + _4537;
                    float _4541 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4543 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4541;
                    float _4545 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4547 = _4545 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4549 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4551 = _4549 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4553 = 1.0 / _4543;
                    float _4555 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4557 = _4555 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4559 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4561 = _4559 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4563 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4565 = _4563 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4567 = _4539 * _4553;
                    float _4569 = precise::clamp(_4567, 0.0, 1.0);
                    float _4571 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4573 = _4571 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4575 = fma(_4569, _4547, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4577 = fma(_4569, _4551, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4579 = fma(_4569, _4573, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4581 = fma(_4569, _4557, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4583 = fma(_4569, _4561, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4585 = fma(_4569, _4565, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4439 = _4575;
                    _4419 = _4583;
                    _4431 = _4577;
                    _4413 = _4581;
                    _4407 = _4579;
                    _4425 = _4585;
                    _4501 = true;
                }
                else
                {
                    _4439 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4419 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4431 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4413 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4407 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4425 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4501 = false;
    float _4587 = _4439;
    float _4589 = _4419;
    float _4591 = _4431;
    float _4593 = _4413;
    float _4595 = _4407;
    float _4597 = _4425;
    float _4599 = _4403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4601 = fma(_4129, -0.5, 0.5);
    float _4603 = precise::clamp(_4601, 0.0, 1.0);
    float _4605 = -_4587;
    float _4607 = _4589 + _4605;
    float _4609 = -_4591;
    float _4611 = _4593 + _4609;
    out.m_47.x = _4599;
    float _4613 = fma(_4603, _4607, _4587);
    float _4615 = -_4595;
    float _4617 = _4597 + _4615;
    float _4619 = fma(_4603, _4611, _4591);
    float _4621 = _4613 * 0.586610972881317138671875;
    bool _4623 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4625 = fma(_4603, _4617, _4595);
    out.m_88.x = 0.0;
    float _4627 = fma(_4619, 0.298911988735198974609375, _4621);
    bool _4629 = _1833 > 0.0;
    bool _4631 = isnan(_1833);
    bool _4633 = _4629 || _4631;
    bool _4635 = isnan(0.0);
    bool _4637 = _4633 || _4635;
    float _4639 = fma(_4625, 0.114477999508380889892578125, _4627);
    float _4641 = -_4639;
    float _4643 = _4619 + _4641;
    float _4645 = -_4639;
    float _4647 = _4613 + _4645;
    float _4649 = -_4639;
    float _4651 = _4625 + _4649;
    float _4653 = fma(_4643, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4639);
    float _4655 = fma(_4647, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4639);
    float _4657 = fma(_4651, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4639);
    bool _4659 = !_4623;
    if (!_4659)
    {
        float _4661 = -_1759;
        float _4663 = _4661 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4665 = -_1761;
        float _4667 = _4665 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4669 = -_1763;
        float _4671 = _4669 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4673 = _4663 * _4663;
        float _4675 = fma(_4667, _4667, _4673);
        float _4677 = fma(_4671, _4671, _4675);
        float _4679 = sqrt(_4677);
        float _4681 = rsqrt(_4677);
        float _4683 = -_4679;
        float _4685 = _4683 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4687 = _4685 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4689 = precise::clamp(_4687, 0.0, 1.0);
        float _4691 = _4667 * _4681;
        float _4693 = _4663 * _4681;
        float _4695 = abs(_4689);
        float _4697 = log2(_4695);
        float _4699 = _4671 * _4681;
        float _4701 = _4691 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4703 = _4129 * _4693;
        float _4705 = -_4693;
        float _4707 = -_4701;
        float _4709 = fma(_4705, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4707);
        float _4711 = fma(_3913, _4691, _4703);
        float _4713 = -_4699;
        float _4715 = fma(_4713, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4709);
        float _4717 = fma(_4165, _4699, _4711);
        float _4719 = precise::clamp(_4717, 0.0, 1.0);
        float _4721 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4723 = _4715 + _4721;
        float _4725 = _4697 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4727 = _4723 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4729 = precise::clamp(_4727, 0.0, 1.0);
        float _4731 = exp2(_4725);
        float _4733 = _4731 * _4729;
        float _4735 = _4719 * _4733;
        float _4737 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4739 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4741 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _4737;
        out.m_88.y = _4739;
        out.m_88.z = _4741;
    }
    out.m_90.x = _4653;
    out.m_90.y = _4655;
    out.m_90.z = _4657;
    if (_4637)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4743;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4501 = false;
    bool _639 = false;
    bool _453 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4800 = as_type<float>(_125);
        out.gl_Position.z = _4800;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_49.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4869 = as_type<float>(_163);
        out.gl_Position.z = _4869;
    }
    if (_157)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _169 = as_type<int>(_165) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_165) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_167;
    float _203;
    if (!_185)
    {
        float _187 = in.m_54.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_109);
        float _209 = 1.0 / _207;
        float _211 = _143 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _213 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _239 = in.m_56.x;
    float _241 = in.m_56.y;
    float _243 = 1.0 / _225;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = 1.0 / _229;
    float _249 = 1.0 / _233;
    float _251 = _217 * _243;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = _213 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _259 = _213 + _257;
    float _261 = 1.0 / _237;
    float _263 = _221 * _247;
    bool _265 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _267 = isnan(_213);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_213);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _255 * _249;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _291;
    bool _295 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _297 = isnan(_213);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = fma(_293, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = -_305;
    float _311 = _309 + 1.0;
    float _313 = _259 * _261;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    bool _319 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _321 = isnan(_213);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _275 * _311;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = fma(_317, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = -_275;
    float _341 = _339 + 1.0;
    bool _343 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _345 = isnan(_213);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = fma(_335, _263, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = _329 * _341;
    float _363 = -_329;
    float _365 = _363 + 1.0;
    float _367 = fma(_357, _263, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = -_353;
    float _371 = _369 + 1.0;
    float _373 = _287 * _365;
    float _375 = -_287;
    float _377 = _375 + 1.0;
    float _379 = _353 * _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = _307 * _379;
    float _391 = _337 * _379;
    float _393 = fma(_383, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_387, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _389);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _391);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _409 = fma(_367, _373, _397);
    float _411 = fma(_359, _373, _399);
    float _413 = fma(_403, _313, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _415 = fma(_407, _313, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _417 = fma(_393, _361, _409);
    float _419 = fma(_395, _361, _411);
    float _421 = fma(_413, _331, _417);
    float _423 = fma(_415, _331, _419);
    float _425 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[147].x, _421);
    float _427 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[147].y, _423);
    float _429 = _425 * _239;
    float _431 = _427 * _241;
    bool _433 = !_245;
    float _451;
    if (!_433)
    {
        float _435 = in.m_54.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].x, _143);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_109);
        float _457 = 1.0 / _455;
        float _459 = _143 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _461 + _463;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _461 + _479;
    bool _483 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _485 = isnan(_461);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _503 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _505 = isnan(_461);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_477;
    float _517 = _515 + 1.0;
    float _519 = 1.0 / _501;
    float _521 = _513 * _517;
    float _523 = -_513;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _533 = 1.0 / _497;
    float _535 = _493 * _525;
    float _537 = -_493;
    float _539 = _537 + 1.0;
    float _541 = _481 * _519;
    float _543 = _465 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_529, _543, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _555 = fma(_547, _543, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = fma(_551, _543, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _559 = _553 * _535;
    float _561 = _555 * _535;
    float _563 = _557 * _535;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _577 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].x, _559);
    float _579 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].y, _561);
    float _581 = fma(_567, _541, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _583 = fma(_571, _541, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _585 = fma(_575, _541, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].z, _563);
    float _589 = fma(_581, _521, _577);
    float _591 = fma(_583, _521, _579);
    float _593 = fma(_585, _521, _587);
    float _595 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].x, _589);
    float _597 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].y, _591);
    float _599 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    float _601 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _607 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _607;
    out.m_58.y = _609;
    out.m_58.z = _611;
    bool _613 = !_531;
    float _615 = _541;
    float _617 = _587;
    int _619 = as_type<int>(_605);
    float _637;
    if (!_613)
    {
        float _621 = in.m_54.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].z, _143);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_109);
        float _643 = 1.0 / _641;
        float _645 = _143 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = in.m_54.z;
    float _651 = in.m_54.w;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _655 = _653 != 0;
    float _657 = _577;
    float _659 = _559;
    if (_655)
    {
        float _661 = in.m_54.x;
        float _663 = in.m_54.y;
        _657 = _661;
        _659 = _663;
    }
    float _665 = _657;
    float _667 = _659;
    float _669 = 0.0;
    if (_655)
    {
        _669 = 1.0;
    }
    float _671 = _669;
    float _673 = 0.0;
    float _675 = _671;
    if (_655)
    {
        _673 = 1.0;
    }
    float _677 = _673;
    float _679 = 0.0;
    float _681 = _677;
    if (_655)
    {
        _679 = 1.0;
    }
    float _683 = _679;
    float _685 = _649 * 2.0;
    float _687 = floor(_685);
    float _689 = 0.0;
    float _691 = _665;
    float _693 = _667;
    float _695 = _683;
    if (_655)
    {
        _689 = _665;
    }
    float _697 = _689;
    float _699 = _697;
    if (_655)
    {
        _615 = _667;
    }
    float _701 = _615;
    bool _703 = _687 > 0.0;
    bool _705 = _687 >= 0.0;
    bool _707 = isnan(_687);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    float _715 = _687;
    float _717 = _701;
    if (_655)
    {
        _715 = _697;
    }
    float _719 = _715;
    int _721 = _713 ? 0 : 1;
    int _723 = _721;
    float _725 = _719;
    if (_655)
    {
        _617 = _697;
    }
    float _727 = _617;
    int _729 = ~_721;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    int _735 = _733;
    float _737 = _727;
    if (!_703)
    {
        int _739 = ~_721;
        int _741 = _739 + 1;
        _735 = _741;
    }
    int _743 = _735;
    if (_655)
    {
        _619 = 0;
        _723 = 0;
    }
    int _745 = _619;
    int _747 = _723;
    int _749 = _745;
    int _751 = _747;
    if (!_655)
    {
        float _753 = in.m_54.x;
        float _755 = in.m_54.y;
        float _757 = in.m_54.z;
        float _759 = _753 * 3.1415927410125732421875;
        float _761 = _755 * 3.1415927410125732421875;
        float _763 = _759 * 0.15915493667125701904296875;
        float _765 = _761 * 0.15915493667125701904296875;
        float _767 = _763 * 6.283185482025146484375;
        float _769 = sin(_767);
        float _771 = _765 * 6.283185482025146484375;
        float _773 = sin(_771);
        _691 = _753;
        _693 = _755;
        _749 = 1;
        _725 = _769;
        _751 = 2;
        _717 = _773;
        _681 = 1.2345600128173828125;
        _699 = _755;
        _675 = 7.345489978790283203125;
        _695 = 5.839270114898681640625;
        _737 = _757;
    }
    float _775 = _691;
    float _777 = _693;
    int _779 = _749;
    float _781 = _725;
    int _783 = _751;
    float _785 = _717;
    float _787 = _681;
    float _789 = _699;
    float _791 = _675;
    float _793 = _695;
    float _795 = _737;
    float _797 = _775 * 2.0;
    float _799 = _777 * 2.0;
    bool _801 = _779 != 1;
    float _803 = _781 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _805 = floor(_797);
    float _807 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _809 = _777 + _775;
    bool _811 = _783 != 2;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _815 = floor(_799);
    bool _817 = _649 > 0.5;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _821 = fma(_807, -2.0, _813);
    float _823 = _797;
    float _825 = _807;
    float _827 = _799;
    float _829 = _803;
    if (!_801)
    {
        _823 = _649;
    }
    float _831 = _823;
    float _833 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _835 = int(_811);
    int _837 = _801 ? 2 : 0;
    int _839 = _835 | _837;
    int _841 = _817 ? 4 : 0;
    int _843 = _839 | _841;
    int _845 = false ? 8 : 0;
    int _847 = _843 | _845;
    int _849 = false ? 16 : 0;
    int _851 = _847 | _849;
    int _853 = false ? 32 : 0;
    int _855 = _851 | _853;
    int _857 = false ? 64 : 0;
    int _859 = _855 | _857;
    int _861 = _859 & 4;
    float _863 = -_819;
    float _865 = fma(_803, 2.0, _863);
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _869 = _867 != 0;
    int _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _873 = _871 != 0;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _877 = _875 != 0;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _881 = int(_879);
    float _883 = -_183;
    float _885 = _817 ? _883 : _183;
    float _887 = -_143;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[91].x, _865);
    bool _891 = _777 > 0.5;
    float _893 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _821);
    float _895 = _831;
    float _897 = _885;
    if (!_801)
    {
        _825 = _649;
    }
    float _899 = _825;
    float _901 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = _899;
    if (!_801)
    {
        _827 = _777;
    }
    float _905 = _827;
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _909 = int(_907);
    float _911 = _905;
    if (!_801)
    {
        _829 = _777;
    }
    float _913 = _829;
    int _915 = int(_811);
    int _917 = _801 ? 2 : 0;
    int _919 = _915 | _917;
    int _921 = _891 ? 4 : 0;
    int _923 = _919 | _921;
    int _925 = _869 ? 8 : 0;
    int _927 = _923 | _925;
    int _929 = _873 ? 16 : 0;
    int _931 = _927 | _929;
    int _933 = _877 ? 32 : 0;
    int _935 = _931 | _933;
    int _937 = false ? 64 : 0;
    int _939 = _935 | _937;
    int _941 = _939 & 4;
    float _943 = -_179;
    int _945 = _891 ? as_type<int>(_943) : as_type<int>(_179);
    float _947 = _913;
    float _949 = as_type<float>(_941);
    if (_801)
    {
        _895 = _777;
    }
    float _951 = _895;
    if (_801)
    {
        _903 = _777;
    }
    float _953 = _903;
    if (_801)
    {
        _911 = _775;
    }
    float _955 = _911;
    if (_801)
    {
        _947 = _775;
    }
    float _957 = _947;
    float _959 = _955 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _961 = _805 >= 0.0;
    bool _963 = isnan(_805);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _973 = _815 >= 0.0;
    bool _975 = isnan(_815);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.0);
    bool _981 = _977 || _979;
    bool _983 = !_877;
    float _985 = _983 ? _183 : _885;
    float _987 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[93].z, _971);
    bool _989 = !_873;
    float _991 = _989 ? _179 : as_type<float>(_945);
    float _993 = _775 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1005 = _1003 != 0;
    float _1007 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[92].z, _987);
    bool _1009 = !_1001;
    float _1011 = _1009 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1015 = !_997;
    int _1017 = _1015 ? 0 : 1;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1021 = !_1005;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = -_1013;
    float _1027 = fma(_993, 2.0, _1025);
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1039 = _1037 != 0;
    float _1041 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1019);
    float _1043 = _785 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1045 = _993;
    float _1047 = _1011;
    if (_811)
    {
        _1045 = _777;
    }
    float _1049 = _1045;
    float _1051 = _809 + (-1.0);
    float _1053 = _1049;
    if (_811)
    {
        _897 = _775;
    }
    float _1055 = _897;
    float _1057 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1041);
    bool _1059 = !_1035;
    int _1061 = _1059 ? 0 : 1;
    bool _1063 = !_1031;
    int _1065 = _1063 ? 0 : 1;
    bool _1067 = !_1039;
    float _1069 = _1067 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1071 = _1055;
    float _1073 = _1069;
    if (!_811)
    {
        _1071 = _649;
    }
    float _1075 = _1071;
    if (!_811)
    {
        _1053 = _775;
    }
    float _1077 = _1053;
    int _1079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1081 = _1079 != 0;
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1085 = _1083 != 0;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1089 = _1087 != 0;
    float _1091 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1093 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1095 = _805 > 0.0;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1099 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1101 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1097);
    float _1103 = float(_109);
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1109 = _969 ? 0 : 1;
    float _1111 = -_1105;
    float _1113 = fma(_959, 2.0, _1111);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1117 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1107);
    bool _1119 = _815 > 0.0;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1123 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1125 = log2(_1123);
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1129 = !_1081;
    int _1131 = _1129 ? 0 : 1;
    float _1133 = _951 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1135 = -_1121;
    float _1137 = fma(_1091, 2.0, _1135);
    float _1139 = fma(_1043, -2.0, _1127);
    int _1141 = abs(_1131);
    float _1143 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1145 = int(_1143);
    float _1147 = fma(_1133, -2.0, _1115);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1151 = float(_743);
    float _1153 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1139);
    float _1155 = float(_1141);
    float _1157 = fma(_1093, -2.0, _1149);
    float _1159 = float(_881);
    float _1161 = 1.0 / _1103;
    float _1163 = _1125 * _143;
    float _1165 = _1155 * _1151;
    float _1167 = in.m_60.x;
    float _1169 = in.m_60.y;
    float _1171 = in.m_60.z;
    float _1173 = float(_909);
    float _1175 = _1165 * (-2.0);
    float _1177 = 1.0 / _1159;
    float _1179 = float(_1145);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1183 = 1.0 + _1181;
    int _1185 = _981 ? 0 : 1;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1189 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1101);
    int _1191 = ~_1185;
    int _1193 = _1191 + 1;
    int _1195 = _1193 + 1;
    float _1197 = exp2(_1163);
    float _1199 = _1161 * _143;
    float _1201 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1187);
    int _1203 = _1195;
    if (!_1119)
    {
        int _1205 = ~_1185;
        int _1207 = _1205 + 1;
        _1203 = _1207;
    }
    int _1209 = _1203;
    float _1211 = -_143;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1027);
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1217 = 1.0 / _1173;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1221 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1223 = isnan(1.0);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1229 = _1225 || _1227;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1233 = ~_1109;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    float _1239 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1219);
    int _1241 = _1237;
    if (!_1095)
    {
        int _1243 = ~_1109;
        int _1245 = _1243 + 1;
        _1241 = _1245;
    }
    int _1247 = _1241;
    float _1249 = _1177 * _143;
    float _1251 = 1.0 / _1179;
    float _1253 = -_1197;
    float _1255 = _1253 + 1.0;
    bool _1257 = !_1085;
    int _1259 = _1257 ? 0 : 1;
    float _1261 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1231);
    bool _1263 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1265 = isnan(0.0);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1271 = _1267 || _1269;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1275 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1201);
    float _1277 = 1.0 / _1183;
    float _1279 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1215);
    float _1281 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1273);
    float _1283 = _1271 ? _1255 : 0.0;
    float _1285 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1239);
    float _1287 = _775 + (-0.5);
    float _1289 = fma(_1175, _1167, _1167);
    bool _1291 = !_1089;
    int _1293 = _1291 ? 0 : 1;
    float _1295 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1279);
    float _1297 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1147);
    int _1299 = abs(_1259);
    float _1301 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1281);
    float _1303 = float(_1247);
    float _1305 = _1217 * _143;
    float _1307 = float(_1299);
    float _1309 = _1251 * _143;
    float _1311 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1261);
    float _1313 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1117);
    float _1315 = -_143;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1113);
    float _1319 = -_143;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1137);
    float _1323 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1157);
    if (_1229)
    {
        float _1325 = _1283 * _1277;
        _147 = _1325;
    }
    float _1327 = _147;
    float _1329 = fma(_1099, _1175, _1099);
    float _1331 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1289);
    int _1333 = abs(_1293);
    float _1335 = _1307 * _1303;
    float _1337 = _777 + _649;
    float _1339 = fma(_1329, _1327, _1331);
    float _1341 = _1335 * (-2.0);
    float _1343 = _1337 + (-1.0);
    float _1345 = float(_1209);
    float _1347 = _777 + (-0.5);
    float _1349 = float(_1333);
    float _1351 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1353 = _775 + _649;
    float _1355 = _649 + (-0.5);
    float _1357 = _1339 * 0.15915493667125701904296875;
    float _1359 = _1349 * _1345;
    float _1361 = fma(_1341, _1169, _1169);
    float _1363 = _1353 + (-1.0);
    float _1365 = _1359 * (-2.0);
    float _1367 = fma(_1351, _1341, _1351);
    float _1369 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1361);
    float _1371 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1373 = fma(_1365, _1171, _1171);
    float _1375 = _1357 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = fma(_1367, _1327, _1369);
    float _1381 = fma(_1371, _1365, _1371);
    float _1383 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1373);
    bool _1385 = _651 > 0.5;
    float _1387 = _1379 * 0.15915493667125701904296875;
    float _1389 = fma(_1381, _1327, _1383);
    float _1391 = _1357 * 6.283185482025146484375;
    float _1393 = sin(_1391);
    float _1395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1399 = _1389 * 0.15915493667125701904296875;
    float _1401 = -_183;
    int _1403 = _1385 ? as_type<int>(_1401) : as_type<int>(_183);
    float _1405 = _833 * _1395;
    float _1407 = in.m_44.x;
    float _1409 = in.m_44.y;
    float _1411 = in.m_44.z;
    float _1413 = _1387 * 6.283185482025146484375;
    float _1415 = sin(_1413);
    bool _1417 = !_869;
    float _1419 = _1417 ? _183 : as_type<float>(_1403);
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1423 = _1421 != 0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1431 = _1429 != 0;
    int _1433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1435 = _1433 != 0;
    float _1437 = _1387 * 6.283185482025146484375;
    float _1439 = cos(_1437);
    bool _1441 = !_1427;
    int _1443 = _1441 ? 0 : 1;
    bool _1445 = !_1423;
    int _1447 = _1445 ? 0 : 1;
    bool _1449 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1451 = isnan(0.5);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1457 = _1453 || _1455;
    bool _1459 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1461 = isnan(0.5);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1467 = _1463 || _1465;
    float _1469 = _1399 * 6.283185482025146484375;
    float _1471 = cos(_1469);
    float _1473 = _1377 * _1415;
    float _1475 = _1393 * _1415;
    float _1477 = _901 * _1397;
    bool _1479 = !_1431;
    int _1481 = _1479 ? 0 : 1;
    bool _1483 = !_1435;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = _1399 * 6.283185482025146484375;
    float _1489 = sin(_1487);
    float _1491 = _1377 * _1439;
    float _1493 = _1393 * _1439;
    float _1495 = _1377 * _1471;
    float _1497 = _1393 * _1471;
    float _1499 = _1439 * _1471;
    float _1501 = _1415 * _1471;
    float _1503 = _1495 * _1477;
    float _1505 = _1497 * _1477;
    float _1507 = fma(_1489, _1491, _1475);
    float _1509 = -_1473;
    float _1511 = fma(_1489, _1493, _1509);
    float _1513 = -_1493;
    float _1515 = fma(_1489, _1473, _1513);
    float _1517 = -_1477;
    float _1519 = _1489 * _1517;
    float _1521 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1523 = fma(_1507, _1405, _1503);
    float _1525 = fma(_1489, _1475, _1491);
    float _1527 = fma(_1499, _1405, _1519);
    float _1529 = fma(_1511, _1405, _1505);
    float _1531 = fma(_1515, _1521, _1523);
    float _1533 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1535 = fma(_1501, _1521, _1527);
    float _1537 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1541 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1533);
    float _1543 = fma(_1525, _1521, _1529);
    float _1545 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1539);
    float _1549 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1537);
    float _1551 = fma(_1411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1541);
    float _1553 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1545);
    float _1555 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1547);
    float _1557 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1559 = fma(_1411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1549);
    float _1561 = _1551 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1563 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1553);
    float _1565 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1567 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1557);
    float _1569 = _1559 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1571 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1573 = _1561 + _1565;
    float _1575 = fma(_1411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1567);
    float _1577 = _1569 + _1571;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1581 = _1573 + _1579;
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1585 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1589 = _1577 + _1587;
    float _1591 = _1581 * _1581;
    float _1593 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1585);
    float _1597 = fma(_1589, _1589, _1591);
    float _1599 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1601 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1603 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1595);
    float _1605 = sqrt(_1597);
    float _1607 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1599);
    float _1609 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1601);
    float _1611 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1613 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1615 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1609);
    float _1617 = 1.0 / _1613;
    float _1619 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1621 = _1619 + _1613;
    bool _1623 = _1605 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1625 = _1621 * _1617;
    float _1627 = _1625 * 0.5;
    float _1629 = _1583 + _1611;
    float _1631 = _1621;
    float _1633 = _1607;
    float _1635 = _1611;
    float _1637 = _1573;
    float _1639 = _1629;
    bool _1641 = _1623;
    if (!_1623)
    {
        _1631 = _1577;
    }
    float _1643 = _1631;
    float _1645 = _1643;
    if (!_1623)
    {
        _1633 = _1573;
    }
    float _1647 = _1633;
    float _1649 = _1647;
    if (!_1623)
    {
        _1635 = _1629;
    }
    float _1651 = _1635;
    bool _1653 = !_1623;
    float _1655 = _1651;
    if (!_1653)
    {
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1661 = _1605 + _1659;
        float _1663 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1665 = rsqrt(_1597);
        float _1667 = _1661 * _1657;
        float _1669 = _1667 * 0.15915493667125701904296875;
        float _1671 = _1669 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1669 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        float _1679 = _1673 + (-1.0);
        float _1681 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = fma(_1677, _1663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1685 = fma(_1629, _1673, _1681);
        float _1687 = _1665 * _1683;
        float _1689 = fma(_1589, _1687, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1691 = fma(_1581, _1687, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1645 = _1689;
        _1649 = _1691;
        _1655 = _1685;
    }
    float _1693 = _1645;
    float _1695 = _1649;
    float _1697 = _1655;
    float _1699 = _1697;
    float _1701 = _1693;
    float _1703 = _1695;
    if (_1467)
    {
        _1637 = 1.0;
    }
    float _1705 = _1637;
    float _1707 = _1705;
    if (!_1457)
    {
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1711 = _1583 + _1709;
        float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1715 = _1569 + _1713;
        float _1717 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1719 = -_1569;
        float _1721 = _1719 + _1693;
        float _1723 = _1711 * _1711;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1727 = _1561 + _1725;
        float _1729 = -_1561;
        float _1731 = _1729 + _1695;
        float _1733 = -_1583;
        float _1735 = _1733 + _1697;
        float _1737 = fma(_1715, _1715, _1723);
        float _1739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1741 = fma(_1727, _1727, _1737);
        float _1743 = sqrt(_1741);
        float _1745 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1747 = precise::min(_1743, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1749 = _1747 * _1739;
        float _1751 = _1745 * _1749;
        float _1753 = fma(_1721, _1751, _1569);
        float _1755 = fma(_1731, _1751, _1561);
        float _1757 = fma(_1735, _1751, _1583);
        _1699 = _1757;
        _1701 = _1753;
        _1703 = _1755;
        _1639 = _1739;
    }
    float _1759 = _1699;
    float _1761 = _1701;
    float _1763 = _1703;
    float _1765 = _1639;
    float _1767 = _1765;
    if (!_1467)
    {
        float _1769 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1771 = _1769 * 0.15915493667125701904296875;
        float _1773 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1777 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1775);
        float _1779 = _1771 * 6.283185482025146484375;
        float _1781 = cos(_1779);
        float _1783 = _1773 * 0.15915493667125701904296875;
        float _1785 = _1771 * 6.283185482025146484375;
        float _1787 = sin(_1785);
        float _1789 = 1.0 / _1781;
        float _1791 = _1783 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = _1787 * _1789;
        float _1797 = _1783 * 6.283185482025146484375;
        float _1799 = sin(_1797);
        float _1801 = _1793 * _1795;
        float _1803 = 1.0 / _1777;
        float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1807 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1805;
        float _1809 = 1.0 / _1801;
        float _1811 = 1.0 / _1807;
        float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1815 = _1803 * _1813;
        float _1817 = _1799 * _1809;
        float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1821 = fma(_1817, _1815, _1819);
        float _1823 = _1821 * _1811;
        float _1825 = precise::clamp(_1823, 0.0, 1.0);
        float _1827 = -_1825;
        float _1829 = _1827 + 1.0;
        _1767 = _1783;
        _1707 = _1829;
    }
    float _1831 = _1767;
    float _1833 = _1707;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1837 = _1759 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1841 = _1761 + _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1845 = _1763 + _1843;
    bool _1847 = _861 != 0;
    float _1849 = _1837 * _1837;
    bool _1851 = _941 != 0;
    float _1853 = fma(_1841, _1841, _1849);
    float _1855 = fma(_1845, _1845, _1853);
    float _1857 = rsqrt(_1855);
    float _1859 = sqrt(_1855);
    float _1861 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1863 = _1841 * _1861;
    float _1865 = _1845 * _1861;
    float _1867 = _1863 * _1863;
    float _1869 = _1865 * _1865;
    float _1871 = _1867 + _1869;
    float _1873 = sqrt(_1871);
    bool _1875 = _1873 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = _1873 + _1877;
    float _1881 = _1845;
    float _1883 = _1871;
    float _1885 = _1879;
    float _1887 = _1831;
    float _1889 = _1837;
    if (_1875)
    {
        float _1891 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1891;
    }
    float _1893 = _1881;
    if (_1875)
    {
        float _1895 = rsqrt(_1871);
        _1883 = _1895;
    }
    float _1897 = _1883;
    if (_1875)
    {
        float _1899 = _1879 * _1893;
        _1885 = _1899;
    }
    float _1901 = _1885;
    if (_1875)
    {
        float _1903 = _1901 * 0.15915493667125701904296875;
        _1887 = _1903;
    }
    float _1905 = _1887;
    float _1907 = _1857;
    float _1909 = _1905;
    if (_1875)
    {
        float _1911 = _1905 * 6.283185482025146484375;
        float _1913 = sin(_1911);
        _1907 = _1913;
    }
    float _1915 = _1907;
    float _1917 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1919 = precise::max(0.0, _1917);
    float _1921 = _1849;
    float _1923 = _1919;
    float _1925 = _1917;
    if (_1875)
    {
        float _1927 = _1905 * 6.283185482025146484375;
        float _1929 = cos(_1927);
        _1921 = _1929;
    }
    float _1931 = _1921;
    float _1933 = -_1861;
    float _1935 = -_1919;
    float _1937 = fma(_1837, _1933, _1935);
    if (!_1875)
    {
        _1889 = _1863;
    }
    float _1939 = _1889;
    float _1941 = _1939;
    if (_1875)
    {
        float _1943 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1923 = _1943;
    }
    float _1945 = _1923;
    float _1947 = _1915;
    float _1949 = _1945;
    if (_1875)
    {
        float _1951 = fma(_1915, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1947 = _1951;
    }
    float _1953 = _1947;
    float _1955 = _1953;
    if (!_1875)
    {
        _1949 = _1937;
    }
    float _1957 = _1949;
    float _1959 = _1957;
    float _1961 = _1931;
    if (_1875)
    {
        float _1963 = _1931 + (-1.0);
        _1925 = _1963;
    }
    float _1965 = _1925;
    float _1967 = _1965;
    if (_1875)
    {
        float _1969 = _1897 * _1953;
        _949 = _1969;
    }
    float _1971 = _949;
    if (!_1875)
    {
        _1955 = _1867;
    }
    float _1973 = _1955;
    float _1975 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1977 = _1973;
    if (_1875)
    {
        float _1979 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1909 = _1979;
    }
    float _1981 = _1909;
    if (_1875)
    {
        float _1983 = _1863 * _1971;
        _1941 = _1983;
    }
    float _1985 = _1941;
    if (!_1875)
    {
        _1967 = _1865;
    }
    float _1987 = _1967;
    float _1989 = _1987;
    if (_1875)
    {
        float _1991 = _1865 * _1971;
        _1989 = _1991;
    }
    float _1993 = _1989;
    if (_1875)
    {
        float _1995 = fma(_1937, _1931, _1981);
        _1959 = _1995;
    }
    float _1997 = _1959;
    if (_1875)
    {
        float _1999 = _1985 * _1985;
        _1977 = _1999;
    }
    float _2001 = _1977;
    if (!_1875)
    {
        _1961 = _1869;
    }
    float _2003 = _1961;
    float _2005 = _2003;
    if (_1875)
    {
        float _2007 = _1993 * _1993;
        _2005 = _2007;
    }
    float _2009 = _2005;
    float _2011 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2013 = fma(_1997, _1997, _2001);
    float _2015 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2017 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2011);
    float _2019 = _2013 + _2009;
    float _2021 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2023 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2015);
    float _2025 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2017);
    float _2027 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2029 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2021);
    float _2031 = rsqrt(_2019);
    float _2033 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2023);
    float _2035 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2037 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2029);
    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2041 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2039);
    float _2043 = precise::clamp(_2041, 0.0, 1.0);
    float _2045 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2047 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2027);
    float _2049 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2051 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2053 = -_2043;
    float _2055 = _2053 + 1.0;
    float _2057 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2059 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2047);
    float _2061 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2051);
    float _2063 = -_2057;
    float _2065 = fma(_2063, _1975, 1.0);
    float _2067 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2069 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2061);
    float _2071 = _2031 * _1985;
    float _2073 = abs(_2055);
    float _2075 = log2(_2073);
    float _2077 = _2031 * _1993;
    float _2079 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2069);
    float _2081 = _2031 * _1997;
    float _2083 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2085 = -_2083;
    float _2087 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2085);
    float _2089 = 1.0 / _2079;
    float _2091 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2093 = -_2077;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2087);
    float _2097 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2091);
    float _2101 = fma(_2095, -0.5, 0.5);
    float _2103 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2105 = log2(_2065);
    float _2107 = fma(_2095, 0.5, 0.5);
    float _2109 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2111 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2099);
    float _2113 = _2081 + 1.0;
    float _2115 = fma(_2107, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2117 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2109);
    float _2119 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2111);
    float _2121 = exp2(_2103);
    float _2123 = fma(_2107, _2115, -0.212114393711090087890625);
    float _2125 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2117);
    float _2127 = fma(_2107, _2123, 1.570728778839111328125);
    float _2129 = _2125 * _2089;
    float _2131 = sqrt(_2101);
    float _2133 = _2105 * 0.693147182464599609375;
    float _2135 = fma(_2129, 0.5, 0.5);
    float _2137 = -_2081;
    float _2139 = fma(_2121, _2113, _2137);
    float _2141 = _2119 * _2089;
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2145 = fma(_2141, -0.5, 0.5);
    float _2147 = _2131 * 0.636619746685028076171875;
    float _2149 = -_2127;
    float _2151 = fma(_2147, _2149, 1.0);
    float _2153 = fma(_2139, 0.5, 0.5);
    float3 _7957 = float3(_2135, _2145, _2143);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7957, float3(0.0), isnan(_7957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7957, float3(0.0), isnan(_7957)), level(0.0)).x;
    float3 _7968 = float3(_2135, _2145, _2143);
    float4 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7968, float3(0.0), isnan(_7968)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7968, float3(0.0), isnan(_7968)), level(0.0)).xyzw;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2158.w;
    float2 _7985 = float2(_2151, _2153);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7985, float2(0.0), isnan(_7985)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7985, float2(0.0), isnan(_7985)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    float _2178 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2180 = int(_2178);
    float _2182 = _787 * _789;
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2186 = _2184 != 0;
    out.m_62.y = _901;
    int _2188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2190 = _2188 != 0;
    float _2192 = -_1057;
    float _2194 = _2192 + 1.0;
    int _2196 = abs(_1017);
    float _2198 = -_1311;
    float _2200 = _2198 + 1.0;
    float _2202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2204 = int(_2202);
    int _2206 = abs(_1443);
    float _2208 = -_1301;
    float _2210 = _2208 + 1.0;
    int _2212 = abs(_1023);
    out.m_64.y = _1583;
    int _2214 = abs(_1485);
    float _2216 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2218 = abs(_1065);
    float _2220 = trunc(_1249);
    int _2222 = int(_2220);
    float _2224 = float(uint(_2180));
    float _2226 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2228 = ~_2180;
    int _2230 = _2228 + 1;
    float _2232 = -_1189;
    float _2234 = _2232 + 1.0;
    float _2236 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2226);
    float _2238 = 1.0 / _2224;
    float _2240 = float(uint(_2204));
    float _2242 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2236);
    int _2244 = ~_2204;
    int _2246 = _2244 + 1;
    float _2248 = -_1313;
    float _2250 = _2248 + 1.0;
    int _2252 = ~_2204;
    int _2254 = _2252 + 1;
    out.m_66.x = _1761;
    out.m_66.y = _1759;
    out.m_66.z = _1763;
    float _2256 = 1.0 / _2240;
    float _2258 = trunc(_1305);
    int _2260 = int(_2258);
    int _2262 = as_type<int>(_2238) + (-2);
    float _2264 = float(uint(_2222));
    float _2266 = float(_2222);
    int _2268 = as_type<int>(_2256) + (-2);
    float _2270 = as_type<float>(_2262) * _2264;
    float _2272 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2274 = int(_2272);
    float _2276 = float(uint(_2260));
    float _2278 = trunc(_2270);
    float _2280 = precise::max(_2278, 0.0);
    uint _2283 = uint(_2280);
    float _2285 = as_type<float>(_2268) * _2276;
    int _2287 = ~_2180;
    int _2289 = _2287 + 1;
    float _2291 = trunc(_2285);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    float _2297 = float(uint(_2274));
    int _2299 = _2289 * int(_2283);
    int _2301 = _2299 + _2222;
    float _2303 = 1.0 / _2297;
    float _2305 = _791 * _775;
    float _2307 = float(uint(_2301));
    int _2309 = _2246 * int(_2295);
    int _2311 = _2309 + _2260;
    float _2313 = trunc(_1309);
    int _2315 = int(_2313);
    float _2317 = as_type<float>(_2262) * _2307;
    float _2319 = float(uint(_2311));
    float _2321 = trunc(_2317);
    float _2323 = precise::max(_2321, 0.0);
    uint _2325 = uint(_2323);
    float _2327 = as_type<float>(_2268) * _2319;
    float _2329 = trunc(_2327);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    float _2335 = floor(_2305);
    int _2337 = int(_2283) + int(_2325);
    float _2339 = _793 * _795;
    int _2341 = as_type<int>(_2303) + (-2);
    float _2343 = float(uint(_2315));
    int _2345 = _2230 * _2337;
    int _2347 = _2345 + _2222;
    int _2349 = int(_2295) + int(_2333);
    float _2351 = exp2(_2216);
    float _2353 = as_type<float>(_2341) * _2343;
    float _2355 = float(_2180);
    int _2357 = _2254 * _2349;
    int _2359 = _2357 + _2260;
    bool _2361 = uint(_2347) >= uint(_2180);
    float _2363 = -_2335;
    float _2365 = _2305 + _2363;
    float _2367 = floor(_2182);
    bool _2369 = _2266 >= _2355;
    bool _2371 = isnan(_2266);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(_2355);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    bool _2381 = uint(_2359) >= uint(_2204);
    float _2383 = float(_2204);
    float _2385 = float(_2260);
    float _2387 = trunc(_2353);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    bool _2393 = !_2186;
    int _2395 = _2393 ? 0 : 1;
    float _2397 = -_2351;
    float _2399 = _2397 + 1.0;
    int _2401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2403 = _2401 != 0;
    float _2405 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2407 = -_2367;
    float _2409 = _2182 + _2407;
    float _2411 = _2365 * _2355;
    float _2413 = trunc(_2379);
    int _2415 = int(_2413);
    bool _2417 = _2385 >= _2383;
    bool _2419 = isnan(_2385);
    bool _2421 = _2417 || _2419;
    bool _2423 = isnan(_2383);
    bool _2425 = _2421 || _2423;
    float _2427 = float(_2425);
    float _2429 = _2355 * _1199;
    int _2431 = abs(_2395);
    int _2433 = ~_2274;
    int _2435 = _2433 + 1;
    bool _2437 = !_2381;
    int _2439 = _2437 ? 0 : (-1);
    float _2441 = trunc(_2411);
    int _2443 = int(_2441);
    bool _2445 = !_2361;
    int _2447 = _2445 ? 0 : (-1);
    int _2449 = ~_2349;
    int _2451 = _2449 + _2439;
    int _2453 = _2451 + 1;
    int _2455 = ~_2337;
    int _2457 = _2455 + _2447;
    int _2459 = _2457 + 1;
    float _2461 = _2409 * _2383;
    bool _2463 = !_2403;
    int _2465 = _2463 ? 0 : 1;
    int _2467 = _2435 * int(_2391);
    int _2469 = _2467 + _2315;
    float _2471 = trunc(_2427);
    int _2473 = int(_2471);
    float _2475 = as_type<float>(_2435);
    float _2477 = _2339;
    float _2479 = _2079;
    float _2481 = _2119;
    if (_2190)
    {
        float _2483 = in.m_54.w;
        _2475 = _2483;
    }
    float _2485 = _2475;
    int _2487 = abs(_2465);
    float _2489 = _2383 * _1199;
    float _2491 = float(uint(_2469));
    int _2493 = _2204 * _2453;
    int _2495 = _2493 + _2260;
    bool _2497 = _2180 == 0;
    int _2499 = _2443 * _2431;
    int _2501 = _2499 + _2222;
    float _2503 = trunc(_2461);
    int _2505 = int(_2503);
    float _2507 = as_type<float>(_2341) * _2491;
    int _2509 = _2180 * _2459;
    int _2511 = _2509 + _2222;
    int _2513 = ~_2415;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    bool _2519 = _2204 == 0;
    bool _2521 = !_2497;
    int _2523 = _2521 ? _2511 : (-1);
    float _2525 = trunc(_2507);
    float _2527 = precise::max(_2525, 0.0);
    uint _2529 = uint(_2527);
    int _2531 = ~_2473;
    int _2533 = _2531 + 1;
    int _2535 = _2533 + 1;
    bool _2537 = !_2519;
    int _2539 = _2537 ? _2495 : (-1);
    int _2541 = _2523 * _2517;
    int _2543 = _2204 + (-1);
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2547 = _2545 != 0;
    int _2549 = _2505 * _2487;
    int _2551 = _2549 + _2260;
    int _2553 = _2180 + (-1);
    float _2555 = trunc(_2429);
    int _2557 = int(_2555);
    int _2559 = _2539 * _2535;
    int _2561 = _2415 * _2553;
    int _2563 = _2561 + _2541;
    int _2565 = abs(as_type<int>(_1011));
    float _2567 = as_type<float>(_2563);
    if (_2190)
    {
        float _2569 = _2485 * 3.1415927410125732421875;
        _1047 = _2569;
    }
    float _2571 = _1047;
    int _2573 = int(_2391) + int(_2529);
    float _2575 = trunc(_2489);
    int _2577 = int(_2575);
    int _2579 = ~_2274;
    int _2581 = _2579 + 1;
    int _2583 = _2473 * _2543;
    int _2585 = _2583 + _2559;
    int _2587 = abs(_1447);
    int _2589 = _2563 * _2565;
    if (_2190)
    {
        float _2591 = _2571 * 0.15915493667125701904296875;
        _2567 = _2591;
    }
    float _2593 = _2567;
    int _2595 = _2581 * _2573;
    int _2597 = _2595 + _2315;
    bool _2599 = !_2547;
    int _2601 = _2599 ? 0 : 1;
    int _2603 = _2557 * _2196;
    int _2605 = _2603 + _2589;
    float _2607 = float(_2315);
    int _2609 = _2585 * _2206;
    bool _2611 = uint(_2597) >= uint(_2274);
    float _2613 = _2593;
    if (_2190)
    {
        float _2615 = _2593 * 6.283185482025146484375;
        float _2617 = sin(_2615);
        _2613 = _2617;
    }
    float _2619 = _2613;
    int _2621 = abs(_2601);
    int _2623 = _2501 * _2212;
    int _2625 = _2623 + _2605;
    float _2627 = float(_2274);
    int _2629 = _2577 * _2587;
    int _2631 = _2629 + _2609;
    bool _2633 = !_2611;
    int _2635 = _2633 ? 0 : (-1);
    int _2637 = _2443 * _2621;
    int _2639 = _2637 + _2625;
    int _2641 = abs(_1481);
    float _2643 = floor(_2339);
    bool _2645 = _2607 >= _2627;
    bool _2647 = isnan(_2607);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan(_2627);
    bool _2653 = _2649 || _2651;
    float _2655 = float(_2653);
    float _2657 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2657;
    int _2661 = ~_2573;
    int _2663 = _2661 + _2635;
    int _2665 = _2663 + 1;
    float _2667 = _2627 * _1199;
    int _2669 = _2551 * _2641;
    int _2671 = _2669 + _2631;
    float _2673 = float(uint(_2639));
    float _2675 = trunc(_2655);
    int _2677 = int(_2675);
    bool _2679 = _2274 == 0;
    int _2681 = _2505 * _2214;
    int _2683 = _2681 + _2671;
    int _2685 = ~_2180;
    int _2687 = _2685 + 1;
    float _2689 = as_type<float>(_2262) * _2673;
    int _2691 = _2274 * _2665;
    int _2693 = _2691 + _2315;
    if (_2190)
    {
        bool _2695 = _2619 > 0.5;
        _1641 = _2695;
    }
    bool _2697 = _1641;
    float _2699 = float(uint(_2683));
    float _2701 = -_2643;
    float _2703 = _2339 + _2701;
    float _2705 = trunc(_2689);
    float _2707 = precise::max(_2705, 0.0);
    uint _2709 = uint(_2707);
    bool _2711 = !_2679;
    int _2713 = _2711 ? _2693 : (-1);
    float _2715 = as_type<float>(_2268) * _2699;
    if (!_2190)
    {
        _2477 = _179;
    }
    float _2717 = _2477;
    float _2719 = _2703 * _2627;
    int _2721 = ~_2677;
    int _2723 = _2721 + 1;
    int _2725 = _2723 + 1;
    float _2727 = float(uint(_2501));
    float _2729 = trunc(_2715);
    float _2731 = precise::max(_2729, 0.0);
    uint _2733 = uint(_2731);
    float _2735 = _2717;
    if (_2190)
    {
        float _2737 = -_179;
        float _2739 = _2697 ? _2737 : _179;
        _2735 = _2739;
    }
    float _2741 = _2735;
    int _2743 = _2713 * _2725;
    int _2745 = _2274 + (-1);
    float _2747 = as_type<float>(_2262) * _2727;
    int _2749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2751 = _2749 != 0;
    int _2753 = _2687 * int(_2709);
    int _2755 = _2753 + _2639;
    int _2757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2759 = _2757 != 0;
    int _2761 = _2677 * _2745;
    int _2763 = _2761 + _2743;
    int _2765 = ~_2204;
    int _2767 = _2765 + 1;
    float _2769 = trunc(_2719);
    int _2771 = int(_2769);
    float _2773 = float(uint(_2755));
    int _2775 = abs(_1061);
    bool _2777 = !_2759;
    int _2779 = _2777 ? 0 : 1;
    int _2781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2783 = _2781 != 0;
    float _2785 = as_type<float>(_2262) * _2773;
    int _2787 = _2767 * int(_2733);
    int _2789 = _2787 + _2683;
    float _2791 = trunc(_2667);
    int _2793 = int(_2791);
    float _2795 = _2619;
    if (_2751)
    {
        float _2797 = in.m_54.x;
        _2795 = _2797;
    }
    float _2799 = _2795;
    int _2801 = _2763 * _2775;
    int _2803 = abs(_2779);
    float _2805 = float(uint(_2789));
    float _2807 = float(uint(_2551));
    float _2809 = trunc(_2747);
    float _2811 = precise::max(_2809, 0.0);
    uint _2813 = uint(_2811);
    int _2815 = ~_2180;
    int _2817 = _2815 + 1;
    float _2819 = as_type<float>(_2268) * _2805;
    int _2821 = _2771 * _2803;
    int _2823 = _2821 + _2315;
    float _2825 = as_type<float>(_2268) * _2807;
    int _2827 = abs(as_type<int>(_1069));
    float _2829 = trunc(_2785);
    float _2831 = precise::max(_2829, 0.0);
    uint _2833 = uint(_2831);
    int _2835 = _2793 * _2218;
    int _2837 = _2835 + _2801;
    int _2839 = ~_2180;
    int _2841 = _2839 + 1;
    int _2843 = ~_2274;
    int _2845 = _2843 + 1;
    int _2847 = _2823 * _2827;
    int _2849 = _2847 + _2837;
    int _2851 = ~_2204;
    int _2853 = _2851 + 1;
    float _2855 = trunc(_2819);
    float _2857 = precise::max(_2855, 0.0);
    uint _2859 = uint(_2857);
    int _2861 = _2817 * int(_2813);
    int _2863 = _2861 + _2501;
    float _2865 = _2799;
    if (_2751)
    {
        float _2867 = _2799 * 3.1415927410125732421875;
        _1073 = _2867;
    }
    float _2869 = _1073;
    float _2871 = _2869;
    if (!_2751)
    {
        _2865 = _183;
    }
    float _2873 = _2865;
    int _2875 = ~_2274;
    int _2877 = _2875 + 1;
    float _2879 = _2873;
    if (_2751)
    {
        float _2881 = _2869 * 0.15915493667125701904296875;
        _2871 = _2881;
    }
    float _2883 = _2871;
    float _2885 = float(uint(_2863));
    float _2887 = trunc(_2825);
    float _2889 = precise::max(_2887, 0.0);
    uint _2891 = uint(_2889);
    int _2893 = int(_2709) + int(_2833);
    bool _2895 = !_2783;
    int _2897 = _2895 ? 0 : 1;
    float _2899 = as_type<float>(_2262) * _2885;
    int _2901 = _2841 * _2893;
    int _2903 = _2901 + _2639;
    int _2905 = abs(_2897);
    float _2907 = _2883;
    if (_2751)
    {
        float _2909 = _2883 * 6.283185482025146484375;
        float _2911 = sin(_2909);
        _2907 = _2911;
    }
    float _2913 = _2907;
    int _2915 = int(_2733) + int(_2859);
    int _2917 = ~_2204;
    int _2919 = _2917 + 1;
    int _2921 = _2771 * _2905;
    int _2923 = _2921 + _2849;
    bool _2925 = uint(_2903) >= uint(_2180);
    int _2927 = _2853 * _2915;
    int _2929 = _2927 + _2683;
    float _2931 = float(uint(_2823));
    float _2933 = trunc(_2899);
    float _2935 = precise::max(_2933, 0.0);
    uint _2937 = uint(_2935);
    bool _2939 = !_2925;
    int _2941 = _2939 ? 0 : (-1);
    int _2943 = _2919 * int(_2891);
    int _2945 = _2943 + _2551;
    bool _2947 = uint(_2929) >= uint(_2204);
    float _2949 = as_type<float>(_2341) * _2931;
    int _2951 = ~_2893;
    int _2953 = _2951 + _2941;
    int _2955 = _2953 + 1;
    float _2957 = float(uint(_2945));
    float _2959 = trunc(_2949);
    float _2961 = precise::max(_2959, 0.0);
    uint _2963 = uint(_2961);
    float _2965 = float(uint(_2923));
    int _2967 = _2180 * _2955;
    int _2969 = _2967 + _2639;
    bool _2971 = !_2947;
    int _2973 = _2971 ? 0 : (-1);
    float _2975 = as_type<float>(_2268) * _2957;
    int _2977 = ~_2274;
    int _2979 = _2977 + 1;
    float _2981 = as_type<float>(_2341) * _2965;
    float _2983 = -_179;
    int _2985 = _1847 ? as_type<int>(_2983) : as_type<int>(_179);
    int _2987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2989 = _2987 != 0;
    float _2991 = trunc(_2981);
    float _2993 = precise::max(_2991, 0.0);
    uint _2995 = uint(_2993);
    bool _2997 = _2947;
    if (_2751)
    {
        bool _2999 = _2913 > 0.5;
        _2997 = _2999;
    }
    bool _3001 = _2997;
    int _3003 = ~_2915;
    int _3005 = _3003 + _2973;
    int _3007 = _3005 + 1;
    bool _3009 = !_2989;
    float _3011 = _3009 ? _179 : as_type<float>(_2985);
    int _3013 = _2979 * int(_2963);
    int _3015 = _3013 + _2823;
    int _3017 = ~_2274;
    int _3019 = _3017 + 1;
    int _3021 = _2204 * _3007;
    int _3023 = _3021 + _2683;
    bool _3025 = !_2497;
    int _3027 = _3025 ? _2969 : (-1);
    float _3029 = trunc(_2975);
    float _3031 = precise::max(_3029, 0.0);
    uint _3033 = uint(_3031);
    float _3035 = float(uint(_3015));
    int _3037 = int(_2813) + int(_2937);
    int _3039 = ~_2180;
    int _3041 = _3039 + 1;
    int _3043 = _3019 * int(_2995);
    int _3045 = _3043 + _2923;
    if (_2751)
    {
        float _3047 = -_183;
        float _3049 = _3001 ? _3047 : _183;
        _2879 = _3049;
    }
    float _3051 = _2879;
    float _3053 = as_type<float>(_2341) * _3035;
    int _3055 = _3027 & 3;
    bool _3057 = _3055 != 0;
    float _3059 = float(uint(_3045));
    int _3061 = _3041 * _3037;
    int _3063 = _3061 + _2501;
    float _3065 = -_183;
    int _3067 = _1851 ? as_type<int>(_3065) : as_type<int>(_183);
    float _3069 = trunc(_3053);
    float _3071 = precise::max(_3069, 0.0);
    uint _3073 = uint(_3071);
    bool _3075 = uint(_3055) > 1u;
    float _3077 = as_type<float>(_2341) * _3059;
    int _3079 = _3027 & 3;
    bool _3081 = _3079 != 0;
    int _3083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3085 = _3083 != 0;
    bool _3087 = !_2519;
    int _3089 = _3087 ? _3023 : (-1);
    float _3091 = trunc(_3077);
    float _3093 = precise::max(_3091, 0.0);
    uint _3095 = uint(_3093);
    int _3097 = _3081 ? 0 : 1;
    bool _3099 = !_3085;
    float _3101 = _3099 ? _183 : as_type<float>(_3067);
    bool _3103 = uint(_3063) >= uint(_2180);
    int _3105 = _3089 & 3;
    bool _3107 = _3105 != 0;
    bool _3109 = !_3103;
    int _3111 = _3109 ? 0 : (-1);
    bool _3113 = uint(_3105) > 1u;
    int _3115 = ~_3097;
    int _3117 = _3115 + 1;
    int _3119 = _3117 + 1;
    int _3121 = _3119;
    if (!_3075)
    {
        int _3123 = ~_3097;
        int _3125 = _3123 + 1;
        _3121 = _3125;
    }
    int _3127 = _3121;
    int _3129 = _3089 & 3;
    bool _3131 = _3129 != 0;
    int _3133 = int(_2891) + int(_3033);
    int _3135 = _3131 ? 0 : 1;
    int _3137 = int(_2963) + int(_3073);
    int _3139 = ~_3135;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    int _3145 = _3143;
    if (!_3113)
    {
        int _3147 = ~_3135;
        int _3149 = _3147 + 1;
        _3145 = _3149;
    }
    int _3151 = _3145;
    bool _3153 = !_3107;
    int _3155 = _3153 ? 0 : 1;
    bool _3157 = _3105 != 3;
    int _3159 = ~_2204;
    int _3161 = _3159 + 1;
    bool _3163 = uint(_3105) >= 2u;
    int _3165 = int(_2995) + int(_3095);
    int _3167 = _3163 ? 0 : 1;
    float _3169 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _3173 = _775 > 0.5;
    int _3175 = _3161 * _3133;
    int _3177 = _3175 + _2551;
    float _3179 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _3181 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _3179;
    int _3183 = ~_3167;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    int _3189 = _2845 * _3165;
    int _3191 = _3189 + _2923;
    int _3193 = _3187;
    if (_3157)
    {
        int _3195 = ~_3167;
        int _3197 = _3195 + 1;
        _3193 = _3197;
    }
    int _3199 = _3193;
    float _3201 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _3203 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _3201;
    float _3205 = 1.0 / _3171;
    bool _3207 = uint(_3177) >= uint(_2204);
    int _3209 = _2877 * _3137;
    int _3211 = _3209 + _2823;
    float _3213 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _3215 = _3213 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _3217 = uint(_3191) >= uint(_2274);
    float _3219 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _3221 = _647 + _3219;
    bool _3223 = !_3207;
    int _3225 = _3223 ? 0 : (-1);
    float _3227 = 1.0 / _3181;
    bool _3229 = uint(_3211) >= uint(_2274);
    float _3231 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _3233 = _647 + _3231;
    bool _3235 = !_3217;
    int _3237 = _3235 ? 0 : (-1);
    bool _3239 = !_3229;
    int _3241 = _3239 ? 0 : (-1);
    bool _3243 = _3105 != 3;
    float _3245 = 1.0 / _3203;
    int _3247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3249 = _3247 != 0;
    float _3251 = _3221 * _3205;
    float _3253 = -_179;
    int _3255 = _3173 ? as_type<int>(_3253) : as_type<int>(_179);
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _3259 = _647 + _3257;
    bool _3261 = !_3243;
    int _3263 = _3261 ? 0 : (-1);
    bool _3265 = !_3249;
    float _3267 = _3265 ? _179 : as_type<float>(_3255);
    float _3269 = 1.0 / _3215;
    int _3271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3273 = _3271 != 0;
    float _3275 = _3233 * _3227;
    int _3277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3279 = _3277 != 0;
    float _3281 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _3283 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _3281;
    int _3285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3287 = _3285 != 0;
    float _3289 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _3291 = _647 + _3289;
    float _3293 = fma(_2659, _3275, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _3295 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _3297 = isnan(_647);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _3303 = _3299 || _3301;
    float _3305 = float(_3303);
    float _3307 = _3291 * _3245;
    float _3309 = fma(_3283, _3275, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _3311 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _3313 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _3311;
    bool _3315 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _3317 = isnan(_647);
    bool _3319 = _3315 || _3317;
    bool _3321 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _3323 = _3319 || _3321;
    float _3325 = float(_3323);
    float _3327 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _3329 = _3327 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _3331 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _3333 = isnan(_647);
    bool _3335 = _3331 || _3333;
    bool _3337 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _3339 = _3335 || _3337;
    float _3341 = float(_3339);
    float _3343 = _3259 * _3269;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _3349 = fma(_3313, _3275, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _3351 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _3353 = _3351 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _3355 = -_3305;
    float _3357 = _3355 + 1.0;
    float _3359 = fma(_3347, _3251, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _3361 = fma(_3329, _3251, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _3363 = fma(_3353, _3251, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _3365 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _3367 = isnan(_647);
    bool _3369 = _3365 || _3367;
    bool _3371 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _3373 = _3369 || _3371;
    float _3375 = float(_3373);
    float _3377 = _3325 * _3357;
    bool _3379 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _3381 = isnan(_647);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _3387 = _3383 || _3385;
    float _3389 = float(_3387);
    float _3391 = -_3325;
    float _3393 = _3391 + 1.0;
    float _3395 = -_3341;
    float _3397 = _3395 + 1.0;
    float _3399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3401 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _3403 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _3401;
    float _3405 = _3375 * _3393;
    float _3407 = _3389 * _3397;
    float _3409 = -_3375;
    float _3411 = _3409 + 1.0;
    float _3413 = -_3389;
    float _3415 = _3413 + 1.0;
    int _3417 = ~_3133;
    int _3419 = _3417 + _3225;
    int _3421 = _3419 + 1;
    float _3423 = _3349 * _3407;
    float _3425 = _3341 * _3411;
    float _3427 = _3309 * _3407;
    float _3429 = _3293 * _3407;
    float _3431 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _3431;
    float _3435 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _3437 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _3435;
    float _3439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3441 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _3443 = _3441 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _3445 = fma(_3433, _3307, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _3447 = fma(_3437, _3307, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _3449 = fma(_3403, _3307, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _3451 = fma(_3415, (*spvDescriptorSet0.vp_c9)._m0[123].x, _3423);
    float _3453 = fma(_3415, (*spvDescriptorSet0.vp_c9)._m0[123].y, _3427);
    float _3455 = fma(_3415, (*spvDescriptorSet0.vp_c9)._m0[123].z, _3429);
    float _3457 = fma(_3443, _3343, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _3459 = _1275 * (-0.15915493667125701904296875);
    float _3461 = fma(_3361, _3425, _3453);
    float _3463 = fma(_3359, _3425, _3451);
    float _3465 = fma(_3363, _3425, _3455);
    float _3467 = _3399 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3469 = fma(_3447, _3405, _3461);
    float _3471 = _3459 * 6.283185482025146484375;
    float _3473 = sin(_3471);
    float _3475 = fma(_3445, _3405, _3463);
    float _3477 = fma(_3449, _3405, _3465);
    float _3479 = _2741 + 0.5;
    float _3481 = _3439 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3483 = _3051 + (-0.5);
    float _3485 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _3487 = _3485 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _3489 = fma(_3467, _3479, _889);
    float _3491 = _3459 * 6.283185482025146484375;
    float _3493 = cos(_3491);
    float _3495 = -_3481;
    float _3497 = -_1153;
    float _3499 = fma(_3495, _3483, _3497);
    float _3501 = -_1007;
    float _3503 = _3501 + 1.0;
    int _3505 = _3089 >> 31;
    float _3507 = _985 + (-0.5);
    float _3509 = fma(_2194, _3051, _3499);
    float _3511 = -_3503;
    float _3513 = fma(_3511, _2741, _3489);
    int _3515 = _3505 & 3;
    float _3517 = _3101 * _3473;
    float _3519 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _3521 = _3519 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _3523 = fma(_3487, _3343, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    int _3525 = _3089 + _3515;
    out.m_68.x = _3513;
    out.m_68.y = _3509;
    float _3527 = -_3507;
    float _3529 = -_1323;
    float _3531 = fma(_3527, (*spvDescriptorSet0.vp_c9)._m0[90].y, _3529);
    float _3533 = fma(_3521, _3343, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _3535 = _3525 >> 2;
    float _3537 = _3101 * _3493;
    float _3539 = -_3517;
    float _3541 = fma(_3267, _3493, _3539);
    float _3543 = fma(_985, _2200, _3531);
    float _3545 = fma(_3457, _3377, _3475);
    float _3547 = fma(_3267, _3473, _3537);
    int _3549 = _3535 << 4;
    int _3551 = _3549 + 512;
    float _3553 = _3541 + 0.5;
    float _3555 = fma(_3523, _3377, _3469);
    float _3557 = fma(_3533, _3377, _3477);
    uint _3559 = uint(int(uint(_3551) >> uint(2)));
    uint _3561 = uint(int(uint(int(_3559)) >> uint(2)));
    int _3563 = int(_3559) & 3;
    float _3565 = (*spvDescriptorSet0.vp_c9)._m0[int(_3561)][_3563];
    int _3567 = int(_3559) + 1;
    uint _3569 = uint(int(uint(_3567) >> uint(2)));
    int _3571 = _3567 & 3;
    float _3573 = (*spvDescriptorSet0.vp_c9)._m0[int(_3569)][_3571];
    float _3575 = fma(_3553, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1213);
    float _3577 = _991 + 0.5;
    float _3579 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[127].x, _3545);
    float _3581 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[127].y, _3555);
    float _3583 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[127].z, _3557);
    float _3585 = fma(_3577, (*spvDescriptorSet0.vp_c9)._m0[90].x, _1321);
    float _3587 = _3579 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3589 = _3551 + 8;
    uint _3591 = uint(int(uint(_3589) >> uint(2)));
    uint _3593 = uint(int(uint(int(_3591)) >> uint(2)));
    int _3595 = int(_3591) & 3;
    float _3597 = (*spvDescriptorSet0.vp_c9)._m0[int(_3593)][_3595];
    int _3599 = int(_3591) + 1;
    uint _3601 = uint(int(uint(_3599) >> uint(2)));
    int _3603 = _3599 & 3;
    float _3605 = (*spvDescriptorSet0.vp_c9)._m0[int(_3601)][_3603];
    float _3607 = _3581 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3609 = _3583 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3611 = _3587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3613 = -_2210;
    float _3615 = fma(_991, _3613, _3585);
    float _3617 = _3607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3619 = _3609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3621 = _3547 + (-0.5);
    int _3623 = ~_3037;
    int _3625 = _3623 + _3111;
    int _3627 = _3625 + 1;
    out.m_70.x = _3615;
    out.m_70.y = _3543;
    int _3629 = abs(_3155);
    float _3631 = -_3621;
    float _3633 = -_893;
    float _3635 = fma(_3631, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3633);
    float _3637 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_72.x = _3611;
    out.m_72.y = _3617;
    out.m_72.z = _3619;
    int _3639 = _2180 * _3627;
    int _3641 = _3639 + _2501;
    int _3643 = ~_3165;
    int _3645 = _3643 + _3237;
    int _3647 = _3645 + 1;
    float _3649 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3651 = ~_3137;
    int _3653 = _3651 + _3241;
    int _3655 = _3653 + 1;
    float _3657 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3659 = !_2497;
    int _3661 = _3659 ? _3641 : (-1);
    int _3663 = _2274 * _3655;
    int _3665 = _3663 + _2823;
    float _3667 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3657);
    float _3669 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3671 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3673 = _2204 * _3421;
    int _3675 = _3673 + _2551;
    float _3677 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3679 = -_1489;
    float _3681 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3637);
    float _3683 = -_1489;
    float _3685 = fma(_3683, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3671);
    float _3687 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3689 = -_1489;
    float _3691 = fma(_3689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3677);
    float _3693 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3681);
    int _3695 = abs(_3151);
    float _3697 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3687);
    float _3699 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3701 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3669);
    int _3703 = ~_3695;
    int _3705 = _3703 + 1;
    int _3707 = _3705 + 1;
    float _3709 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3711 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3699);
    float _3713 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3685);
    int _3715 = _3707 * as_type<int>(_3573);
    int _3717 = abs(_3199);
    float _3719 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3721 = ~_3629;
    int _3723 = _3721 + 1;
    int _3725 = _3723 + 1;
    float _3727 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3729 = int(_3727);
    float _3731 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3709);
    float _3733 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3719);
    float _3735 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3711);
    int _3737 = _3725 * as_type<int>(_3565);
    int _3739 = _3737 + _3715;
    int _3741 = ~_3717;
    int _3743 = _3741 + 1;
    int _3745 = _3743 + 1;
    float _3747 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3701);
    float _3749 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3731);
    int _3751 = _2274 * _3647;
    int _3753 = _3751 + _2923;
    int _3755 = _3027 >> 31;
    int _3757 = _3745 * as_type<int>(_3597);
    int _3759 = _3757 + _3739;
    bool _3761 = !_3279;
    int _3763 = _3761 ? 0 : 1;
    float _3765 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3691);
    int _3767 = abs(_3263);
    bool _3769 = uint(_3055) >= 2u;
    int _3771 = abs(_3763);
    int _3773 = ~_3767;
    int _3775 = _3773 + 1;
    int _3777 = _3775 + 1;
    int _3779 = _3769 ? 0 : 1;
    bool _3781 = !_2679;
    int _3783 = _3781 ? _3753 : (-1);
    int _3785 = _3777 * as_type<int>(_3605);
    int _3787 = _3785 + _3759;
    bool _3789 = _3055 != 3;
    int _3791 = ~_3771;
    int _3793 = _3791 + 1;
    int _3795 = _3793 + 1;
    int _3797 = _3755 & 3;
    int _3799 = abs(_3729);
    int _3801 = _3787 * _3795;
    int _3803 = _3783 >> 31;
    int _3805 = _3027 + _3797;
    float _3807 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3809 = float(uint(_3799));
    int _3811 = _3803 & 3;
    float _3813 = float(uint(_3729));
    float _3815 = 1.0 / _3809;
    int _3817 = _3805 >> 2;
    int _3819 = _3783 + _3811;
    float _3821 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3667);
    int _3823 = ~_3779;
    int _3825 = _3823 + 1;
    int _3827 = _3825 + 1;
    int _3829 = _3827;
    if (_3789)
    {
        int _3831 = ~_3779;
        int _3833 = _3831 + 1;
        _3829 = _3833;
    }
    int _3835 = _3829;
    float _3837 = 1.0 / _3813;
    bool _3839 = !_2519;
    int _3841 = _3839 ? _3675 : (-1);
    float _3843 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3697);
    int _3845 = _3819 >> 2;
    int _3847 = _3783 & 3;
    bool _3849 = _3847 != 0;
    int _3851 = _3841 * _3771;
    int _3853 = _3851 + _3801;
    int _3855 = _3845 << 4;
    int _3857 = _3855 + 656;
    int _3859 = _3817 << 4;
    int _3861 = _3859 + 368;
    float _3863 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3733);
    uint _3865 = uint(int(uint(_3857) >> uint(2)));
    uint _3867 = uint(int(uint(int(_3865)) >> uint(2)));
    int _3869 = int(_3865) & 3;
    float _3871 = (*spvDescriptorSet0.vp_c9)._m0[int(_3867)][_3869];
    int _3873 = int(_3865) + 1;
    uint _3875 = uint(int(uint(_3873) >> uint(2)));
    int _3877 = _3873 & 3;
    float _3879 = (*spvDescriptorSet0.vp_c9)._m0[int(_3875)][_3877];
    int _3881 = _3783 & 3;
    bool _3883 = _3881 != 0;
    float _3885 = _3807 * _3713;
    int _3887 = abs(_3853);
    out.m_74.x = _3843;
    out.m_74.y = _3821;
    out.m_74.z = _3863;
    int _3889 = _3849 ? 0 : 1;
    float _3891 = fma(_3649, _3843, _3885);
    int _3893 = as_type<int>(_3815) + (-2);
    uint _3895 = uint(int(uint(_3861) >> uint(2)));
    uint _3897 = uint(int(uint(int(_3895)) >> uint(2)));
    int _3899 = int(_3895) & 3;
    float _3901 = (*spvDescriptorSet0.vp_c9)._m0[int(_3897)][_3899];
    int _3903 = int(_3895) + 1;
    uint _3905 = uint(int(uint(_3903) >> uint(2)));
    int _3907 = _3903 & 3;
    float _3909 = (*spvDescriptorSet0.vp_c9)._m0[int(_3905)][_3907];
    bool _3911 = uint(_3881) > 1u;
    float _3913 = _3735 + _3891;
    float _3915 = _3807 * _3765;
    int _3917 = as_type<int>(_3837) + (-2);
    float _3919 = float(uint(_3887));
    float _3921 = float(uint(_3853));
    int _3923 = ~_3889;
    int _3925 = _3923 + 1;
    int _3927 = _3925 + 1;
    float _3929 = as_type<float>(_3893) * _3919;
    float _3931 = fma(_3649, _3863, _3915);
    int _3933 = _3927;
    if (!_3911)
    {
        int _3935 = ~_3889;
        int _3937 = _3935 + 1;
        _3933 = _3937;
    }
    int _3939 = _3933;
    int _3941 = _3861 + 8;
    uint _3943 = uint(int(uint(_3941) >> uint(2)));
    uint _3945 = uint(int(uint(int(_3943)) >> uint(2)));
    int _3947 = int(_3943) & 3;
    float _3949 = (*spvDescriptorSet0.vp_c9)._m0[int(_3945)][_3947];
    int _3951 = int(_3943) + 1;
    uint _3953 = uint(int(uint(_3951) >> uint(2)));
    int _3955 = _3951 & 3;
    float _3957 = (*spvDescriptorSet0.vp_c9)._m0[int(_3953)][_3955];
    float _3959 = _3807 * _3693;
    bool _3961 = !_3057;
    int _3963 = _3961 ? 0 : 1;
    float _3965 = as_type<float>(_3917) * _3921;
    bool _3967 = _3881 != 3;
    float _3969 = trunc(_3929);
    float _3971 = precise::max(_3969, 0.0);
    uint _3973 = uint(_3971);
    bool _3975 = uint(_3881) >= 2u;
    float _3977 = fma(_3649, _3821, _3959);
    float _3979 = fma(_3807, _3807, 1.0);
    int _3981 = ~_3799;
    int _3983 = _3981 + 1;
    int _3985 = _3975 ? 0 : 1;
    float _3987 = trunc(_3965);
    float _3989 = precise::max(_3987, 0.0);
    uint _3991 = uint(_3989);
    bool _3993 = _3055 != 3;
    int _3995 = ~_3985;
    int _3997 = _3995 + 1;
    int _3999 = _3997 + 1;
    int _4001 = abs(_3939);
    int _4003 = _3999;
    if (_3967)
    {
        int _4005 = ~_3985;
        int _4007 = _4005 + 1;
        _4003 = _4007;
    }
    int _4009 = _4003;
    float _4011 = rsqrt(_3979);
    int _4013 = _3857 + 8;
    uint _4015 = uint(int(uint(_4013) >> uint(2)));
    uint _4017 = uint(int(uint(int(_4015)) >> uint(2)));
    int _4019 = int(_4015) & 3;
    float _4021 = (*spvDescriptorSet0.vp_c9)._m0[int(_4017)][_4019];
    int _4023 = int(_4015) + 1;
    uint _4025 = uint(int(uint(_4023) >> uint(2)));
    int _4027 = _4023 & 3;
    float _4029 = (*spvDescriptorSet0.vp_c9)._m0[int(_4025)][_4027];
    int _4031 = ~_3729;
    int _4033 = _4031 + 1;
    int _4035 = abs(_3127);
    int _4037 = _3983 * int(_3973);
    int _4039 = _4037 + _3887;
    int _4041 = abs(_3963);
    int _4043 = _4033 * int(_3991);
    int _4045 = _4043 + _3853;
    int _4047 = ~_4035;
    int _4049 = _4047 + 1;
    int _4051 = _4049 + 1;
    int _4053 = ~_4041;
    int _4055 = _4053 + 1;
    int _4057 = _4055 + 1;
    int _4059 = ~_4001;
    int _4061 = _4059 + 1;
    int _4063 = _4061 + 1;
    int _4065 = _4051 * as_type<int>(_3909);
    float _4067 = float(uint(_4039));
    float _4069 = _3807 * _4011;
    float _4071 = float(uint(_4045));
    int _4073 = _4057 * as_type<int>(_3901);
    int _4075 = _4073 + _4065;
    bool _4077 = !_2679;
    int _4079 = _4077 ? _3665 : (-1);
    int _4081 = _4063 * as_type<int>(_3879);
    float _4083 = as_type<float>(_3893) * _4067;
    float _4085 = -_3735;
    float _4087 = _4069 * _4085;
    float _4089 = as_type<float>(_3917) * _4071;
    bool _4091 = !_3883;
    int _4093 = _4091 ? 0 : 1;
    float _4095 = -_3747;
    float _4097 = _4069 * _4095;
    bool _4099 = !_3993;
    int _4101 = _4099 ? 0 : (-1);
    float _4103 = fma(_4011, _3713, _4087);
    int _4105 = abs(_4093);
    float _4107 = trunc(_4089);
    float _4109 = precise::max(_4107, 0.0);
    uint _4111 = uint(_4109);
    int _4113 = abs(_4101);
    float _4115 = fma(_4011, _3693, _4097);
    int _4117 = abs(_3835);
    float _4119 = -_3749;
    float _4121 = _4069 * _4119;
    int _4123 = ~_4105;
    int _4125 = _4123 + 1;
    int _4127 = _4125 + 1;
    float _4129 = _3747 + _3977;
    float _4131 = trunc(_4083);
    float _4133 = precise::max(_4131, 0.0);
    uint _4135 = uint(_4133);
    int _4137 = ~_4117;
    int _4139 = _4137 + 1;
    int _4141 = _4139 + 1;
    int _4143 = _4127 * as_type<int>(_3871);
    int _4145 = _4143 + _4081;
    int _4147 = ~_4113;
    int _4149 = _4147 + 1;
    int _4151 = _4149 + 1;
    float _4153 = fma(_4011, _3765, _4121);
    bool _4155 = _3881 != 3;
    int _4157 = _4141 * as_type<int>(_3949);
    int _4159 = _4157 + _4075;
    int _4161 = ~_3799;
    int _4163 = _4161 + 1;
    float _4165 = _3749 + _3931;
    bool _4167 = !_4155;
    int _4169 = _4167 ? 0 : (-1);
    int _4171 = _4151 * as_type<int>(_3957);
    int _4173 = _4171 + _4159;
    int _4175 = int(_3991) + int(_4111);
    out.m_76.x = _4103;
    out.m_76.y = _4115;
    out.m_76.z = _4153;
    int _4177 = ~_3729;
    int _4179 = _4177 + 1;
    bool _4181 = !_3273;
    int _4183 = _4181 ? 0 : 1;
    out.m_78.x = _3913;
    out.m_78.y = _4129;
    out.m_78.z = _4165;
    int _4185 = int(_3973) + int(_4135);
    int _4187 = abs(_4009);
    int _4189 = abs(_4169);
    int _4191 = abs(_4183);
    int _4193 = _4179 * _4175;
    int _4195 = _4193 + _3853;
    bool _4197 = !_3287;
    int _4199 = _4197 ? 0 : 1;
    int _4201 = _4163 * _4185;
    int _4203 = _4201 + _3887;
    int _4205 = ~_4187;
    int _4207 = _4205 + 1;
    int _4209 = _4207 + 1;
    int _4211 = abs(_4199);
    int _4213 = _4209 * as_type<int>(_4021);
    int _4215 = _4213 + _4145;
    int _4217 = ~_4191;
    int _4219 = _4217 + 1;
    int _4221 = _4219 + 1;
    int _4223 = ~_4189;
    int _4225 = _4223 + 1;
    int _4227 = _4225 + 1;
    bool _4229 = uint(_4195) >= uint(_3729);
    int _4231 = _4173 * _4221;
    bool _4233 = uint(_4203) >= uint(_3799);
    int _4235 = _4227 * as_type<int>(_4029);
    int _4237 = _4235 + _4215;
    int _4239 = _3853 ^ _3729;
    int _4241 = _3661 * _4191;
    int _4243 = _4241 + _4231;
    bool _4245 = !_4229;
    int _4247 = _4245 ? 0 : (-1);
    float _4249 = _1419 + (-0.5);
    bool _4251 = !_4233;
    int _4253 = _4251 ? 0 : (-1);
    uint _4255 = uint(int(uint(_4239) >> uint(31)));
    float _4257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4259 = ~_4175;
    int _4261 = _4259 + _4247;
    int _4263 = _4261 + 1;
    int _4265 = ~_4253;
    int _4267 = _4185 + _4265;
    int _4269 = _4267 + 1;
    int _4271 = ~int(_4255);
    int _4273 = _4271 + 1;
    int _4275 = _3729 * _4263;
    int _4277 = _4275 + _3853;
    bool _4279 = _3729 == 0;
    float _4281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4283 = _4269 ^ _4273;
    int _4285 = ~_4211;
    int _4287 = _4285 + 1;
    int _4289 = _4287 + 1;
    bool _4291 = _3729 == 0;
    int _4293 = ~_4273;
    int _4295 = _4293 + _4283;
    int _4297 = _4295 + 1;
    int _4299 = _4237 * _4289;
    bool _4301 = !_4279;
    int _4303 = _4301 ? _4277 : (-1);
    float _4305 = _4257 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4307 = !_4291;
    int _4309 = _4307 ? _4297 : (-1);
    int _4311 = _4079 * _4211;
    int _4313 = _4311 + _4299;
    float _4315 = float(_4303);
    float _4317 = _3011 + 0.5;
    float _4319 = float(_4309);
    float _4321 = _4281 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4323 = float(_4243);
    float _4325 = fma(_4305, _4315, _1317);
    float _4327 = -_1297;
    float _4329 = fma(_4321, _4319, _4327);
    float _4331 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2242);
    float _4333 = fma(_4305, _4317, _4325);
    float _4335 = -_1295;
    float _4337 = _4335 + 1.0;
    float _4339 = -_4321;
    float _4341 = fma(_4339, _4249, _4329);
    out.m_80.x = _4323;
    float _4343 = -_2234;
    float _4345 = fma(_3011, _4343, _4333);
    float _4347 = _2405 * _2155;
    float _4349 = _4331 + _2079;
    float _4351 = fma(_1419, _2250, _4341);
    float _4353 = -_2405;
    float _4355 = _4353 + 1.0;
    float _4357 = _2166 * _4347;
    bool _4359 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4361 = isnan(_1859);
    bool _4363 = _4359 || _4361;
    bool _4365 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4367 = _4363 || _4365;
    float _4369 = -_1285;
    float _4371 = _4369 + 1.0;
    float _4373 = float(_4313);
    float _4375 = _2176 * _4347;
    float _4377 = _4349 * 0.5;
    float _4379 = fma(_2172, _4357, _2160);
    float _4381 = fma(_2174, _4357, _2162);
    out.m_80.z = _4373;
    float _4383 = _2166 * _4355;
    float _4385 = -_4337;
    float _4387 = fma(_3541, _4385, _3575);
    float _4389 = fma(_3547, _4371, _3635);
    out.m_82.z = _4377;
    out.m_82.w = _2079;
    float _4391 = _4357;
    float _4393 = _4387;
    float _4395 = _4331;
    float _4397 = _2125;
    if (!_4367)
    {
        _4391 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4399 = _4391;
    float _4401 = fma(_2166, _4375, _2164);
    out.m_84.x = _4387;
    out.m_84.y = _4389;
    out.m_84.z = _4345;
    out.m_84.w = _4351;
    out.m_86.x = _4379;
    out.m_86.y = _4381;
    out.m_86.z = _4401;
    out.m_86.w = _4383;
    out.gl_Position.x = _2125;
    out.gl_Position.y = _2119;
    out.gl_Position.z = _4331;
    out.gl_Position.w = _2079;
    float _4403 = _1833 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4405 = _4399;
    float _4407 = _4399;
    if (!_4367)
    {
        _4393 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4409 = _4393;
    float _4411 = _4409;
    float _4413 = _4409;
    if (!_4367)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4415 = _2479;
    float _4417 = _4415;
    float _4419 = _4415;
    if (!_4367)
    {
        _4395 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4421 = _4395;
    float _4423 = _4421;
    float _4425 = _4421;
    if (!_4367)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4427 = _2481;
    float _4429 = _4427;
    float _4431 = _4427;
    if (!_4367)
    {
        _4397 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4433 = _4397;
    bool _4435 = !_4367;
    float _4437 = _4433;
    float _4439 = _4433;
    if (!_4435)
    {
        bool _4441 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4443 = isnan(_1859);
        bool _4445 = _4441 || _4443;
        bool _4447 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4449 = _4445 || _4447;
        if (!_4449)
        {
            float _4451 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4453 = _1859 + _4451;
            float _4455 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4457 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4455;
            float _4459 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4461 = _4459 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4463 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4465 = _4463 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4467 = 1.0 / _4457;
            float _4469 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4471 = _4469 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4473 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4475 = _4473 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4477 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4479 = _4477 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4481 = _4453 * _4467;
            float _4483 = precise::clamp(_4481, 0.0, 1.0);
            float _4485 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4487 = _4485 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4489 = fma(_4483, _4461, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4491 = fma(_4483, _4465, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4493 = fma(_4483, _4487, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4495 = fma(_4483, _4471, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4497 = fma(_4483, _4475, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4499 = fma(_4483, _4479, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4439 = _4489;
            _4419 = _4497;
            _4431 = _4491;
            _4413 = _4495;
            _4407 = _4493;
            _4425 = _4499;
            _4501 = true;
        }
        else
        {
            bool _4503 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4505 = isnan(_1859);
            bool _4507 = _4503 || _4505;
            bool _4509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4511 = _4507 || _4509;
            if (!_4511)
            {
                _4411 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4513 = _4411;
            _4413 = _4513;
            if (!_4511)
            {
                _4417 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4515 = _4417;
            _4419 = _4515;
            if (!_4511)
            {
                _4423 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4517 = _4423;
            _4425 = _4517;
            if (!_4511)
            {
                _4429 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4519 = _4429;
            _4431 = _4519;
            if (!_4511)
            {
                _4437 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4521 = _4437;
            _4439 = _4521;
            if (!_4511)
            {
                _4405 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4523 = _4405;
            bool _4525 = !_4511;
            _4407 = _4523;
            if (!_4525)
            {
                bool _4527 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4529 = isnan(_1859);
                bool _4531 = _4527 || _4529;
                bool _4533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4535 = _4531 || _4533;
                if (!_4535)
                {
                    float _4537 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4539 = _1859 + _4537;
                    float _4541 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4543 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4541;
                    float _4545 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4547 = _4545 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4549 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4551 = _4549 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4553 = 1.0 / _4543;
                    float _4555 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4557 = _4555 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4559 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4561 = _4559 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4563 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4565 = _4563 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4567 = _4539 * _4553;
                    float _4569 = precise::clamp(_4567, 0.0, 1.0);
                    float _4571 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4573 = _4571 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4575 = fma(_4569, _4547, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4577 = fma(_4569, _4551, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4579 = fma(_4569, _4573, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4581 = fma(_4569, _4557, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4583 = fma(_4569, _4561, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4585 = fma(_4569, _4565, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4439 = _4575;
                    _4419 = _4583;
                    _4431 = _4577;
                    _4413 = _4581;
                    _4407 = _4579;
                    _4425 = _4585;
                    _4501 = true;
                }
                else
                {
                    _4439 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4419 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4431 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4413 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4407 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4425 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4501 = false;
    float _4587 = _4439;
    float _4589 = _4419;
    float _4591 = _4431;
    float _4593 = _4413;
    float _4595 = _4407;
    float _4597 = _4425;
    float _4599 = _4403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4601 = fma(_4129, -0.5, 0.5);
    float _4603 = precise::clamp(_4601, 0.0, 1.0);
    float _4605 = -_4587;
    float _4607 = _4589 + _4605;
    float _4609 = -_4591;
    float _4611 = _4593 + _4609;
    out.m_47.x = _4599;
    float _4613 = fma(_4603, _4607, _4587);
    float _4615 = -_4595;
    float _4617 = _4597 + _4615;
    float _4619 = fma(_4603, _4611, _4591);
    float _4621 = _4613 * 0.586610972881317138671875;
    bool _4623 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4625 = fma(_4603, _4617, _4595);
    out.m_88.x = 0.0;
    float _4627 = fma(_4619, 0.298911988735198974609375, _4621);
    bool _4629 = _1833 > 0.0;
    bool _4631 = isnan(_1833);
    bool _4633 = _4629 || _4631;
    bool _4635 = isnan(0.0);
    bool _4637 = _4633 || _4635;
    float _4639 = fma(_4625, 0.114477999508380889892578125, _4627);
    float _4641 = -_4639;
    float _4643 = _4619 + _4641;
    float _4645 = -_4639;
    float _4647 = _4613 + _4645;
    float _4649 = -_4639;
    float _4651 = _4625 + _4649;
    float _4653 = fma(_4643, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4639);
    float _4655 = fma(_4647, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4639);
    float _4657 = fma(_4651, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4639);
    bool _4659 = !_4623;
    if (!_4659)
    {
        float _4661 = -_1759;
        float _4663 = _4661 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4665 = -_1761;
        float _4667 = _4665 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4669 = -_1763;
        float _4671 = _4669 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4673 = _4663 * _4663;
        float _4675 = fma(_4667, _4667, _4673);
        float _4677 = fma(_4671, _4671, _4675);
        float _4679 = sqrt(_4677);
        float _4681 = rsqrt(_4677);
        float _4683 = -_4679;
        float _4685 = _4683 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4687 = _4685 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4689 = precise::clamp(_4687, 0.0, 1.0);
        float _4691 = _4667 * _4681;
        float _4693 = _4663 * _4681;
        float _4695 = abs(_4689);
        float _4697 = log2(_4695);
        float _4699 = _4671 * _4681;
        float _4701 = _4691 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4703 = _4129 * _4693;
        float _4705 = -_4693;
        float _4707 = -_4701;
        float _4709 = fma(_4705, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4707);
        float _4711 = fma(_3913, _4691, _4703);
        float _4713 = -_4699;
        float _4715 = fma(_4713, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4709);
        float _4717 = fma(_4165, _4699, _4711);
        float _4719 = precise::clamp(_4717, 0.0, 1.0);
        float _4721 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4723 = _4715 + _4721;
        float _4725 = _4697 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4727 = _4723 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4729 = precise::clamp(_4727, 0.0, 1.0);
        float _4731 = exp2(_4725);
        float _4733 = _4731 * _4729;
        float _4735 = _4719 * _4733;
        float _4737 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4739 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4741 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _4737;
        out.m_88.y = _4739;
        out.m_88.z = _4741;
    }
    out.m_90.x = _4653;
    out.m_90.y = _4655;
    out.m_90.z = _4657;
    if (_4637)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4743;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4501 = false;
    bool _639 = false;
    bool _453 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4800 = as_type<float>(_125);
        out.gl_Position.z = _4800;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_49.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4869 = as_type<float>(_163);
        out.gl_Position.z = _4869;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _169 = as_type<int>(_165) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_165) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_167;
    float _203;
    if (!_185)
    {
        float _187 = in.m_54.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_109);
        float _209 = 1.0 / _207;
        float _211 = _143 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _213 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _239 = in.m_56.x;
    float _241 = in.m_56.y;
    float _243 = 1.0 / _225;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = 1.0 / _229;
    float _249 = 1.0 / _233;
    float _251 = _217 * _243;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = _213 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _259 = _213 + _257;
    float _261 = 1.0 / _237;
    float _263 = _221 * _247;
    bool _265 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _267 = isnan(_213);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_213);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _255 * _249;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _291;
    bool _295 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _297 = isnan(_213);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = fma(_293, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = -_305;
    float _311 = _309 + 1.0;
    float _313 = _259 * _261;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    bool _319 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _321 = isnan(_213);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _275 * _311;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = fma(_317, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = -_275;
    float _341 = _339 + 1.0;
    bool _343 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _345 = isnan(_213);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = fma(_335, _263, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = _329 * _341;
    float _363 = -_329;
    float _365 = _363 + 1.0;
    float _367 = fma(_357, _263, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = -_353;
    float _371 = _369 + 1.0;
    float _373 = _287 * _365;
    float _375 = -_287;
    float _377 = _375 + 1.0;
    float _379 = _353 * _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = _307 * _379;
    float _391 = _337 * _379;
    float _393 = fma(_383, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_387, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _389);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _391);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _409 = fma(_367, _373, _397);
    float _411 = fma(_359, _373, _399);
    float _413 = fma(_403, _313, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _415 = fma(_407, _313, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _417 = fma(_393, _361, _409);
    float _419 = fma(_395, _361, _411);
    float _421 = fma(_413, _331, _417);
    float _423 = fma(_415, _331, _419);
    float _425 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[147].x, _421);
    float _427 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[147].y, _423);
    float _429 = _425 * _239;
    float _431 = _427 * _241;
    bool _433 = !_245;
    float _451;
    if (!_433)
    {
        float _435 = in.m_54.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].x, _143);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_109);
        float _457 = 1.0 / _455;
        float _459 = _143 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _461 + _463;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _461 + _479;
    bool _483 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _485 = isnan(_461);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _503 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _505 = isnan(_461);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_477;
    float _517 = _515 + 1.0;
    float _519 = 1.0 / _501;
    float _521 = _513 * _517;
    float _523 = -_513;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _533 = 1.0 / _497;
    float _535 = _493 * _525;
    float _537 = -_493;
    float _539 = _537 + 1.0;
    float _541 = _481 * _519;
    float _543 = _465 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_529, _543, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _555 = fma(_547, _543, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = fma(_551, _543, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _559 = _553 * _535;
    float _561 = _555 * _535;
    float _563 = _557 * _535;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _577 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].x, _559);
    float _579 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].y, _561);
    float _581 = fma(_567, _541, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _583 = fma(_571, _541, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _585 = fma(_575, _541, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].z, _563);
    float _589 = fma(_581, _521, _577);
    float _591 = fma(_583, _521, _579);
    float _593 = fma(_585, _521, _587);
    float _595 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].x, _589);
    float _597 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].y, _591);
    float _599 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    float _601 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _607 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _607;
    out.m_58.y = _609;
    out.m_58.z = _611;
    bool _613 = !_531;
    float _615 = _541;
    float _617 = _587;
    int _619 = as_type<int>(_605);
    float _637;
    if (!_613)
    {
        float _621 = in.m_54.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].z, _143);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_109);
        float _643 = 1.0 / _641;
        float _645 = _143 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = in.m_54.z;
    float _651 = in.m_54.w;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _655 = _653 != 0;
    float _657 = _577;
    float _659 = _559;
    if (_655)
    {
        float _661 = in.m_54.x;
        float _663 = in.m_54.y;
        _657 = _661;
        _659 = _663;
    }
    float _665 = _657;
    float _667 = _659;
    float _669 = 0.0;
    if (_655)
    {
        _669 = 1.0;
    }
    float _671 = _669;
    float _673 = 0.0;
    float _675 = _671;
    if (_655)
    {
        _673 = 1.0;
    }
    float _677 = _673;
    float _679 = 0.0;
    float _681 = _677;
    if (_655)
    {
        _679 = 1.0;
    }
    float _683 = _679;
    float _685 = _649 * 2.0;
    float _687 = floor(_685);
    float _689 = 0.0;
    float _691 = _665;
    float _693 = _667;
    float _695 = _683;
    if (_655)
    {
        _689 = _665;
    }
    float _697 = _689;
    float _699 = _697;
    if (_655)
    {
        _615 = _667;
    }
    float _701 = _615;
    bool _703 = _687 > 0.0;
    bool _705 = _687 >= 0.0;
    bool _707 = isnan(_687);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    float _715 = _687;
    float _717 = _701;
    if (_655)
    {
        _715 = _697;
    }
    float _719 = _715;
    int _721 = _713 ? 0 : 1;
    int _723 = _721;
    float _725 = _719;
    if (_655)
    {
        _617 = _697;
    }
    float _727 = _617;
    int _729 = ~_721;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    int _735 = _733;
    float _737 = _727;
    if (!_703)
    {
        int _739 = ~_721;
        int _741 = _739 + 1;
        _735 = _741;
    }
    int _743 = _735;
    if (_655)
    {
        _619 = 0;
        _723 = 0;
    }
    int _745 = _619;
    int _747 = _723;
    int _749 = _745;
    int _751 = _747;
    if (!_655)
    {
        float _753 = in.m_54.x;
        float _755 = in.m_54.y;
        float _757 = in.m_54.z;
        float _759 = _753 * 3.1415927410125732421875;
        float _761 = _755 * 3.1415927410125732421875;
        float _763 = _759 * 0.15915493667125701904296875;
        float _765 = _761 * 0.15915493667125701904296875;
        float _767 = _763 * 6.283185482025146484375;
        float _769 = sin(_767);
        float _771 = _765 * 6.283185482025146484375;
        float _773 = sin(_771);
        _691 = _753;
        _693 = _755;
        _749 = 1;
        _725 = _769;
        _751 = 2;
        _717 = _773;
        _681 = 1.2345600128173828125;
        _699 = _755;
        _675 = 7.345489978790283203125;
        _695 = 5.839270114898681640625;
        _737 = _757;
    }
    float _775 = _691;
    float _777 = _693;
    int _779 = _749;
    float _781 = _725;
    int _783 = _751;
    float _785 = _717;
    float _787 = _681;
    float _789 = _699;
    float _791 = _675;
    float _793 = _695;
    float _795 = _737;
    float _797 = _775 * 2.0;
    float _799 = _777 * 2.0;
    bool _801 = _779 != 1;
    float _803 = _781 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _805 = floor(_797);
    float _807 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _809 = _777 + _775;
    bool _811 = _783 != 2;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _815 = floor(_799);
    bool _817 = _649 > 0.5;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _821 = fma(_807, -2.0, _813);
    float _823 = _797;
    float _825 = _807;
    float _827 = _799;
    float _829 = _803;
    if (!_801)
    {
        _823 = _649;
    }
    float _831 = _823;
    float _833 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _835 = int(_811);
    int _837 = _801 ? 2 : 0;
    int _839 = _835 | _837;
    int _841 = _817 ? 4 : 0;
    int _843 = _839 | _841;
    int _845 = false ? 8 : 0;
    int _847 = _843 | _845;
    int _849 = false ? 16 : 0;
    int _851 = _847 | _849;
    int _853 = false ? 32 : 0;
    int _855 = _851 | _853;
    int _857 = false ? 64 : 0;
    int _859 = _855 | _857;
    int _861 = _859 & 4;
    float _863 = -_819;
    float _865 = fma(_803, 2.0, _863);
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _869 = _867 != 0;
    int _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _873 = _871 != 0;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _877 = _875 != 0;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _881 = int(_879);
    float _883 = -_183;
    float _885 = _817 ? _883 : _183;
    float _887 = -_143;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[91].x, _865);
    bool _891 = _777 > 0.5;
    float _893 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _821);
    float _895 = _831;
    float _897 = _885;
    if (!_801)
    {
        _825 = _649;
    }
    float _899 = _825;
    float _901 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = _899;
    if (!_801)
    {
        _827 = _777;
    }
    float _905 = _827;
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _909 = int(_907);
    float _911 = _905;
    if (!_801)
    {
        _829 = _777;
    }
    float _913 = _829;
    int _915 = int(_811);
    int _917 = _801 ? 2 : 0;
    int _919 = _915 | _917;
    int _921 = _891 ? 4 : 0;
    int _923 = _919 | _921;
    int _925 = _869 ? 8 : 0;
    int _927 = _923 | _925;
    int _929 = _873 ? 16 : 0;
    int _931 = _927 | _929;
    int _933 = _877 ? 32 : 0;
    int _935 = _931 | _933;
    int _937 = false ? 64 : 0;
    int _939 = _935 | _937;
    int _941 = _939 & 4;
    float _943 = -_179;
    int _945 = _891 ? as_type<int>(_943) : as_type<int>(_179);
    float _947 = _913;
    float _949 = as_type<float>(_941);
    if (_801)
    {
        _895 = _777;
    }
    float _951 = _895;
    if (_801)
    {
        _903 = _777;
    }
    float _953 = _903;
    if (_801)
    {
        _911 = _775;
    }
    float _955 = _911;
    if (_801)
    {
        _947 = _775;
    }
    float _957 = _947;
    float _959 = _955 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _961 = _805 >= 0.0;
    bool _963 = isnan(_805);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _973 = _815 >= 0.0;
    bool _975 = isnan(_815);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.0);
    bool _981 = _977 || _979;
    bool _983 = !_877;
    float _985 = _983 ? _183 : _885;
    float _987 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[93].z, _971);
    bool _989 = !_873;
    float _991 = _989 ? _179 : as_type<float>(_945);
    float _993 = _775 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1005 = _1003 != 0;
    float _1007 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[92].z, _987);
    bool _1009 = !_1001;
    float _1011 = _1009 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1015 = !_997;
    int _1017 = _1015 ? 0 : 1;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1021 = !_1005;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = -_1013;
    float _1027 = fma(_993, 2.0, _1025);
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1039 = _1037 != 0;
    float _1041 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1019);
    float _1043 = _785 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1045 = _993;
    float _1047 = _1011;
    if (_811)
    {
        _1045 = _777;
    }
    float _1049 = _1045;
    float _1051 = _809 + (-1.0);
    float _1053 = _1049;
    if (_811)
    {
        _897 = _775;
    }
    float _1055 = _897;
    float _1057 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1041);
    bool _1059 = !_1035;
    int _1061 = _1059 ? 0 : 1;
    bool _1063 = !_1031;
    int _1065 = _1063 ? 0 : 1;
    bool _1067 = !_1039;
    float _1069 = _1067 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1071 = _1055;
    float _1073 = _1069;
    if (!_811)
    {
        _1071 = _649;
    }
    float _1075 = _1071;
    if (!_811)
    {
        _1053 = _775;
    }
    float _1077 = _1053;
    int _1079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1081 = _1079 != 0;
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1085 = _1083 != 0;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1089 = _1087 != 0;
    float _1091 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1093 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1095 = _805 > 0.0;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1099 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1101 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1097);
    float _1103 = float(_109);
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1109 = _969 ? 0 : 1;
    float _1111 = -_1105;
    float _1113 = fma(_959, 2.0, _1111);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1117 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1107);
    bool _1119 = _815 > 0.0;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1123 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1125 = log2(_1123);
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1129 = !_1081;
    int _1131 = _1129 ? 0 : 1;
    float _1133 = _951 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1135 = -_1121;
    float _1137 = fma(_1091, 2.0, _1135);
    float _1139 = fma(_1043, -2.0, _1127);
    int _1141 = abs(_1131);
    float _1143 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1145 = int(_1143);
    float _1147 = fma(_1133, -2.0, _1115);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1151 = float(_743);
    float _1153 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1139);
    float _1155 = float(_1141);
    float _1157 = fma(_1093, -2.0, _1149);
    float _1159 = float(_881);
    float _1161 = 1.0 / _1103;
    float _1163 = _1125 * _143;
    float _1165 = _1155 * _1151;
    float _1167 = in.m_60.x;
    float _1169 = in.m_60.y;
    float _1171 = in.m_60.z;
    float _1173 = float(_909);
    float _1175 = _1165 * (-2.0);
    float _1177 = 1.0 / _1159;
    float _1179 = float(_1145);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1183 = 1.0 + _1181;
    int _1185 = _981 ? 0 : 1;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1189 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1101);
    int _1191 = ~_1185;
    int _1193 = _1191 + 1;
    int _1195 = _1193 + 1;
    float _1197 = exp2(_1163);
    float _1199 = _1161 * _143;
    float _1201 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1187);
    int _1203 = _1195;
    if (!_1119)
    {
        int _1205 = ~_1185;
        int _1207 = _1205 + 1;
        _1203 = _1207;
    }
    int _1209 = _1203;
    float _1211 = -_143;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1027);
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1217 = 1.0 / _1173;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1221 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1223 = isnan(1.0);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1229 = _1225 || _1227;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1233 = ~_1109;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    float _1239 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1219);
    int _1241 = _1237;
    if (!_1095)
    {
        int _1243 = ~_1109;
        int _1245 = _1243 + 1;
        _1241 = _1245;
    }
    int _1247 = _1241;
    float _1249 = _1177 * _143;
    float _1251 = 1.0 / _1179;
    float _1253 = -_1197;
    float _1255 = _1253 + 1.0;
    bool _1257 = !_1085;
    int _1259 = _1257 ? 0 : 1;
    float _1261 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1231);
    bool _1263 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1265 = isnan(0.0);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1271 = _1267 || _1269;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1275 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1201);
    float _1277 = 1.0 / _1183;
    float _1279 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1215);
    float _1281 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1273);
    float _1283 = _1271 ? _1255 : 0.0;
    float _1285 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1239);
    float _1287 = _775 + (-0.5);
    float _1289 = fma(_1175, _1167, _1167);
    bool _1291 = !_1089;
    int _1293 = _1291 ? 0 : 1;
    float _1295 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1279);
    float _1297 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1147);
    int _1299 = abs(_1259);
    float _1301 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1281);
    float _1303 = float(_1247);
    float _1305 = _1217 * _143;
    float _1307 = float(_1299);
    float _1309 = _1251 * _143;
    float _1311 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1261);
    float _1313 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1117);
    float _1315 = -_143;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1113);
    float _1319 = -_143;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1137);
    float _1323 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1157);
    if (_1229)
    {
        float _1325 = _1283 * _1277;
        _147 = _1325;
    }
    float _1327 = _147;
    float _1329 = fma(_1099, _1175, _1099);
    float _1331 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1289);
    int _1333 = abs(_1293);
    float _1335 = _1307 * _1303;
    float _1337 = _777 + _649;
    float _1339 = fma(_1329, _1327, _1331);
    float _1341 = _1335 * (-2.0);
    float _1343 = _1337 + (-1.0);
    float _1345 = float(_1209);
    float _1347 = _777 + (-0.5);
    float _1349 = float(_1333);
    float _1351 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1353 = _775 + _649;
    float _1355 = _649 + (-0.5);
    float _1357 = _1339 * 0.15915493667125701904296875;
    float _1359 = _1349 * _1345;
    float _1361 = fma(_1341, _1169, _1169);
    float _1363 = _1353 + (-1.0);
    float _1365 = _1359 * (-2.0);
    float _1367 = fma(_1351, _1341, _1351);
    float _1369 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1361);
    float _1371 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1373 = fma(_1365, _1171, _1171);
    float _1375 = _1357 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = fma(_1367, _1327, _1369);
    float _1381 = fma(_1371, _1365, _1371);
    float _1383 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1373);
    bool _1385 = _651 > 0.5;
    float _1387 = _1379 * 0.15915493667125701904296875;
    float _1389 = fma(_1381, _1327, _1383);
    float _1391 = _1357 * 6.283185482025146484375;
    float _1393 = sin(_1391);
    float _1395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1399 = _1389 * 0.15915493667125701904296875;
    float _1401 = -_183;
    int _1403 = _1385 ? as_type<int>(_1401) : as_type<int>(_183);
    float _1405 = _833 * _1395;
    float _1407 = in.m_44.x;
    float _1409 = in.m_44.y;
    float _1411 = in.m_44.z;
    float _1413 = _1387 * 6.283185482025146484375;
    float _1415 = sin(_1413);
    bool _1417 = !_869;
    float _1419 = _1417 ? _183 : as_type<float>(_1403);
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1423 = _1421 != 0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1431 = _1429 != 0;
    int _1433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1435 = _1433 != 0;
    float _1437 = _1387 * 6.283185482025146484375;
    float _1439 = cos(_1437);
    bool _1441 = !_1427;
    int _1443 = _1441 ? 0 : 1;
    bool _1445 = !_1423;
    int _1447 = _1445 ? 0 : 1;
    bool _1449 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1451 = isnan(0.5);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1457 = _1453 || _1455;
    bool _1459 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1461 = isnan(0.5);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1467 = _1463 || _1465;
    float _1469 = _1399 * 6.283185482025146484375;
    float _1471 = cos(_1469);
    float _1473 = _1377 * _1415;
    float _1475 = _1393 * _1415;
    float _1477 = _901 * _1397;
    bool _1479 = !_1431;
    int _1481 = _1479 ? 0 : 1;
    bool _1483 = !_1435;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = _1399 * 6.283185482025146484375;
    float _1489 = sin(_1487);
    float _1491 = _1377 * _1439;
    float _1493 = _1393 * _1439;
    float _1495 = _1377 * _1471;
    float _1497 = _1393 * _1471;
    float _1499 = _1439 * _1471;
    float _1501 = _1415 * _1471;
    float _1503 = _1495 * _1477;
    float _1505 = _1497 * _1477;
    float _1507 = fma(_1489, _1491, _1475);
    float _1509 = -_1473;
    float _1511 = fma(_1489, _1493, _1509);
    float _1513 = -_1493;
    float _1515 = fma(_1489, _1473, _1513);
    float _1517 = -_1477;
    float _1519 = _1489 * _1517;
    float _1521 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1523 = fma(_1507, _1405, _1503);
    float _1525 = fma(_1489, _1475, _1491);
    float _1527 = fma(_1499, _1405, _1519);
    float _1529 = fma(_1511, _1405, _1505);
    float _1531 = fma(_1515, _1521, _1523);
    float _1533 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1535 = fma(_1501, _1521, _1527);
    float _1537 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1541 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1533);
    float _1543 = fma(_1525, _1521, _1529);
    float _1545 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1539);
    float _1549 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1537);
    float _1551 = fma(_1411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1541);
    float _1553 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1545);
    float _1555 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1547);
    float _1557 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1559 = fma(_1411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1549);
    float _1561 = _1551 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1563 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1553);
    float _1565 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1567 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1557);
    float _1569 = _1559 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1571 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1573 = _1561 + _1565;
    float _1575 = fma(_1411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1567);
    float _1577 = _1569 + _1571;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1581 = _1573 + _1579;
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1585 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1589 = _1577 + _1587;
    float _1591 = _1581 * _1581;
    float _1593 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1585);
    float _1597 = fma(_1589, _1589, _1591);
    float _1599 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1601 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1603 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1595);
    float _1605 = sqrt(_1597);
    float _1607 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1599);
    float _1609 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1601);
    float _1611 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1613 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1615 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1609);
    float _1617 = 1.0 / _1613;
    float _1619 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1621 = _1619 + _1613;
    bool _1623 = _1605 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1625 = _1621 * _1617;
    float _1627 = _1625 * 0.5;
    float _1629 = _1583 + _1611;
    float _1631 = _1621;
    float _1633 = _1607;
    float _1635 = _1611;
    float _1637 = _1573;
    float _1639 = _1629;
    bool _1641 = _1623;
    if (!_1623)
    {
        _1631 = _1577;
    }
    float _1643 = _1631;
    float _1645 = _1643;
    if (!_1623)
    {
        _1633 = _1573;
    }
    float _1647 = _1633;
    float _1649 = _1647;
    if (!_1623)
    {
        _1635 = _1629;
    }
    float _1651 = _1635;
    bool _1653 = !_1623;
    float _1655 = _1651;
    if (!_1653)
    {
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1661 = _1605 + _1659;
        float _1663 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1665 = rsqrt(_1597);
        float _1667 = _1661 * _1657;
        float _1669 = _1667 * 0.15915493667125701904296875;
        float _1671 = _1669 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1669 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        float _1679 = _1673 + (-1.0);
        float _1681 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = fma(_1677, _1663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1685 = fma(_1629, _1673, _1681);
        float _1687 = _1665 * _1683;
        float _1689 = fma(_1589, _1687, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1691 = fma(_1581, _1687, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1645 = _1689;
        _1649 = _1691;
        _1655 = _1685;
    }
    float _1693 = _1645;
    float _1695 = _1649;
    float _1697 = _1655;
    float _1699 = _1697;
    float _1701 = _1693;
    float _1703 = _1695;
    if (_1467)
    {
        _1637 = 1.0;
    }
    float _1705 = _1637;
    float _1707 = _1705;
    if (!_1457)
    {
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1711 = _1583 + _1709;
        float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1715 = _1569 + _1713;
        float _1717 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1719 = -_1569;
        float _1721 = _1719 + _1693;
        float _1723 = _1711 * _1711;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1727 = _1561 + _1725;
        float _1729 = -_1561;
        float _1731 = _1729 + _1695;
        float _1733 = -_1583;
        float _1735 = _1733 + _1697;
        float _1737 = fma(_1715, _1715, _1723);
        float _1739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1741 = fma(_1727, _1727, _1737);
        float _1743 = sqrt(_1741);
        float _1745 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1747 = precise::min(_1743, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1749 = _1747 * _1739;
        float _1751 = _1745 * _1749;
        float _1753 = fma(_1721, _1751, _1569);
        float _1755 = fma(_1731, _1751, _1561);
        float _1757 = fma(_1735, _1751, _1583);
        _1699 = _1757;
        _1701 = _1753;
        _1703 = _1755;
        _1639 = _1739;
    }
    float _1759 = _1699;
    float _1761 = _1701;
    float _1763 = _1703;
    float _1765 = _1639;
    float _1767 = _1765;
    if (!_1467)
    {
        float _1769 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1771 = _1769 * 0.15915493667125701904296875;
        float _1773 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1777 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1775);
        float _1779 = _1771 * 6.283185482025146484375;
        float _1781 = cos(_1779);
        float _1783 = _1773 * 0.15915493667125701904296875;
        float _1785 = _1771 * 6.283185482025146484375;
        float _1787 = sin(_1785);
        float _1789 = 1.0 / _1781;
        float _1791 = _1783 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = _1787 * _1789;
        float _1797 = _1783 * 6.283185482025146484375;
        float _1799 = sin(_1797);
        float _1801 = _1793 * _1795;
        float _1803 = 1.0 / _1777;
        float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1807 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1805;
        float _1809 = 1.0 / _1801;
        float _1811 = 1.0 / _1807;
        float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1815 = _1803 * _1813;
        float _1817 = _1799 * _1809;
        float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1821 = fma(_1817, _1815, _1819);
        float _1823 = _1821 * _1811;
        float _1825 = precise::clamp(_1823, 0.0, 1.0);
        float _1827 = -_1825;
        float _1829 = _1827 + 1.0;
        _1767 = _1783;
        _1707 = _1829;
    }
    float _1831 = _1767;
    float _1833 = _1707;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1837 = _1759 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1841 = _1761 + _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1845 = _1763 + _1843;
    bool _1847 = _861 != 0;
    float _1849 = _1837 * _1837;
    bool _1851 = _941 != 0;
    float _1853 = fma(_1841, _1841, _1849);
    float _1855 = fma(_1845, _1845, _1853);
    float _1857 = rsqrt(_1855);
    float _1859 = sqrt(_1855);
    float _1861 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1863 = _1841 * _1861;
    float _1865 = _1845 * _1861;
    float _1867 = _1863 * _1863;
    float _1869 = _1865 * _1865;
    float _1871 = _1867 + _1869;
    float _1873 = sqrt(_1871);
    bool _1875 = _1873 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = _1873 + _1877;
    float _1881 = _1845;
    float _1883 = _1871;
    float _1885 = _1879;
    float _1887 = _1831;
    float _1889 = _1837;
    if (_1875)
    {
        float _1891 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1891;
    }
    float _1893 = _1881;
    if (_1875)
    {
        float _1895 = rsqrt(_1871);
        _1883 = _1895;
    }
    float _1897 = _1883;
    if (_1875)
    {
        float _1899 = _1879 * _1893;
        _1885 = _1899;
    }
    float _1901 = _1885;
    if (_1875)
    {
        float _1903 = _1901 * 0.15915493667125701904296875;
        _1887 = _1903;
    }
    float _1905 = _1887;
    float _1907 = _1857;
    float _1909 = _1905;
    if (_1875)
    {
        float _1911 = _1905 * 6.283185482025146484375;
        float _1913 = sin(_1911);
        _1907 = _1913;
    }
    float _1915 = _1907;
    float _1917 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1919 = precise::max(0.0, _1917);
    float _1921 = _1849;
    float _1923 = _1919;
    float _1925 = _1917;
    if (_1875)
    {
        float _1927 = _1905 * 6.283185482025146484375;
        float _1929 = cos(_1927);
        _1921 = _1929;
    }
    float _1931 = _1921;
    float _1933 = -_1861;
    float _1935 = -_1919;
    float _1937 = fma(_1837, _1933, _1935);
    if (!_1875)
    {
        _1889 = _1863;
    }
    float _1939 = _1889;
    float _1941 = _1939;
    if (_1875)
    {
        float _1943 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1923 = _1943;
    }
    float _1945 = _1923;
    float _1947 = _1915;
    float _1949 = _1945;
    if (_1875)
    {
        float _1951 = fma(_1915, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1947 = _1951;
    }
    float _1953 = _1947;
    float _1955 = _1953;
    if (!_1875)
    {
        _1949 = _1937;
    }
    float _1957 = _1949;
    float _1959 = _1957;
    float _1961 = _1931;
    if (_1875)
    {
        float _1963 = _1931 + (-1.0);
        _1925 = _1963;
    }
    float _1965 = _1925;
    float _1967 = _1965;
    if (_1875)
    {
        float _1969 = _1897 * _1953;
        _949 = _1969;
    }
    float _1971 = _949;
    if (!_1875)
    {
        _1955 = _1867;
    }
    float _1973 = _1955;
    float _1975 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1977 = _1973;
    if (_1875)
    {
        float _1979 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1909 = _1979;
    }
    float _1981 = _1909;
    if (_1875)
    {
        float _1983 = _1863 * _1971;
        _1941 = _1983;
    }
    float _1985 = _1941;
    if (!_1875)
    {
        _1967 = _1865;
    }
    float _1987 = _1967;
    float _1989 = _1987;
    if (_1875)
    {
        float _1991 = _1865 * _1971;
        _1989 = _1991;
    }
    float _1993 = _1989;
    if (_1875)
    {
        float _1995 = fma(_1937, _1931, _1981);
        _1959 = _1995;
    }
    float _1997 = _1959;
    if (_1875)
    {
        float _1999 = _1985 * _1985;
        _1977 = _1999;
    }
    float _2001 = _1977;
    if (!_1875)
    {
        _1961 = _1869;
    }
    float _2003 = _1961;
    float _2005 = _2003;
    if (_1875)
    {
        float _2007 = _1993 * _1993;
        _2005 = _2007;
    }
    float _2009 = _2005;
    float _2011 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2013 = fma(_1997, _1997, _2001);
    float _2015 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2017 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2011);
    float _2019 = _2013 + _2009;
    float _2021 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2023 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2015);
    float _2025 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2017);
    float _2027 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2029 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2021);
    float _2031 = rsqrt(_2019);
    float _2033 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2023);
    float _2035 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2037 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2029);
    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2041 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2039);
    float _2043 = precise::clamp(_2041, 0.0, 1.0);
    float _2045 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2047 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2027);
    float _2049 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2051 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2053 = -_2043;
    float _2055 = _2053 + 1.0;
    float _2057 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2059 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2047);
    float _2061 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2051);
    float _2063 = -_2057;
    float _2065 = fma(_2063, _1975, 1.0);
    float _2067 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2069 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2061);
    float _2071 = _2031 * _1985;
    float _2073 = abs(_2055);
    float _2075 = log2(_2073);
    float _2077 = _2031 * _1993;
    float _2079 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2069);
    float _2081 = _2031 * _1997;
    float _2083 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2085 = -_2083;
    float _2087 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2085);
    float _2089 = 1.0 / _2079;
    float _2091 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2093 = -_2077;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2087);
    float _2097 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2091);
    float _2101 = fma(_2095, -0.5, 0.5);
    float _2103 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2105 = log2(_2065);
    float _2107 = fma(_2095, 0.5, 0.5);
    float _2109 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2111 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2099);
    float _2113 = _2081 + 1.0;
    float _2115 = fma(_2107, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2117 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2109);
    float _2119 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2111);
    float _2121 = exp2(_2103);
    float _2123 = fma(_2107, _2115, -0.212114393711090087890625);
    float _2125 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2117);
    float _2127 = fma(_2107, _2123, 1.570728778839111328125);
    float _2129 = _2125 * _2089;
    float _2131 = sqrt(_2101);
    float _2133 = _2105 * 0.693147182464599609375;
    float _2135 = fma(_2129, 0.5, 0.5);
    float _2137 = -_2081;
    float _2139 = fma(_2121, _2113, _2137);
    float _2141 = _2119 * _2089;
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2145 = fma(_2141, -0.5, 0.5);
    float _2147 = _2131 * 0.636619746685028076171875;
    float _2149 = -_2127;
    float _2151 = fma(_2147, _2149, 1.0);
    float _2153 = fma(_2139, 0.5, 0.5);
    float3 _7957 = float3(_2135, _2145, _2143);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7957, float3(0.0), isnan(_7957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7957, float3(0.0), isnan(_7957)), level(0.0)).x;
    float3 _7968 = float3(_2135, _2145, _2143);
    float4 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7968, float3(0.0), isnan(_7968)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7968, float3(0.0), isnan(_7968)), level(0.0)).xyzw;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2158.w;
    float2 _7985 = float2(_2151, _2153);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7985, float2(0.0), isnan(_7985)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7985, float2(0.0), isnan(_7985)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    float _2178 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2180 = int(_2178);
    float _2182 = _787 * _789;
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2186 = _2184 != 0;
    out.m_62.y = _901;
    int _2188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2190 = _2188 != 0;
    float _2192 = -_1057;
    float _2194 = _2192 + 1.0;
    int _2196 = abs(_1017);
    float _2198 = -_1311;
    float _2200 = _2198 + 1.0;
    float _2202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2204 = int(_2202);
    int _2206 = abs(_1443);
    float _2208 = -_1301;
    float _2210 = _2208 + 1.0;
    int _2212 = abs(_1023);
    out.m_64.y = _1583;
    int _2214 = abs(_1485);
    float _2216 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2218 = abs(_1065);
    float _2220 = trunc(_1249);
    int _2222 = int(_2220);
    float _2224 = float(uint(_2180));
    float _2226 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2228 = ~_2180;
    int _2230 = _2228 + 1;
    float _2232 = -_1189;
    float _2234 = _2232 + 1.0;
    float _2236 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2226);
    float _2238 = 1.0 / _2224;
    float _2240 = float(uint(_2204));
    float _2242 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2236);
    int _2244 = ~_2204;
    int _2246 = _2244 + 1;
    float _2248 = -_1313;
    float _2250 = _2248 + 1.0;
    int _2252 = ~_2204;
    int _2254 = _2252 + 1;
    out.m_66.x = _1761;
    out.m_66.y = _1759;
    out.m_66.z = _1763;
    float _2256 = 1.0 / _2240;
    float _2258 = trunc(_1305);
    int _2260 = int(_2258);
    int _2262 = as_type<int>(_2238) + (-2);
    float _2264 = float(uint(_2222));
    float _2266 = float(_2222);
    int _2268 = as_type<int>(_2256) + (-2);
    float _2270 = as_type<float>(_2262) * _2264;
    float _2272 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2274 = int(_2272);
    float _2276 = float(uint(_2260));
    float _2278 = trunc(_2270);
    float _2280 = precise::max(_2278, 0.0);
    uint _2283 = uint(_2280);
    float _2285 = as_type<float>(_2268) * _2276;
    int _2287 = ~_2180;
    int _2289 = _2287 + 1;
    float _2291 = trunc(_2285);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    float _2297 = float(uint(_2274));
    int _2299 = _2289 * int(_2283);
    int _2301 = _2299 + _2222;
    float _2303 = 1.0 / _2297;
    float _2305 = _791 * _775;
    float _2307 = float(uint(_2301));
    int _2309 = _2246 * int(_2295);
    int _2311 = _2309 + _2260;
    float _2313 = trunc(_1309);
    int _2315 = int(_2313);
    float _2317 = as_type<float>(_2262) * _2307;
    float _2319 = float(uint(_2311));
    float _2321 = trunc(_2317);
    float _2323 = precise::max(_2321, 0.0);
    uint _2325 = uint(_2323);
    float _2327 = as_type<float>(_2268) * _2319;
    float _2329 = trunc(_2327);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    float _2335 = floor(_2305);
    int _2337 = int(_2283) + int(_2325);
    float _2339 = _793 * _795;
    int _2341 = as_type<int>(_2303) + (-2);
    float _2343 = float(uint(_2315));
    int _2345 = _2230 * _2337;
    int _2347 = _2345 + _2222;
    int _2349 = int(_2295) + int(_2333);
    float _2351 = exp2(_2216);
    float _2353 = as_type<float>(_2341) * _2343;
    float _2355 = float(_2180);
    int _2357 = _2254 * _2349;
    int _2359 = _2357 + _2260;
    bool _2361 = uint(_2347) >= uint(_2180);
    float _2363 = -_2335;
    float _2365 = _2305 + _2363;
    float _2367 = floor(_2182);
    bool _2369 = _2266 >= _2355;
    bool _2371 = isnan(_2266);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(_2355);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    bool _2381 = uint(_2359) >= uint(_2204);
    float _2383 = float(_2204);
    float _2385 = float(_2260);
    float _2387 = trunc(_2353);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    bool _2393 = !_2186;
    int _2395 = _2393 ? 0 : 1;
    float _2397 = -_2351;
    float _2399 = _2397 + 1.0;
    int _2401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2403 = _2401 != 0;
    float _2405 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2407 = -_2367;
    float _2409 = _2182 + _2407;
    float _2411 = _2365 * _2355;
    float _2413 = trunc(_2379);
    int _2415 = int(_2413);
    bool _2417 = _2385 >= _2383;
    bool _2419 = isnan(_2385);
    bool _2421 = _2417 || _2419;
    bool _2423 = isnan(_2383);
    bool _2425 = _2421 || _2423;
    float _2427 = float(_2425);
    float _2429 = _2355 * _1199;
    int _2431 = abs(_2395);
    int _2433 = ~_2274;
    int _2435 = _2433 + 1;
    bool _2437 = !_2381;
    int _2439 = _2437 ? 0 : (-1);
    float _2441 = trunc(_2411);
    int _2443 = int(_2441);
    bool _2445 = !_2361;
    int _2447 = _2445 ? 0 : (-1);
    int _2449 = ~_2349;
    int _2451 = _2449 + _2439;
    int _2453 = _2451 + 1;
    int _2455 = ~_2337;
    int _2457 = _2455 + _2447;
    int _2459 = _2457 + 1;
    float _2461 = _2409 * _2383;
    bool _2463 = !_2403;
    int _2465 = _2463 ? 0 : 1;
    int _2467 = _2435 * int(_2391);
    int _2469 = _2467 + _2315;
    float _2471 = trunc(_2427);
    int _2473 = int(_2471);
    float _2475 = as_type<float>(_2435);
    float _2477 = _2339;
    float _2479 = _2079;
    float _2481 = _2119;
    if (_2190)
    {
        float _2483 = in.m_54.w;
        _2475 = _2483;
    }
    float _2485 = _2475;
    int _2487 = abs(_2465);
    float _2489 = _2383 * _1199;
    float _2491 = float(uint(_2469));
    int _2493 = _2204 * _2453;
    int _2495 = _2493 + _2260;
    bool _2497 = _2180 == 0;
    int _2499 = _2443 * _2431;
    int _2501 = _2499 + _2222;
    float _2503 = trunc(_2461);
    int _2505 = int(_2503);
    float _2507 = as_type<float>(_2341) * _2491;
    int _2509 = _2180 * _2459;
    int _2511 = _2509 + _2222;
    int _2513 = ~_2415;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    bool _2519 = _2204 == 0;
    bool _2521 = !_2497;
    int _2523 = _2521 ? _2511 : (-1);
    float _2525 = trunc(_2507);
    float _2527 = precise::max(_2525, 0.0);
    uint _2529 = uint(_2527);
    int _2531 = ~_2473;
    int _2533 = _2531 + 1;
    int _2535 = _2533 + 1;
    bool _2537 = !_2519;
    int _2539 = _2537 ? _2495 : (-1);
    int _2541 = _2523 * _2517;
    int _2543 = _2204 + (-1);
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2547 = _2545 != 0;
    int _2549 = _2505 * _2487;
    int _2551 = _2549 + _2260;
    int _2553 = _2180 + (-1);
    float _2555 = trunc(_2429);
    int _2557 = int(_2555);
    int _2559 = _2539 * _2535;
    int _2561 = _2415 * _2553;
    int _2563 = _2561 + _2541;
    int _2565 = abs(as_type<int>(_1011));
    float _2567 = as_type<float>(_2563);
    if (_2190)
    {
        float _2569 = _2485 * 3.1415927410125732421875;
        _1047 = _2569;
    }
    float _2571 = _1047;
    int _2573 = int(_2391) + int(_2529);
    float _2575 = trunc(_2489);
    int _2577 = int(_2575);
    int _2579 = ~_2274;
    int _2581 = _2579 + 1;
    int _2583 = _2473 * _2543;
    int _2585 = _2583 + _2559;
    int _2587 = abs(_1447);
    int _2589 = _2563 * _2565;
    if (_2190)
    {
        float _2591 = _2571 * 0.15915493667125701904296875;
        _2567 = _2591;
    }
    float _2593 = _2567;
    int _2595 = _2581 * _2573;
    int _2597 = _2595 + _2315;
    bool _2599 = !_2547;
    int _2601 = _2599 ? 0 : 1;
    int _2603 = _2557 * _2196;
    int _2605 = _2603 + _2589;
    float _2607 = float(_2315);
    int _2609 = _2585 * _2206;
    bool _2611 = uint(_2597) >= uint(_2274);
    float _2613 = _2593;
    if (_2190)
    {
        float _2615 = _2593 * 6.283185482025146484375;
        float _2617 = sin(_2615);
        _2613 = _2617;
    }
    float _2619 = _2613;
    int _2621 = abs(_2601);
    int _2623 = _2501 * _2212;
    int _2625 = _2623 + _2605;
    float _2627 = float(_2274);
    int _2629 = _2577 * _2587;
    int _2631 = _2629 + _2609;
    bool _2633 = !_2611;
    int _2635 = _2633 ? 0 : (-1);
    int _2637 = _2443 * _2621;
    int _2639 = _2637 + _2625;
    int _2641 = abs(_1481);
    float _2643 = floor(_2339);
    bool _2645 = _2607 >= _2627;
    bool _2647 = isnan(_2607);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan(_2627);
    bool _2653 = _2649 || _2651;
    float _2655 = float(_2653);
    float _2657 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2657;
    int _2661 = ~_2573;
    int _2663 = _2661 + _2635;
    int _2665 = _2663 + 1;
    float _2667 = _2627 * _1199;
    int _2669 = _2551 * _2641;
    int _2671 = _2669 + _2631;
    float _2673 = float(uint(_2639));
    float _2675 = trunc(_2655);
    int _2677 = int(_2675);
    bool _2679 = _2274 == 0;
    int _2681 = _2505 * _2214;
    int _2683 = _2681 + _2671;
    int _2685 = ~_2180;
    int _2687 = _2685 + 1;
    float _2689 = as_type<float>(_2262) * _2673;
    int _2691 = _2274 * _2665;
    int _2693 = _2691 + _2315;
    if (_2190)
    {
        bool _2695 = _2619 > 0.5;
        _1641 = _2695;
    }
    bool _2697 = _1641;
    float _2699 = float(uint(_2683));
    float _2701 = -_2643;
    float _2703 = _2339 + _2701;
    float _2705 = trunc(_2689);
    float _2707 = precise::max(_2705, 0.0);
    uint _2709 = uint(_2707);
    bool _2711 = !_2679;
    int _2713 = _2711 ? _2693 : (-1);
    float _2715 = as_type<float>(_2268) * _2699;
    if (!_2190)
    {
        _2477 = _179;
    }
    float _2717 = _2477;
    float _2719 = _2703 * _2627;
    int _2721 = ~_2677;
    int _2723 = _2721 + 1;
    int _2725 = _2723 + 1;
    float _2727 = float(uint(_2501));
    float _2729 = trunc(_2715);
    float _2731 = precise::max(_2729, 0.0);
    uint _2733 = uint(_2731);
    float _2735 = _2717;
    if (_2190)
    {
        float _2737 = -_179;
        float _2739 = _2697 ? _2737 : _179;
        _2735 = _2739;
    }
    float _2741 = _2735;
    int _2743 = _2713 * _2725;
    int _2745 = _2274 + (-1);
    float _2747 = as_type<float>(_2262) * _2727;
    int _2749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2751 = _2749 != 0;
    int _2753 = _2687 * int(_2709);
    int _2755 = _2753 + _2639;
    int _2757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2759 = _2757 != 0;
    int _2761 = _2677 * _2745;
    int _2763 = _2761 + _2743;
    int _2765 = ~_2204;
    int _2767 = _2765 + 1;
    float _2769 = trunc(_2719);
    int _2771 = int(_2769);
    float _2773 = float(uint(_2755));
    int _2775 = abs(_1061);
    bool _2777 = !_2759;
    int _2779 = _2777 ? 0 : 1;
    int _2781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2783 = _2781 != 0;
    float _2785 = as_type<float>(_2262) * _2773;
    int _2787 = _2767 * int(_2733);
    int _2789 = _2787 + _2683;
    float _2791 = trunc(_2667);
    int _2793 = int(_2791);
    float _2795 = _2619;
    if (_2751)
    {
        float _2797 = in.m_54.x;
        _2795 = _2797;
    }
    float _2799 = _2795;
    int _2801 = _2763 * _2775;
    int _2803 = abs(_2779);
    float _2805 = float(uint(_2789));
    float _2807 = float(uint(_2551));
    float _2809 = trunc(_2747);
    float _2811 = precise::max(_2809, 0.0);
    uint _2813 = uint(_2811);
    int _2815 = ~_2180;
    int _2817 = _2815 + 1;
    float _2819 = as_type<float>(_2268) * _2805;
    int _2821 = _2771 * _2803;
    int _2823 = _2821 + _2315;
    float _2825 = as_type<float>(_2268) * _2807;
    int _2827 = abs(as_type<int>(_1069));
    float _2829 = trunc(_2785);
    float _2831 = precise::max(_2829, 0.0);
    uint _2833 = uint(_2831);
    int _2835 = _2793 * _2218;
    int _2837 = _2835 + _2801;
    int _2839 = ~_2180;
    int _2841 = _2839 + 1;
    int _2843 = ~_2274;
    int _2845 = _2843 + 1;
    int _2847 = _2823 * _2827;
    int _2849 = _2847 + _2837;
    int _2851 = ~_2204;
    int _2853 = _2851 + 1;
    float _2855 = trunc(_2819);
    float _2857 = precise::max(_2855, 0.0);
    uint _2859 = uint(_2857);
    int _2861 = _2817 * int(_2813);
    int _2863 = _2861 + _2501;
    float _2865 = _2799;
    if (_2751)
    {
        float _2867 = _2799 * 3.1415927410125732421875;
        _1073 = _2867;
    }
    float _2869 = _1073;
    float _2871 = _2869;
    if (!_2751)
    {
        _2865 = _183;
    }
    float _2873 = _2865;
    int _2875 = ~_2274;
    int _2877 = _2875 + 1;
    float _2879 = _2873;
    if (_2751)
    {
        float _2881 = _2869 * 0.15915493667125701904296875;
        _2871 = _2881;
    }
    float _2883 = _2871;
    float _2885 = float(uint(_2863));
    float _2887 = trunc(_2825);
    float _2889 = precise::max(_2887, 0.0);
    uint _2891 = uint(_2889);
    int _2893 = int(_2709) + int(_2833);
    bool _2895 = !_2783;
    int _2897 = _2895 ? 0 : 1;
    float _2899 = as_type<float>(_2262) * _2885;
    int _2901 = _2841 * _2893;
    int _2903 = _2901 + _2639;
    int _2905 = abs(_2897);
    float _2907 = _2883;
    if (_2751)
    {
        float _2909 = _2883 * 6.283185482025146484375;
        float _2911 = sin(_2909);
        _2907 = _2911;
    }
    float _2913 = _2907;
    int _2915 = int(_2733) + int(_2859);
    int _2917 = ~_2204;
    int _2919 = _2917 + 1;
    int _2921 = _2771 * _2905;
    int _2923 = _2921 + _2849;
    bool _2925 = uint(_2903) >= uint(_2180);
    int _2927 = _2853 * _2915;
    int _2929 = _2927 + _2683;
    float _2931 = float(uint(_2823));
    float _2933 = trunc(_2899);
    float _2935 = precise::max(_2933, 0.0);
    uint _2937 = uint(_2935);
    bool _2939 = !_2925;
    int _2941 = _2939 ? 0 : (-1);
    int _2943 = _2919 * int(_2891);
    int _2945 = _2943 + _2551;
    bool _2947 = uint(_2929) >= uint(_2204);
    float _2949 = as_type<float>(_2341) * _2931;
    int _2951 = ~_2893;
    int _2953 = _2951 + _2941;
    int _2955 = _2953 + 1;
    float _2957 = float(uint(_2945));
    float _2959 = trunc(_2949);
    float _2961 = precise::max(_2959, 0.0);
    uint _2963 = uint(_2961);
    float _2965 = float(uint(_2923));
    int _2967 = _2180 * _2955;
    int _2969 = _2967 + _2639;
    bool _2971 = !_2947;
    int _2973 = _2971 ? 0 : (-1);
    float _2975 = as_type<float>(_2268) * _2957;
    int _2977 = ~_2274;
    int _2979 = _2977 + 1;
    float _2981 = as_type<float>(_2341) * _2965;
    float _2983 = -_179;
    int _2985 = _1847 ? as_type<int>(_2983) : as_type<int>(_179);
    int _2987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2989 = _2987 != 0;
    float _2991 = trunc(_2981);
    float _2993 = precise::max(_2991, 0.0);
    uint _2995 = uint(_2993);
    bool _2997 = _2947;
    if (_2751)
    {
        bool _2999 = _2913 > 0.5;
        _2997 = _2999;
    }
    bool _3001 = _2997;
    int _3003 = ~_2915;
    int _3005 = _3003 + _2973;
    int _3007 = _3005 + 1;
    bool _3009 = !_2989;
    float _3011 = _3009 ? _179 : as_type<float>(_2985);
    int _3013 = _2979 * int(_2963);
    int _3015 = _3013 + _2823;
    int _3017 = ~_2274;
    int _3019 = _3017 + 1;
    int _3021 = _2204 * _3007;
    int _3023 = _3021 + _2683;
    bool _3025 = !_2497;
    int _3027 = _3025 ? _2969 : (-1);
    float _3029 = trunc(_2975);
    float _3031 = precise::max(_3029, 0.0);
    uint _3033 = uint(_3031);
    float _3035 = float(uint(_3015));
    int _3037 = int(_2813) + int(_2937);
    int _3039 = ~_2180;
    int _3041 = _3039 + 1;
    int _3043 = _3019 * int(_2995);
    int _3045 = _3043 + _2923;
    if (_2751)
    {
        float _3047 = -_183;
        float _3049 = _3001 ? _3047 : _183;
        _2879 = _3049;
    }
    float _3051 = _2879;
    float _3053 = as_type<float>(_2341) * _3035;
    int _3055 = _3027 & 3;
    bool _3057 = _3055 != 0;
    float _3059 = float(uint(_3045));
    int _3061 = _3041 * _3037;
    int _3063 = _3061 + _2501;
    float _3065 = -_183;
    int _3067 = _1851 ? as_type<int>(_3065) : as_type<int>(_183);
    float _3069 = trunc(_3053);
    float _3071 = precise::max(_3069, 0.0);
    uint _3073 = uint(_3071);
    bool _3075 = uint(_3055) > 1u;
    float _3077 = as_type<float>(_2341) * _3059;
    int _3079 = _3027 & 3;
    bool _3081 = _3079 != 0;
    int _3083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3085 = _3083 != 0;
    bool _3087 = !_2519;
    int _3089 = _3087 ? _3023 : (-1);
    float _3091 = trunc(_3077);
    float _3093 = precise::max(_3091, 0.0);
    uint _3095 = uint(_3093);
    int _3097 = _3081 ? 0 : 1;
    bool _3099 = !_3085;
    float _3101 = _3099 ? _183 : as_type<float>(_3067);
    bool _3103 = uint(_3063) >= uint(_2180);
    int _3105 = _3089 & 3;
    bool _3107 = _3105 != 0;
    bool _3109 = !_3103;
    int _3111 = _3109 ? 0 : (-1);
    bool _3113 = uint(_3105) > 1u;
    int _3115 = ~_3097;
    int _3117 = _3115 + 1;
    int _3119 = _3117 + 1;
    int _3121 = _3119;
    if (!_3075)
    {
        int _3123 = ~_3097;
        int _3125 = _3123 + 1;
        _3121 = _3125;
    }
    int _3127 = _3121;
    int _3129 = _3089 & 3;
    bool _3131 = _3129 != 0;
    int _3133 = int(_2891) + int(_3033);
    int _3135 = _3131 ? 0 : 1;
    int _3137 = int(_2963) + int(_3073);
    int _3139 = ~_3135;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    int _3145 = _3143;
    if (!_3113)
    {
        int _3147 = ~_3135;
        int _3149 = _3147 + 1;
        _3145 = _3149;
    }
    int _3151 = _3145;
    bool _3153 = !_3107;
    int _3155 = _3153 ? 0 : 1;
    bool _3157 = _3105 != 3;
    int _3159 = ~_2204;
    int _3161 = _3159 + 1;
    bool _3163 = uint(_3105) >= 2u;
    int _3165 = int(_2995) + int(_3095);
    int _3167 = _3163 ? 0 : 1;
    float _3169 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _3173 = _775 > 0.5;
    int _3175 = _3161 * _3133;
    int _3177 = _3175 + _2551;
    float _3179 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _3181 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _3179;
    int _3183 = ~_3167;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    int _3189 = _2845 * _3165;
    int _3191 = _3189 + _2923;
    int _3193 = _3187;
    if (_3157)
    {
        int _3195 = ~_3167;
        int _3197 = _3195 + 1;
        _3193 = _3197;
    }
    int _3199 = _3193;
    float _3201 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _3203 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _3201;
    float _3205 = 1.0 / _3171;
    bool _3207 = uint(_3177) >= uint(_2204);
    int _3209 = _2877 * _3137;
    int _3211 = _3209 + _2823;
    float _3213 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _3215 = _3213 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _3217 = uint(_3191) >= uint(_2274);
    float _3219 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _3221 = _647 + _3219;
    bool _3223 = !_3207;
    int _3225 = _3223 ? 0 : (-1);
    float _3227 = 1.0 / _3181;
    bool _3229 = uint(_3211) >= uint(_2274);
    float _3231 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _3233 = _647 + _3231;
    bool _3235 = !_3217;
    int _3237 = _3235 ? 0 : (-1);
    bool _3239 = !_3229;
    int _3241 = _3239 ? 0 : (-1);
    bool _3243 = _3105 != 3;
    float _3245 = 1.0 / _3203;
    int _3247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3249 = _3247 != 0;
    float _3251 = _3221 * _3205;
    float _3253 = -_179;
    int _3255 = _3173 ? as_type<int>(_3253) : as_type<int>(_179);
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _3259 = _647 + _3257;
    bool _3261 = !_3243;
    int _3263 = _3261 ? 0 : (-1);
    bool _3265 = !_3249;
    float _3267 = _3265 ? _179 : as_type<float>(_3255);
    float _3269 = 1.0 / _3215;
    int _3271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3273 = _3271 != 0;
    float _3275 = _3233 * _3227;
    int _3277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3279 = _3277 != 0;
    float _3281 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _3283 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _3281;
    int _3285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3287 = _3285 != 0;
    float _3289 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _3291 = _647 + _3289;
    float _3293 = fma(_2659, _3275, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _3295 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _3297 = isnan(_647);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _3303 = _3299 || _3301;
    float _3305 = float(_3303);
    float _3307 = _3291 * _3245;
    float _3309 = fma(_3283, _3275, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _3311 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _3313 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _3311;
    bool _3315 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _3317 = isnan(_647);
    bool _3319 = _3315 || _3317;
    bool _3321 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _3323 = _3319 || _3321;
    float _3325 = float(_3323);
    float _3327 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _3329 = _3327 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _3331 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _3333 = isnan(_647);
    bool _3335 = _3331 || _3333;
    bool _3337 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _3339 = _3335 || _3337;
    float _3341 = float(_3339);
    float _3343 = _3259 * _3269;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _3349 = fma(_3313, _3275, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _3351 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _3353 = _3351 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _3355 = -_3305;
    float _3357 = _3355 + 1.0;
    float _3359 = fma(_3347, _3251, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _3361 = fma(_3329, _3251, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _3363 = fma(_3353, _3251, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _3365 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _3367 = isnan(_647);
    bool _3369 = _3365 || _3367;
    bool _3371 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _3373 = _3369 || _3371;
    float _3375 = float(_3373);
    float _3377 = _3325 * _3357;
    bool _3379 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _3381 = isnan(_647);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _3387 = _3383 || _3385;
    float _3389 = float(_3387);
    float _3391 = -_3325;
    float _3393 = _3391 + 1.0;
    float _3395 = -_3341;
    float _3397 = _3395 + 1.0;
    float _3399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3401 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _3403 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _3401;
    float _3405 = _3375 * _3393;
    float _3407 = _3389 * _3397;
    float _3409 = -_3375;
    float _3411 = _3409 + 1.0;
    float _3413 = -_3389;
    float _3415 = _3413 + 1.0;
    int _3417 = ~_3133;
    int _3419 = _3417 + _3225;
    int _3421 = _3419 + 1;
    float _3423 = _3349 * _3407;
    float _3425 = _3341 * _3411;
    float _3427 = _3309 * _3407;
    float _3429 = _3293 * _3407;
    float _3431 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _3431;
    float _3435 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _3437 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _3435;
    float _3439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3441 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _3443 = _3441 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _3445 = fma(_3433, _3307, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _3447 = fma(_3437, _3307, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _3449 = fma(_3403, _3307, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _3451 = fma(_3415, (*spvDescriptorSet0.vp_c9)._m0[123].x, _3423);
    float _3453 = fma(_3415, (*spvDescriptorSet0.vp_c9)._m0[123].y, _3427);
    float _3455 = fma(_3415, (*spvDescriptorSet0.vp_c9)._m0[123].z, _3429);
    float _3457 = fma(_3443, _3343, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _3459 = _1275 * (-0.15915493667125701904296875);
    float _3461 = fma(_3361, _3425, _3453);
    float _3463 = fma(_3359, _3425, _3451);
    float _3465 = fma(_3363, _3425, _3455);
    float _3467 = _3399 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3469 = fma(_3447, _3405, _3461);
    float _3471 = _3459 * 6.283185482025146484375;
    float _3473 = sin(_3471);
    float _3475 = fma(_3445, _3405, _3463);
    float _3477 = fma(_3449, _3405, _3465);
    float _3479 = _2741 + 0.5;
    float _3481 = _3439 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3483 = _3051 + (-0.5);
    float _3485 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _3487 = _3485 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _3489 = fma(_3467, _3479, _889);
    float _3491 = _3459 * 6.283185482025146484375;
    float _3493 = cos(_3491);
    float _3495 = -_3481;
    float _3497 = -_1153;
    float _3499 = fma(_3495, _3483, _3497);
    float _3501 = -_1007;
    float _3503 = _3501 + 1.0;
    int _3505 = _3089 >> 31;
    float _3507 = _985 + (-0.5);
    float _3509 = fma(_2194, _3051, _3499);
    float _3511 = -_3503;
    float _3513 = fma(_3511, _2741, _3489);
    int _3515 = _3505 & 3;
    float _3517 = _3101 * _3473;
    float _3519 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _3521 = _3519 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _3523 = fma(_3487, _3343, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    int _3525 = _3089 + _3515;
    out.m_68.x = _3513;
    out.m_68.y = _3509;
    float _3527 = -_3507;
    float _3529 = -_1323;
    float _3531 = fma(_3527, (*spvDescriptorSet0.vp_c9)._m0[90].y, _3529);
    float _3533 = fma(_3521, _3343, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _3535 = _3525 >> 2;
    float _3537 = _3101 * _3493;
    float _3539 = -_3517;
    float _3541 = fma(_3267, _3493, _3539);
    float _3543 = fma(_985, _2200, _3531);
    float _3545 = fma(_3457, _3377, _3475);
    float _3547 = fma(_3267, _3473, _3537);
    int _3549 = _3535 << 4;
    int _3551 = _3549 + 512;
    float _3553 = _3541 + 0.5;
    float _3555 = fma(_3523, _3377, _3469);
    float _3557 = fma(_3533, _3377, _3477);
    uint _3559 = uint(int(uint(_3551) >> uint(2)));
    uint _3561 = uint(int(uint(int(_3559)) >> uint(2)));
    int _3563 = int(_3559) & 3;
    float _3565 = (*spvDescriptorSet0.vp_c9)._m0[int(_3561)][_3563];
    int _3567 = int(_3559) + 1;
    uint _3569 = uint(int(uint(_3567) >> uint(2)));
    int _3571 = _3567 & 3;
    float _3573 = (*spvDescriptorSet0.vp_c9)._m0[int(_3569)][_3571];
    float _3575 = fma(_3553, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1213);
    float _3577 = _991 + 0.5;
    float _3579 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[127].x, _3545);
    float _3581 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[127].y, _3555);
    float _3583 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[127].z, _3557);
    float _3585 = fma(_3577, (*spvDescriptorSet0.vp_c9)._m0[90].x, _1321);
    float _3587 = _3579 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3589 = _3551 + 8;
    uint _3591 = uint(int(uint(_3589) >> uint(2)));
    uint _3593 = uint(int(uint(int(_3591)) >> uint(2)));
    int _3595 = int(_3591) & 3;
    float _3597 = (*spvDescriptorSet0.vp_c9)._m0[int(_3593)][_3595];
    int _3599 = int(_3591) + 1;
    uint _3601 = uint(int(uint(_3599) >> uint(2)));
    int _3603 = _3599 & 3;
    float _3605 = (*spvDescriptorSet0.vp_c9)._m0[int(_3601)][_3603];
    float _3607 = _3581 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3609 = _3583 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3611 = _3587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3613 = -_2210;
    float _3615 = fma(_991, _3613, _3585);
    float _3617 = _3607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3619 = _3609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3621 = _3547 + (-0.5);
    int _3623 = ~_3037;
    int _3625 = _3623 + _3111;
    int _3627 = _3625 + 1;
    out.m_70.x = _3615;
    out.m_70.y = _3543;
    int _3629 = abs(_3155);
    float _3631 = -_3621;
    float _3633 = -_893;
    float _3635 = fma(_3631, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3633);
    float _3637 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_72.x = _3611;
    out.m_72.y = _3617;
    out.m_72.z = _3619;
    int _3639 = _2180 * _3627;
    int _3641 = _3639 + _2501;
    int _3643 = ~_3165;
    int _3645 = _3643 + _3237;
    int _3647 = _3645 + 1;
    float _3649 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3651 = ~_3137;
    int _3653 = _3651 + _3241;
    int _3655 = _3653 + 1;
    float _3657 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3659 = !_2497;
    int _3661 = _3659 ? _3641 : (-1);
    int _3663 = _2274 * _3655;
    int _3665 = _3663 + _2823;
    float _3667 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3657);
    float _3669 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3671 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3673 = _2204 * _3421;
    int _3675 = _3673 + _2551;
    float _3677 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3679 = -_1489;
    float _3681 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3637);
    float _3683 = -_1489;
    float _3685 = fma(_3683, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3671);
    float _3687 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3689 = -_1489;
    float _3691 = fma(_3689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3677);
    float _3693 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3681);
    int _3695 = abs(_3151);
    float _3697 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3687);
    float _3699 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3701 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3669);
    int _3703 = ~_3695;
    int _3705 = _3703 + 1;
    int _3707 = _3705 + 1;
    float _3709 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3711 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3699);
    float _3713 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3685);
    int _3715 = _3707 * as_type<int>(_3573);
    int _3717 = abs(_3199);
    float _3719 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3721 = ~_3629;
    int _3723 = _3721 + 1;
    int _3725 = _3723 + 1;
    float _3727 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3729 = int(_3727);
    float _3731 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3709);
    float _3733 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3719);
    float _3735 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3711);
    int _3737 = _3725 * as_type<int>(_3565);
    int _3739 = _3737 + _3715;
    int _3741 = ~_3717;
    int _3743 = _3741 + 1;
    int _3745 = _3743 + 1;
    float _3747 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3701);
    float _3749 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3731);
    int _3751 = _2274 * _3647;
    int _3753 = _3751 + _2923;
    int _3755 = _3027 >> 31;
    int _3757 = _3745 * as_type<int>(_3597);
    int _3759 = _3757 + _3739;
    bool _3761 = !_3279;
    int _3763 = _3761 ? 0 : 1;
    float _3765 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3691);
    int _3767 = abs(_3263);
    bool _3769 = uint(_3055) >= 2u;
    int _3771 = abs(_3763);
    int _3773 = ~_3767;
    int _3775 = _3773 + 1;
    int _3777 = _3775 + 1;
    int _3779 = _3769 ? 0 : 1;
    bool _3781 = !_2679;
    int _3783 = _3781 ? _3753 : (-1);
    int _3785 = _3777 * as_type<int>(_3605);
    int _3787 = _3785 + _3759;
    bool _3789 = _3055 != 3;
    int _3791 = ~_3771;
    int _3793 = _3791 + 1;
    int _3795 = _3793 + 1;
    int _3797 = _3755 & 3;
    int _3799 = abs(_3729);
    int _3801 = _3787 * _3795;
    int _3803 = _3783 >> 31;
    int _3805 = _3027 + _3797;
    float _3807 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3809 = float(uint(_3799));
    int _3811 = _3803 & 3;
    float _3813 = float(uint(_3729));
    float _3815 = 1.0 / _3809;
    int _3817 = _3805 >> 2;
    int _3819 = _3783 + _3811;
    float _3821 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3667);
    int _3823 = ~_3779;
    int _3825 = _3823 + 1;
    int _3827 = _3825 + 1;
    int _3829 = _3827;
    if (_3789)
    {
        int _3831 = ~_3779;
        int _3833 = _3831 + 1;
        _3829 = _3833;
    }
    int _3835 = _3829;
    float _3837 = 1.0 / _3813;
    bool _3839 = !_2519;
    int _3841 = _3839 ? _3675 : (-1);
    float _3843 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3697);
    int _3845 = _3819 >> 2;
    int _3847 = _3783 & 3;
    bool _3849 = _3847 != 0;
    int _3851 = _3841 * _3771;
    int _3853 = _3851 + _3801;
    int _3855 = _3845 << 4;
    int _3857 = _3855 + 656;
    int _3859 = _3817 << 4;
    int _3861 = _3859 + 368;
    float _3863 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3733);
    uint _3865 = uint(int(uint(_3857) >> uint(2)));
    uint _3867 = uint(int(uint(int(_3865)) >> uint(2)));
    int _3869 = int(_3865) & 3;
    float _3871 = (*spvDescriptorSet0.vp_c9)._m0[int(_3867)][_3869];
    int _3873 = int(_3865) + 1;
    uint _3875 = uint(int(uint(_3873) >> uint(2)));
    int _3877 = _3873 & 3;
    float _3879 = (*spvDescriptorSet0.vp_c9)._m0[int(_3875)][_3877];
    int _3881 = _3783 & 3;
    bool _3883 = _3881 != 0;
    float _3885 = _3807 * _3713;
    int _3887 = abs(_3853);
    out.m_74.x = _3843;
    out.m_74.y = _3821;
    out.m_74.z = _3863;
    int _3889 = _3849 ? 0 : 1;
    float _3891 = fma(_3649, _3843, _3885);
    int _3893 = as_type<int>(_3815) + (-2);
    uint _3895 = uint(int(uint(_3861) >> uint(2)));
    uint _3897 = uint(int(uint(int(_3895)) >> uint(2)));
    int _3899 = int(_3895) & 3;
    float _3901 = (*spvDescriptorSet0.vp_c9)._m0[int(_3897)][_3899];
    int _3903 = int(_3895) + 1;
    uint _3905 = uint(int(uint(_3903) >> uint(2)));
    int _3907 = _3903 & 3;
    float _3909 = (*spvDescriptorSet0.vp_c9)._m0[int(_3905)][_3907];
    bool _3911 = uint(_3881) > 1u;
    float _3913 = _3735 + _3891;
    float _3915 = _3807 * _3765;
    int _3917 = as_type<int>(_3837) + (-2);
    float _3919 = float(uint(_3887));
    float _3921 = float(uint(_3853));
    int _3923 = ~_3889;
    int _3925 = _3923 + 1;
    int _3927 = _3925 + 1;
    float _3929 = as_type<float>(_3893) * _3919;
    float _3931 = fma(_3649, _3863, _3915);
    int _3933 = _3927;
    if (!_3911)
    {
        int _3935 = ~_3889;
        int _3937 = _3935 + 1;
        _3933 = _3937;
    }
    int _3939 = _3933;
    int _3941 = _3861 + 8;
    uint _3943 = uint(int(uint(_3941) >> uint(2)));
    uint _3945 = uint(int(uint(int(_3943)) >> uint(2)));
    int _3947 = int(_3943) & 3;
    float _3949 = (*spvDescriptorSet0.vp_c9)._m0[int(_3945)][_3947];
    int _3951 = int(_3943) + 1;
    uint _3953 = uint(int(uint(_3951) >> uint(2)));
    int _3955 = _3951 & 3;
    float _3957 = (*spvDescriptorSet0.vp_c9)._m0[int(_3953)][_3955];
    float _3959 = _3807 * _3693;
    bool _3961 = !_3057;
    int _3963 = _3961 ? 0 : 1;
    float _3965 = as_type<float>(_3917) * _3921;
    bool _3967 = _3881 != 3;
    float _3969 = trunc(_3929);
    float _3971 = precise::max(_3969, 0.0);
    uint _3973 = uint(_3971);
    bool _3975 = uint(_3881) >= 2u;
    float _3977 = fma(_3649, _3821, _3959);
    float _3979 = fma(_3807, _3807, 1.0);
    int _3981 = ~_3799;
    int _3983 = _3981 + 1;
    int _3985 = _3975 ? 0 : 1;
    float _3987 = trunc(_3965);
    float _3989 = precise::max(_3987, 0.0);
    uint _3991 = uint(_3989);
    bool _3993 = _3055 != 3;
    int _3995 = ~_3985;
    int _3997 = _3995 + 1;
    int _3999 = _3997 + 1;
    int _4001 = abs(_3939);
    int _4003 = _3999;
    if (_3967)
    {
        int _4005 = ~_3985;
        int _4007 = _4005 + 1;
        _4003 = _4007;
    }
    int _4009 = _4003;
    float _4011 = rsqrt(_3979);
    int _4013 = _3857 + 8;
    uint _4015 = uint(int(uint(_4013) >> uint(2)));
    uint _4017 = uint(int(uint(int(_4015)) >> uint(2)));
    int _4019 = int(_4015) & 3;
    float _4021 = (*spvDescriptorSet0.vp_c9)._m0[int(_4017)][_4019];
    int _4023 = int(_4015) + 1;
    uint _4025 = uint(int(uint(_4023) >> uint(2)));
    int _4027 = _4023 & 3;
    float _4029 = (*spvDescriptorSet0.vp_c9)._m0[int(_4025)][_4027];
    int _4031 = ~_3729;
    int _4033 = _4031 + 1;
    int _4035 = abs(_3127);
    int _4037 = _3983 * int(_3973);
    int _4039 = _4037 + _3887;
    int _4041 = abs(_3963);
    int _4043 = _4033 * int(_3991);
    int _4045 = _4043 + _3853;
    int _4047 = ~_4035;
    int _4049 = _4047 + 1;
    int _4051 = _4049 + 1;
    int _4053 = ~_4041;
    int _4055 = _4053 + 1;
    int _4057 = _4055 + 1;
    int _4059 = ~_4001;
    int _4061 = _4059 + 1;
    int _4063 = _4061 + 1;
    int _4065 = _4051 * as_type<int>(_3909);
    float _4067 = float(uint(_4039));
    float _4069 = _3807 * _4011;
    float _4071 = float(uint(_4045));
    int _4073 = _4057 * as_type<int>(_3901);
    int _4075 = _4073 + _4065;
    bool _4077 = !_2679;
    int _4079 = _4077 ? _3665 : (-1);
    int _4081 = _4063 * as_type<int>(_3879);
    float _4083 = as_type<float>(_3893) * _4067;
    float _4085 = -_3735;
    float _4087 = _4069 * _4085;
    float _4089 = as_type<float>(_3917) * _4071;
    bool _4091 = !_3883;
    int _4093 = _4091 ? 0 : 1;
    float _4095 = -_3747;
    float _4097 = _4069 * _4095;
    bool _4099 = !_3993;
    int _4101 = _4099 ? 0 : (-1);
    float _4103 = fma(_4011, _3713, _4087);
    int _4105 = abs(_4093);
    float _4107 = trunc(_4089);
    float _4109 = precise::max(_4107, 0.0);
    uint _4111 = uint(_4109);
    int _4113 = abs(_4101);
    float _4115 = fma(_4011, _3693, _4097);
    int _4117 = abs(_3835);
    float _4119 = -_3749;
    float _4121 = _4069 * _4119;
    int _4123 = ~_4105;
    int _4125 = _4123 + 1;
    int _4127 = _4125 + 1;
    float _4129 = _3747 + _3977;
    float _4131 = trunc(_4083);
    float _4133 = precise::max(_4131, 0.0);
    uint _4135 = uint(_4133);
    int _4137 = ~_4117;
    int _4139 = _4137 + 1;
    int _4141 = _4139 + 1;
    int _4143 = _4127 * as_type<int>(_3871);
    int _4145 = _4143 + _4081;
    int _4147 = ~_4113;
    int _4149 = _4147 + 1;
    int _4151 = _4149 + 1;
    float _4153 = fma(_4011, _3765, _4121);
    bool _4155 = _3881 != 3;
    int _4157 = _4141 * as_type<int>(_3949);
    int _4159 = _4157 + _4075;
    int _4161 = ~_3799;
    int _4163 = _4161 + 1;
    float _4165 = _3749 + _3931;
    bool _4167 = !_4155;
    int _4169 = _4167 ? 0 : (-1);
    int _4171 = _4151 * as_type<int>(_3957);
    int _4173 = _4171 + _4159;
    int _4175 = int(_3991) + int(_4111);
    out.m_76.x = _4103;
    out.m_76.y = _4115;
    out.m_76.z = _4153;
    int _4177 = ~_3729;
    int _4179 = _4177 + 1;
    bool _4181 = !_3273;
    int _4183 = _4181 ? 0 : 1;
    out.m_78.x = _3913;
    out.m_78.y = _4129;
    out.m_78.z = _4165;
    int _4185 = int(_3973) + int(_4135);
    int _4187 = abs(_4009);
    int _4189 = abs(_4169);
    int _4191 = abs(_4183);
    int _4193 = _4179 * _4175;
    int _4195 = _4193 + _3853;
    bool _4197 = !_3287;
    int _4199 = _4197 ? 0 : 1;
    int _4201 = _4163 * _4185;
    int _4203 = _4201 + _3887;
    int _4205 = ~_4187;
    int _4207 = _4205 + 1;
    int _4209 = _4207 + 1;
    int _4211 = abs(_4199);
    int _4213 = _4209 * as_type<int>(_4021);
    int _4215 = _4213 + _4145;
    int _4217 = ~_4191;
    int _4219 = _4217 + 1;
    int _4221 = _4219 + 1;
    int _4223 = ~_4189;
    int _4225 = _4223 + 1;
    int _4227 = _4225 + 1;
    bool _4229 = uint(_4195) >= uint(_3729);
    int _4231 = _4173 * _4221;
    bool _4233 = uint(_4203) >= uint(_3799);
    int _4235 = _4227 * as_type<int>(_4029);
    int _4237 = _4235 + _4215;
    int _4239 = _3853 ^ _3729;
    int _4241 = _3661 * _4191;
    int _4243 = _4241 + _4231;
    bool _4245 = !_4229;
    int _4247 = _4245 ? 0 : (-1);
    float _4249 = _1419 + (-0.5);
    bool _4251 = !_4233;
    int _4253 = _4251 ? 0 : (-1);
    uint _4255 = uint(int(uint(_4239) >> uint(31)));
    float _4257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4259 = ~_4175;
    int _4261 = _4259 + _4247;
    int _4263 = _4261 + 1;
    int _4265 = ~_4253;
    int _4267 = _4185 + _4265;
    int _4269 = _4267 + 1;
    int _4271 = ~int(_4255);
    int _4273 = _4271 + 1;
    int _4275 = _3729 * _4263;
    int _4277 = _4275 + _3853;
    bool _4279 = _3729 == 0;
    float _4281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4283 = _4269 ^ _4273;
    int _4285 = ~_4211;
    int _4287 = _4285 + 1;
    int _4289 = _4287 + 1;
    bool _4291 = _3729 == 0;
    int _4293 = ~_4273;
    int _4295 = _4293 + _4283;
    int _4297 = _4295 + 1;
    int _4299 = _4237 * _4289;
    bool _4301 = !_4279;
    int _4303 = _4301 ? _4277 : (-1);
    float _4305 = _4257 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4307 = !_4291;
    int _4309 = _4307 ? _4297 : (-1);
    int _4311 = _4079 * _4211;
    int _4313 = _4311 + _4299;
    float _4315 = float(_4303);
    float _4317 = _3011 + 0.5;
    float _4319 = float(_4309);
    float _4321 = _4281 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4323 = float(_4243);
    float _4325 = fma(_4305, _4315, _1317);
    float _4327 = -_1297;
    float _4329 = fma(_4321, _4319, _4327);
    float _4331 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2242);
    float _4333 = fma(_4305, _4317, _4325);
    float _4335 = -_1295;
    float _4337 = _4335 + 1.0;
    float _4339 = -_4321;
    float _4341 = fma(_4339, _4249, _4329);
    out.m_80.x = _4323;
    float _4343 = -_2234;
    float _4345 = fma(_3011, _4343, _4333);
    float _4347 = _2405 * _2155;
    float _4349 = _4331 + _2079;
    float _4351 = fma(_1419, _2250, _4341);
    float _4353 = -_2405;
    float _4355 = _4353 + 1.0;
    float _4357 = _2166 * _4347;
    bool _4359 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4361 = isnan(_1859);
    bool _4363 = _4359 || _4361;
    bool _4365 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4367 = _4363 || _4365;
    float _4369 = -_1285;
    float _4371 = _4369 + 1.0;
    float _4373 = float(_4313);
    float _4375 = _2176 * _4347;
    float _4377 = _4349 * 0.5;
    float _4379 = fma(_2172, _4357, _2160);
    float _4381 = fma(_2174, _4357, _2162);
    out.m_80.z = _4373;
    float _4383 = _2166 * _4355;
    float _4385 = -_4337;
    float _4387 = fma(_3541, _4385, _3575);
    float _4389 = fma(_3547, _4371, _3635);
    out.m_82.z = _4377;
    out.m_82.w = _2079;
    float _4391 = _4357;
    float _4393 = _4387;
    float _4395 = _4331;
    float _4397 = _2125;
    if (!_4367)
    {
        _4391 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4399 = _4391;
    float _4401 = fma(_2166, _4375, _2164);
    out.m_84.x = _4387;
    out.m_84.y = _4389;
    out.m_84.z = _4345;
    out.m_84.w = _4351;
    out.m_86.x = _4379;
    out.m_86.y = _4381;
    out.m_86.z = _4401;
    out.m_86.w = _4383;
    out.gl_Position.x = _2125;
    out.gl_Position.y = _2119;
    out.gl_Position.z = _4331;
    out.gl_Position.w = _2079;
    float _4403 = _1833 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4405 = _4399;
    float _4407 = _4399;
    if (!_4367)
    {
        _4393 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4409 = _4393;
    float _4411 = _4409;
    float _4413 = _4409;
    if (!_4367)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4415 = _2479;
    float _4417 = _4415;
    float _4419 = _4415;
    if (!_4367)
    {
        _4395 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4421 = _4395;
    float _4423 = _4421;
    float _4425 = _4421;
    if (!_4367)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4427 = _2481;
    float _4429 = _4427;
    float _4431 = _4427;
    if (!_4367)
    {
        _4397 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4433 = _4397;
    bool _4435 = !_4367;
    float _4437 = _4433;
    float _4439 = _4433;
    if (!_4435)
    {
        bool _4441 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4443 = isnan(_1859);
        bool _4445 = _4441 || _4443;
        bool _4447 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4449 = _4445 || _4447;
        if (!_4449)
        {
            float _4451 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4453 = _1859 + _4451;
            float _4455 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4457 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4455;
            float _4459 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4461 = _4459 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4463 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4465 = _4463 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4467 = 1.0 / _4457;
            float _4469 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4471 = _4469 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4473 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4475 = _4473 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4477 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4479 = _4477 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4481 = _4453 * _4467;
            float _4483 = precise::clamp(_4481, 0.0, 1.0);
            float _4485 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4487 = _4485 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4489 = fma(_4483, _4461, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4491 = fma(_4483, _4465, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4493 = fma(_4483, _4487, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4495 = fma(_4483, _4471, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4497 = fma(_4483, _4475, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4499 = fma(_4483, _4479, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4439 = _4489;
            _4419 = _4497;
            _4431 = _4491;
            _4413 = _4495;
            _4407 = _4493;
            _4425 = _4499;
            _4501 = true;
        }
        else
        {
            bool _4503 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4505 = isnan(_1859);
            bool _4507 = _4503 || _4505;
            bool _4509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4511 = _4507 || _4509;
            if (!_4511)
            {
                _4411 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4513 = _4411;
            _4413 = _4513;
            if (!_4511)
            {
                _4417 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4515 = _4417;
            _4419 = _4515;
            if (!_4511)
            {
                _4423 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4517 = _4423;
            _4425 = _4517;
            if (!_4511)
            {
                _4429 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4519 = _4429;
            _4431 = _4519;
            if (!_4511)
            {
                _4437 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4521 = _4437;
            _4439 = _4521;
            if (!_4511)
            {
                _4405 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4523 = _4405;
            bool _4525 = !_4511;
            _4407 = _4523;
            if (!_4525)
            {
                bool _4527 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4529 = isnan(_1859);
                bool _4531 = _4527 || _4529;
                bool _4533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4535 = _4531 || _4533;
                if (!_4535)
                {
                    float _4537 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4539 = _1859 + _4537;
                    float _4541 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4543 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4541;
                    float _4545 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4547 = _4545 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4549 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4551 = _4549 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4553 = 1.0 / _4543;
                    float _4555 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4557 = _4555 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4559 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4561 = _4559 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4563 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4565 = _4563 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4567 = _4539 * _4553;
                    float _4569 = precise::clamp(_4567, 0.0, 1.0);
                    float _4571 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4573 = _4571 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4575 = fma(_4569, _4547, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4577 = fma(_4569, _4551, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4579 = fma(_4569, _4573, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4581 = fma(_4569, _4557, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4583 = fma(_4569, _4561, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4585 = fma(_4569, _4565, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4439 = _4575;
                    _4419 = _4583;
                    _4431 = _4577;
                    _4413 = _4581;
                    _4407 = _4579;
                    _4425 = _4585;
                    _4501 = true;
                }
                else
                {
                    _4439 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4419 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4431 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4413 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4407 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4425 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4501 = false;
    float _4587 = _4439;
    float _4589 = _4419;
    float _4591 = _4431;
    float _4593 = _4413;
    float _4595 = _4407;
    float _4597 = _4425;
    float _4599 = _4403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4601 = fma(_4129, -0.5, 0.5);
    float _4603 = precise::clamp(_4601, 0.0, 1.0);
    float _4605 = -_4587;
    float _4607 = _4589 + _4605;
    float _4609 = -_4591;
    float _4611 = _4593 + _4609;
    out.m_47.x = _4599;
    float _4613 = fma(_4603, _4607, _4587);
    float _4615 = -_4595;
    float _4617 = _4597 + _4615;
    float _4619 = fma(_4603, _4611, _4591);
    float _4621 = _4613 * 0.586610972881317138671875;
    bool _4623 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4625 = fma(_4603, _4617, _4595);
    out.m_88.x = 0.0;
    float _4627 = fma(_4619, 0.298911988735198974609375, _4621);
    bool _4629 = _1833 > 0.0;
    bool _4631 = isnan(_1833);
    bool _4633 = _4629 || _4631;
    bool _4635 = isnan(0.0);
    bool _4637 = _4633 || _4635;
    float _4639 = fma(_4625, 0.114477999508380889892578125, _4627);
    float _4641 = -_4639;
    float _4643 = _4619 + _4641;
    float _4645 = -_4639;
    float _4647 = _4613 + _4645;
    float _4649 = -_4639;
    float _4651 = _4625 + _4649;
    float _4653 = fma(_4643, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4639);
    float _4655 = fma(_4647, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4639);
    float _4657 = fma(_4651, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4639);
    bool _4659 = !_4623;
    if (!_4659)
    {
        float _4661 = -_1759;
        float _4663 = _4661 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4665 = -_1761;
        float _4667 = _4665 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4669 = -_1763;
        float _4671 = _4669 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4673 = _4663 * _4663;
        float _4675 = fma(_4667, _4667, _4673);
        float _4677 = fma(_4671, _4671, _4675);
        float _4679 = sqrt(_4677);
        float _4681 = rsqrt(_4677);
        float _4683 = -_4679;
        float _4685 = _4683 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4687 = _4685 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4689 = precise::clamp(_4687, 0.0, 1.0);
        float _4691 = _4667 * _4681;
        float _4693 = _4663 * _4681;
        float _4695 = abs(_4689);
        float _4697 = log2(_4695);
        float _4699 = _4671 * _4681;
        float _4701 = _4691 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4703 = _4129 * _4693;
        float _4705 = -_4693;
        float _4707 = -_4701;
        float _4709 = fma(_4705, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4707);
        float _4711 = fma(_3913, _4691, _4703);
        float _4713 = -_4699;
        float _4715 = fma(_4713, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4709);
        float _4717 = fma(_4165, _4699, _4711);
        float _4719 = precise::clamp(_4717, 0.0, 1.0);
        float _4721 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4723 = _4715 + _4721;
        float _4725 = _4697 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4727 = _4723 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4729 = precise::clamp(_4727, 0.0, 1.0);
        float _4731 = exp2(_4725);
        float _4733 = _4731 * _4729;
        float _4735 = _4719 * _4733;
        float _4737 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4739 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4741 = _4735 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _4737;
        out.m_88.y = _4739;
        out.m_88.z = _4741;
    }
    out.m_90.x = _4653;
    out.m_90.y = _4655;
    out.m_90.z = _4657;
    if (_4637)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4743;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

