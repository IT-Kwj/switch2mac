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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2400 = false;
    bool _1495 = false;
    bool _309 = false;
    bool _213 = false;
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
        float _2704 = as_type<float>(_123);
        out.gl_Position.z = _2704;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = -_127;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    bool _145 = _133 >= _129;
    bool _147 = !_143;
    bool _149 = _145 || _147;
    float _151 = _127;
    float _153 = _133;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _151;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2769 = as_type<float>(_159);
        out.gl_Position.z = _2769;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    float _167 = 1.0 / _129;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _133 * _167;
    float _173 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _185 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    bool _191 = !_169;
    float _193 = _185;
    float _211;
    if (!_191)
    {
        float _195 = in.m_57.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _171;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_57.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _171;
    }
    _309 = false;
    float _311 = _307;
    float _313 = as_type<float>(int(gl_VertexIndex));
    float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _317 = log2(_315);
    float _319 = in.m_57.x;
    float _321 = in.m_57.y;
    float _323 = in.m_57.z;
    float _325 = in.m_57.w;
    float _327 = in.m_62.x;
    float _329 = in.m_62.y;
    float _331 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _333 = in.m_48.x;
    float _335 = in.m_48.y;
    float _337 = in.m_48.z;
    float _339 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _331);
    float _341 = _317 * _133;
    int _343 = as_type<int>(_313) & 1;
    bool _345 = _343 != 0;
    int _347 = as_type<int>(_313) & 2;
    bool _349 = _347 != 0;
    float _351 = exp2(_341);
    float _353 = _323 * 2.0;
    bool _355 = _325 > 0.5;
    float _357 = _285 * _327;
    int _359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _361 = _359 != 0;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _365 = _363 != 0;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _369 = _367 != 0;
    float _371 = floor(_353);
    float _373 = _287 * _329;
    float _375 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _377 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _385 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].x, _375);
    float _387 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _389 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _395 = _319 * 2.0;
    float _397 = _321 * 2.0;
    float _399 = 1.0 / _383;
    bool _401 = _371 >= 0.0;
    bool _403 = isnan(_371);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _413 = -_351;
    float _415 = _413 + 1.0;
    float _417 = _357 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _419 = _373 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _421 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _411);
    float _423 = _321 + _323;
    float _425 = 1.0 / _393;
    float _427 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _421);
    float _429 = _423 + (-1.0);
    bool _431 = !_369;
    int _433 = _431 ? 0 : 1;
    float _435 = floor(_395);
    int _437 = _409 ? 0 : 1;
    bool _439 = _371 > 0.0;
    int _441 = ~_437;
    int _443 = _441 + 1;
    int _445 = _443 + 1;
    float _447 = floor(_397);
    float _449 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = _321 + _319;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _461 = abs(_433);
    float _463 = _453 * _425;
    float _465 = _455 + (-1.0);
    int _467 = _445;
    if (!_439)
    {
        int _469 = ~_437;
        int _471 = _469 + 1;
        _467 = _471;
    }
    int _473 = _467;
    float _475 = _459 * _399;
    bool _477 = _435 >= 0.0;
    bool _479 = isnan(_435);
    bool _481 = _477 || _479;
    bool _483 = isnan(0.0);
    bool _485 = _481 || _483;
    float _487 = _323 + _319;
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _491 = rsqrt(_427);
    int _493 = _485 ? 0 : 1;
    float _495 = _487 + (-1.0);
    bool _497 = _447 >= 0.0;
    bool _499 = isnan(_447);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = !_361;
    int _509 = _507 ? 0 : 1;
    float _511 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _513 = _447 > 0.0;
    float _515 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    int _517 = _505 ? 0 : 1;
    float _519 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].z, _387);
    bool _521 = _435 > 0.0;
    float _523 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    float _525 = _519 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _527 = abs(_509);
    bool _529 = !_365;
    int _531 = _529 ? 0 : 1;
    float _533 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _339);
    float _535 = float(_527);
    float _537 = float(_473);
    int _539 = ~_517;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    int _545 = _543;
    float _547 = _525;
    if (!_513)
    {
        int _549 = ~_517;
        int _551 = _549 + 1;
        _545 = _551;
    }
    int _553 = _545;
    int _555 = ~_493;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _563 = 1.0 + _561;
    int _565 = abs(_531);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _311 + _567;
    int _571 = _559;
    if (!_521)
    {
        int _573 = ~_493;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _535 * _537;
    float _581 = in.m_64.x;
    float _583 = in.m_64.y;
    float _585 = in.m_64.z;
    float _587 = 1.0 / _563;
    float _589 = float(_565);
    float _591 = fma(_463, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(1.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    float _603 = _579 * (-2.0);
    float _605 = float(_553);
    bool _607 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _615 = _611 || _613;
    float _617 = float(_461);
    float _619 = float(_577);
    float _621 = _615 ? _415 : 0.0;
    float _623 = _617 * _605;
    bool _625 = _321 > 0.5;
    float _627 = _589 * _619;
    float _629 = _321 + (-0.5);
    if (_601)
    {
        float _631 = _621 * _587;
        _153 = _631;
    }
    float _633 = _153;
    float _635 = fma(_489, _603, _489);
    float _637 = _627 * (-2.0);
    bool _639 = _319 > 0.5;
    float _641 = fma(_603, _581, _581);
    float _643 = _319 + (-0.5);
    float _645 = fma(_449, _637, _449);
    float _647 = _623 * (-2.0);
    float _649 = _491 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _651 = fma(_637, _583, _583);
    float _653 = _491 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _655 = fma(_511, _647, _511);
    float _657 = fma(_647, _585, _585);
    float _659 = _649 * _649;
    float _661 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[196].x, _641);
    bool _663 = !_345;
    float _665 = _663 ? (-0.5) : 0.5;
    float _667 = _491 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _669 = fma(_653, _653, _659);
    float _671 = _323 + (-0.5);
    float _673 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[196].y, _651);
    float _675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _665);
    float _677 = fma(_667, _667, _669);
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[196].z, _657);
    float _681 = _525 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _683 = _417 * _675;
    float _685 = _515 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _687 = fma(_635, _633, _661);
    float _689 = fma(_645, _633, _673);
    float _691 = fma(_655, _633, _679);
    float _693 = _523 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[0].x, _681);
    bool _697 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _699 = isnan(_311);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _533 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _711 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[0].z, _695);
    bool _713 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _715 = isnan(_311);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -_707;
    float _727 = _725 + 1.0;
    float _729 = rsqrt(_677);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _731;
    float _735 = _711 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _737 = _687 * 0.15915493667125701904296875;
    bool _739 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _741 = isnan(_311);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = _723 * _727;
    float _753 = _689 * 0.15915493667125701904296875;
    float _755 = -_735;
    float _757 = _709 + _755;
    float _759 = _691 * 0.15915493667125701904296875;
    float _761 = -_723;
    float _763 = _761 + 1.0;
    bool _765 = !_349;
    float _767 = _765 ? (-0.5) : 0.5;
    float _769 = 1.0 / _733;
    float _771 = -_525;
    float _773 = _771 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _775 = _749 * _763;
    float _777 = abs(_757);
    float _779 = precise::max(_777, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _767);
    float _783 = -_685;
    float _785 = _783 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _787 = _591 * _775;
    float _789 = _773 * _773;
    float _791 = _737 * 6.283185482025146484375;
    float _793 = sin(_791);
    float _795 = _419 * _781;
    float _797 = precise::min(_779, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _799 = fma(_785, _785, _789);
    bool _801 = _735 >= _709;
    bool _803 = isnan(_735);
    bool _805 = _801 || _803;
    bool _807 = isnan(_709);
    bool _809 = _805 || _807;
    float _811 = -_693;
    float _813 = _811 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _815 = _653 * _729;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _819 = _797 + _817;
    float _821 = _737 * 6.283185482025146484375;
    float _823 = cos(_821);
    bool _825 = !_809;
    float _827 = _825 ? 1.0 : (-1.0);
    float _829 = fma(_813, _813, _799);
    float _831 = _819 * _769;
    float _833 = _649 * _729;
    float _835 = _667 * _729;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _839 = _311 + _837;
    float _841 = _827 * _831;
    float _843 = _753 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _835 * _835;
    float _849 = -_749;
    float _851 = _849 + 1.0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _855 = _853 != 0;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _859 = _857 != 0;
    float _861 = _753 * 6.283185482025146484375;
    float _863 = cos(_861);
    float _865 = _759 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _823 * _845;
    float _871 = _793 * _845;
    float _873 = _759 * 6.283185482025146484375;
    float _875 = sin(_873);
    float _877 = _793 * _863;
    float _879 = _823 * _863;
    float _881 = _823 * _867;
    float _883 = _793 * _867;
    float _885 = _863 * _867;
    float _887 = _845 * _867;
    float _889 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _891 = sqrt(_829);
    float _893 = _881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _895 = -_869;
    float _897 = fma(_875, _877, _895);
    float _899 = -_877;
    float _901 = fma(_875, _869, _899);
    float _903 = _881 * _795;
    float _905 = fma(_875, _879, _871);
    float _907 = -_795;
    float _909 = _875 * _907;
    float _911 = _883 * _795;
    float _913 = fma(_875, _871, _879);
    float _915 = fma(_905, _683, _903);
    float _917 = fma(_885, _683, _909);
    float _919 = fma(_897, _683, _911);
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _925 = fma(_901, _889, _915);
    float _927 = fma(_887, _889, _917);
    float _929 = fma(_913, _889, _919);
    float _931 = fma(_171, _923, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _933 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _935 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _937 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _939 = _171 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _933);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _935);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _937);
    float _947 = _939 * _841;
    float _949 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _951 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].z, _943);
    float _953 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].z, _945);
    float _955 = _525 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _959 = _951 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _963 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[2].x, _955);
    float _965 = _525 + _957;
    float _967 = _685 + _959;
    float _969 = _947 * 0.15915493667125701904296875;
    float _971 = _693 + _961;
    float _973 = _965 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _975 = _965 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _977 = _965 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _979 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[2].z, _963);
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[2].x, _973);
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[1].x, _975);
    float _985 = abs(_891);
    float _987 = precise::max(0.0, _985);
    float _989 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[0].x, _977);
    float _991 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[2].z, _981);
    float _993 = _969 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[1].z, _983);
    float _999 = precise::min(_987, 40.0);
    float _1001 = _979 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1003 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1005 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[0].z, _989);
    float _1007 = _997 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1009 = fma(_999, -0.02500000037252902984619140625, 1.0);
    float _1011 = _969 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = -_1003;
    float _1017 = _1015 + _1001;
    float _1019 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1021 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1023 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1025 = fma(_1009, _1017, _1003);
    float _1027 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1029 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1021);
    float _1031 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1023);
    float _1033 = -_995;
    float _1035 = _1033 + 1.0;
    float _1037 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1027);
    float _1039 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1029);
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1031);
    float _1043 = _815 * _1035;
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1037);
    float _1047 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1049 = _835 * _1013;
    float _1051 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1053 = _815 * _1013;
    float _1055 = -_525;
    float _1057 = _1055 + _1047;
    float _1059 = -_1049;
    float _1061 = fma(_833, _1043, _1059);
    float _1063 = fma(_815, _1043, _995);
    float _1065 = -_685;
    float _1067 = _1065 + _1051;
    float _1069 = _833 * _1035;
    float _1071 = _1061 * _1057;
    float _1073 = _833 * _1013;
    float _1075 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1077 = fma(_1035, _847, _995);
    float _1079 = fma(_1063, _1067, _1071);
    float _1081 = fma(_835, _1069, _1053);
    float _1083 = -_1073;
    float _1085 = fma(_835, _1043, _1083);
    float _1087 = fma(_835, _1043, _1073);
    float _1089 = -_693;
    float _1091 = _1089 + _1075;
    float _1093 = _1081 * _1057;
    float _1095 = _881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1097 = fma(_1087, _1091, _1079);
    float _1099 = fma(_1085, _1067, _1093);
    float _1101 = fma(_475, _839, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1103 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[115].x, _787);
    float _1105 = fma(_1077, _1091, _1099);
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1109 = fma(_1097, _931, _685);
    float _1111 = fma(_1105, _931, _693);
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1119 = _1109 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1123 = _1111 + _1121;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1127 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1129 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1131 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1133 = _1119 * _1119;
    float _1135 = _1123 * _1123;
    float _1137 = fma(_1101, _751, _1103);
    float _1139 = _881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_66.x = _1127;
    out.m_66.y = _1129;
    out.m_66.z = _1131;
    out.m_66.w = _1125;
    float _1141 = fma(_833, _1043, _1049);
    float _1143 = fma(_833, _1069, _995);
    float _1145 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1137);
    float _1147 = -_875;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1139);
    float _1151 = -_875;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _1155 = -_875;
    float _1157 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1095);
    float _1159 = -_1053;
    float _1161 = fma(_835, _1069, _1159);
    float _1163 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1149);
    float _1165 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1153);
    float _1167 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1157);
    float _1169 = _901 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1173 = _1171 != 0;
    float _1175 = _1133 + _1135;
    float _1177 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1179 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1181 = _1143 * _1057;
    float _1183 = sqrt(_1175);
    float _1185 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1177);
    float _1187 = _901 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1189 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1179);
    float _1191 = fma(_1141, _1067, _1181);
    float _1193 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1195 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1187);
    float _1197 = _901 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1201 = fma(_1161, _1091, _1191);
    float _1203 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1193);
    float _1205 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1169);
    float _1207 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1197);
    float _1209 = _525 + _1201;
    float _1211 = -_767;
    int _1213 = _355 ? as_type<int>(_1211) : as_type<int>(_767);
    float _1215 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1195);
    bool _1217 = _1183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1221 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1207);
    float _1223 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1205);
    bool _1225 = _323 > 0.5;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1229 = _1207;
    float _1231 = _1067;
    float _1233 = _1091;
    float _1235 = _1133;
    float _1237 = _1135;
    if (!_1217)
    {
        _1229 = _1109;
    }
    float _1239 = _1229;
    float _1241 = _1239;
    if (!_1217)
    {
        _1231 = _1111;
    }
    float _1243 = _1231;
    float _1245 = _1243;
    if (!_1217)
    {
        _1233 = _1209;
    }
    float _1247 = _1233;
    bool _1249 = !_1217;
    float _1251 = _1247;
    if (!_1249)
    {
        float _1253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1257 = _1183 + _1255;
        float _1259 = rsqrt(_1175);
        float _1261 = _1257 * _1253;
        float _1263 = _1209 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = _1261 * 0.15915493667125701904296875;
        float _1267 = _1265 * 6.283185482025146484375;
        float _1269 = sin(_1267);
        float _1271 = _1265 * 6.283185482025146484375;
        float _1273 = cos(_1271);
        float _1275 = fma(_1269, _1263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1277 = _1259 * _1275;
        float _1279 = fma(_1119, _1277, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1281 = _1273 + (-1.0);
        float _1283 = fma(_1123, _1277, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1287 = _1279 + _1285;
        float _1289 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1293 = _1283 + _1291;
        float _1295 = _1287 * _1287;
        float _1297 = fma(_1209, _1273, _1289);
        float _1299 = _1293 * _1293;
        _1251 = _1297;
        _1235 = _1295;
        _1237 = _1299;
        _1241 = _1279;
        _1245 = _1283;
    }
    float _1301 = _1251;
    float _1303 = _1235;
    float _1305 = _1237;
    float _1307 = _1241;
    float _1309 = _1245;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1313 = _1301 + _1311;
    float _1315 = _767 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1317 = -_665;
    int _1319 = _639 ? as_type<int>(_1317) : as_type<int>(_665);
    float _1321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1325 = _1323 != 0;
    float _1327 = fma(_1313, _1313, _1303);
    float _1329 = fma(_1315, _1315, 1.0);
    float _1331 = -_767;
    int _1333 = _625 ? as_type<int>(_1331) : as_type<int>(_767);
    float _1335 = _665 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1337 = !_1325;
    float _1339 = _1337 ? _665 : as_type<float>(_1319);
    float _1341 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1189);
    bool _1343 = !_1173;
    float _1345 = _1343 ? _767 : as_type<float>(_1213);
    float _1347 = rsqrt(_1329);
    float _1349 = -_665;
    int _1351 = _1225 ? as_type<int>(_1349) : as_type<int>(_665);
    float _1353 = _1339 + 0.5;
    bool _1355 = !_855;
    float _1357 = _1355 ? _767 : as_type<float>(_1333);
    float _1359 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1185);
    float _1361 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1203);
    float _1363 = _1315 * _1163;
    bool _1365 = !_859;
    float _1367 = _1365 ? _665 : as_type<float>(_1351);
    float _1369 = _1315 * _1165;
    float _1371 = _1315 * _1167;
    float _1373 = fma(_1335, _1341, _1363);
    float _1375 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1377 = fma(_1335, _1359, _1369);
    float _1379 = fma(_1335, _1361, _1371);
    float _1381 = _1367 + 0.5;
    float _1383 = -_1345;
    float _1385 = _1383 + 0.5;
    float _1387 = _1315 * _1347;
    float _1389 = _1375 * _1199;
    float _1391 = -_1357;
    float _1393 = _1391 + 0.5;
    float _1395 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1397 = -_1215;
    float _1399 = _1387 * _1397;
    float _1401 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1405 = _1327 + _1305;
    float _1407 = fma(_1347, _1163, _1399);
    float _1409 = _1401 * _1321;
    float _1411 = -_1223;
    float _1413 = _1387 * _1411;
    float _1415 = _1403 * _1219;
    float _1417 = -_1221;
    float _1419 = _1387 * _1417;
    float _1421 = _1395 * _1227;
    float _1423 = fma(_1347, _1165, _1413);
    float _1425 = fma(_1347, _1167, _1419);
    float _1427 = sqrt(_1405);
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1435 = _1145 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1439 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1441 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1443 = _1215 + _1373;
    float _1445 = _1223 + _1377;
    float _1447 = _1221 + _1379;
    out.m_68.x = _1389;
    out.m_68.y = _1415;
    out.m_68.z = _1421;
    out.m_68.w = _1409;
    out.m_70.x = _1439;
    out.m_70.y = _1437;
    out.m_70.z = _1441;
    out.m_70.w = _1435;
    bool _1449 = _1427 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1451 = isnan(_1427);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1457 = _1453 || _1455;
    out.m_72.x = _1341;
    out.m_72.y = _1359;
    out.m_72.z = _1361;
    out.m_74.x = _1407;
    out.m_74.y = _1423;
    out.m_74.z = _1425;
    out.m_76.x = _1443;
    out.m_76.y = _1445;
    out.m_76.z = _1447;
    float _1459 = _1377;
    if (!_1457)
    {
        _1459 = 1.0;
    }
    float _1461 = _1459;
    bool _1463 = !_1457;
    float _1465 = _1461;
    if (!_1463)
    {
        bool _1467 = _1427 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1469 = isnan(_1427);
        bool _1471 = _1467 || _1469;
        bool _1473 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1475 = _1471 || _1473;
        if (!_1475)
        {
            float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1479 = _1427 + _1477;
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1489 = 1.0 / _1483;
            float _1491 = _1479 * _1489;
            float _1493 = fma(_1491, _1487, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1465 = _1493;
            _1495 = true;
        }
        else
        {
            bool _1497 = _1427 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1499 = isnan(_1427);
            bool _1501 = _1497 || _1499;
            bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1505 = _1501 || _1503;
            if (!_1505)
            {
                float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1509 = _1427 + _1507;
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1511 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1519 = 1.0 / _1513;
                float _1521 = _1509 * _1519;
                float _1523 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1465 = _1523;
                _1495 = true;
            }
            else
            {
                _1465 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1495 = false;
    float _1525 = _1465;
    float _1527 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1529 = _1301 + _1527;
    float _1531 = _525 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1533 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1535 = _1307 + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1539 = _1309 + _1537;
    float _1541 = fma(_1529, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1543 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1531);
    float _1545 = fma(_1535, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1547 = fma(_1539, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1549 = -_525;
    float _1551 = _1549 + _1541;
    float _1553 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1543);
    float _1555 = -_685;
    float _1557 = _1555 + _1545;
    float _1559 = _525 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1561 = _1551 * _1551;
    float _1563 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1565 = -_693;
    float _1567 = _1565 + _1547;
    float _1569 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1559);
    float _1571 = fma(_1557, _1557, _1561);
    float _1573 = 1.0 / _1563;
    float _1575 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1569);
    float _1577 = fma(_1567, _1567, _1571);
    float _1579 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1581 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(0.5);
    bool _1589 = _1585 || _1587;
    float _1591 = sqrt(_1577);
    float _1593 = _1579 + _1563;
    float _1595 = _1593 * _1573;
    float _1597 = _1595 * 0.5;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1599);
    float _1603 = _1563;
    float _1605 = _1597;
    float _1607 = _1525;
    float _1609 = _1557;
    float _1611 = _1551;
    if (_1589)
    {
        _547 = 1.0;
    }
    float _1613 = _547;
    bool _1615 = _1591 > 0.0;
    float _1617 = 1.0 / _1601;
    float _1619 = _1591;
    float _1621 = _1613;
    if (!_1615)
    {
        _1619 = _1545;
    }
    float _1623 = _1619;
    float _1625 = _1623;
    if (!_1615)
    {
        _1603 = _1541;
    }
    float _1627 = _1603;
    float _1629 = _1627;
    if (!_1615)
    {
        _1605 = _1547;
    }
    float _1631 = _1605;
    bool _1633 = !_1615;
    float _1635 = _1631;
    float _1637 = _1631;
    if (!_1633)
    {
        float _1639 = _187 * _187;
        float _1641 = rsqrt(_1577);
        float _1643 = fma(_185, _185, _1639);
        float _1645 = fma(_189, _189, _1643);
        float _1647 = sqrt(_1645);
        float _1649 = _1557 * _1641;
        float _1651 = _1551 * _1641;
        float _1653 = _1567 * _1641;
        bool _1655 = _1647 > 0.0;
        float _1657 = _1641;
        float _1659 = _1647;
        _1607 = _1649;
        if (!_1655)
        {
            _1657 = _1545;
        }
        float _1661 = _1657;
        _1625 = _1661;
        if (!_1655)
        {
            _1659 = _1541;
        }
        float _1663 = _1659;
        _1629 = _1663;
        if (!_1655)
        {
            _1635 = _1547;
        }
        float _1665 = _1635;
        bool _1667 = !_1655;
        _1637 = _1665;
        if (!_1667)
        {
            float _1669 = rsqrt(_1645);
            float _1671 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1673 = _187 * _1669;
            float _1675 = _185 * _1669;
            float _1677 = _189 * _1669;
            float _1679 = _1651 * _1673;
            float _1681 = fma(_1649, _1675, _1679);
            float _1683 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1685 = fma(_1653, _1677, _1681);
            float _1687 = _1685 * _1683;
            float _1689 = fma(_185, _1687, _1545);
            float _1691 = fma(_187, _1687, _1541);
            float _1693 = fma(_189, _1687, _1547);
            _1629 = _1691;
            _1625 = _1689;
            _1637 = _1693;
        }
    }
    float _1695 = _1607;
    float _1697 = _1629;
    float _1699 = _1625;
    float _1701 = _1637;
    float _1703 = _1695;
    if (_1589)
    {
        _193 = 1.0;
    }
    float _1705 = _193;
    float _1707 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1709 = _1617 * _1707;
    float _1711 = _1705;
    if (!_1589)
    {
        float _1713 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1715 = _1713 * 0.15915493667125701904296875;
        float _1717 = _1715 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1723 = _1721 * 0.15915493667125701904296875;
        float _1725 = _1715 * 6.283185482025146484375;
        float _1727 = sin(_1725);
        float _1729 = 1.0 / _1719;
        float _1731 = _1723 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        float _1735 = _1727 * _1729;
        float _1737 = _1723 * 6.283185482025146484375;
        float _1739 = sin(_1737);
        float _1741 = _1733 * _1735;
        float _1743 = 1.0 / _1741;
        float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1747 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1745;
        float _1749 = 1.0 / _1747;
        float _1751 = _1739 * _1743;
        float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1755 = fma(_1709, _1751, _1753);
        float _1757 = _1755 * _1749;
        float _1759 = precise::clamp(_1757, 0.0, 1.0);
        _1703 = _1723;
        _1621 = _1759;
    }
    float _1761 = _1703;
    float _1763 = _1621;
    float _1765 = _1761;
    if (!_1589)
    {
        float _1767 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1769 = _1767 * 0.15915493667125701904296875;
        float _1771 = _1769 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1777 = _1775 * 0.15915493667125701904296875;
        float _1779 = _1769 * 6.283185482025146484375;
        float _1781 = sin(_1779);
        float _1783 = 1.0 / _1773;
        float _1785 = _1777 * 6.283185482025146484375;
        float _1787 = cos(_1785);
        float _1789 = _1781 * _1783;
        float _1791 = _1777 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        float _1795 = _1787 * _1789;
        float _1797 = 1.0 / _1795;
        float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1801 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1799;
        float _1803 = 1.0 / _1801;
        float _1805 = _1793 * _1797;
        float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1809 = fma(_1709, _1805, _1807);
        float _1811 = _1809 * _1803;
        float _1813 = precise::clamp(_1811, 0.0, 1.0);
        float _1815 = -_1813;
        float _1817 = _1815 + 1.0;
        _1765 = _1797;
        _1711 = _1817;
    }
    float _1819 = _1765;
    float _1821 = _1711;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1825 = _1697 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1829 = _1699 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1833 = _1701 + _1831;
    float _1835 = _1825 * _1825;
    float _1837 = fma(_1829, _1829, _1835);
    float _1839 = fma(_1833, _1833, _1837);
    float _1841 = rsqrt(_1839);
    float _1843 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1845 = _1829 * _1843;
    float _1847 = _1833 * _1843;
    float _1849 = _1845 * _1845;
    float _1851 = _1847 * _1847;
    float _1853 = _1849 + _1851;
    float _1855 = sqrt(_1853);
    bool _1857 = _1855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1861 = _1855 + _1859;
    float _1863 = _1819;
    float _1865 = _1853;
    float _1867 = _1861;
    float _1869 = _1825;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1857)
    {
        float _1873 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1863 = _1873;
    }
    float _1875 = _1863;
    if (_1857)
    {
        float _1877 = rsqrt(_1853);
        _1865 = _1877;
    }
    float _1879 = _1865;
    float _1881 = _1875;
    float _1883 = _1879;
    if (_1857)
    {
        float _1885 = _1861 * _1875;
        _1867 = _1885;
    }
    float _1887 = _1867;
    if (_1857)
    {
        float _1889 = _1887 * 0.15915493667125701904296875;
        _1609 = _1889;
    }
    float _1891 = _1609;
    float _1893 = _1833;
    float _1895 = _1891;
    if (_1857)
    {
        float _1897 = _1891 * 6.283185482025146484375;
        float _1899 = sin(_1897);
        _1893 = _1899;
    }
    float _1901 = _1893;
    float _1903 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1905 = precise::max(0.0, _1903);
    float _1907 = _1541;
    if (_1857)
    {
        float _1909 = _1891 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        _1907 = _1911;
    }
    float _1913 = _1907;
    float _1915 = -_1843;
    float _1917 = -_1905;
    float _1919 = fma(_1825, _1915, _1917);
    float _1921 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1857)
    {
        float _1923 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1869 = _1923;
    }
    float _1925 = _1869;
    float _1927 = _1925;
    if (!_1857)
    {
        _1895 = _1845;
    }
    float _1929 = _1895;
    float _1931 = sqrt(_1839);
    float _1933 = _1901;
    float _1935 = _1929;
    if (_1857)
    {
        float _1937 = fma(_1901, _1925, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1881 = _1937;
    }
    float _1939 = _1881;
    float _1941 = _1939;
    if (!_1857)
    {
        _1933 = _1847;
    }
    float _1943 = _1933;
    float _1945 = _1943;
    if (_1857)
    {
        float _1947 = _1913 + (-1.0);
        _1927 = _1947;
    }
    float _1949 = _1927;
    float _1951 = _1949;
    if (_1857)
    {
        float _1953 = _1879 * _1939;
        _1871 = _1953;
    }
    float _1955 = _1871;
    if (!_1857)
    {
        _1941 = _1919;
    }
    float _1957 = _1941;
    float _1959 = floor(_1921);
    float _1961 = _1957;
    if (_1857)
    {
        float _1963 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1611 = _1963;
    }
    float _1965 = _1611;
    if (_1857)
    {
        float _1967 = _1845 * _1955;
        _1935 = _1967;
    }
    float _1969 = _1935;
    if (!_1857)
    {
        _1883 = _1849;
    }
    float _1971 = _1883;
    float _1973 = _1971;
    if (_1857)
    {
        float _1975 = _1847 * _1955;
        _1945 = _1975;
    }
    float _1977 = _1945;
    if (_1857)
    {
        float _1979 = fma(_1919, _1913, _1965);
        _1961 = _1979;
    }
    float _1981 = _1961;
    if (_1857)
    {
        float _1983 = _1969 * _1969;
        _1973 = _1983;
    }
    float _1985 = _1973;
    if (!_1857)
    {
        _1951 = _1851;
    }
    float _1987 = _1951;
    float _1989 = _1987;
    if (_1857)
    {
        float _1991 = _1977 * _1977;
        _1989 = _1991;
    }
    float _1993 = _1989;
    float _1995 = fma(_1981, _1981, _1985);
    float _1997 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1999 = _1995 + _1993;
    float _2001 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1997);
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2005 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2003);
    float _2007 = precise::clamp(_2005, 0.0, 1.0);
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2011 = rsqrt(_1999);
    float _2013 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2001);
    float _2015 = -_2007;
    float _2017 = _2015 + 1.0;
    float _2019 = -_1959;
    float _2021 = _1921 + _2019;
    float _2023 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2025 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2027 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2029 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2031 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2033 = abs(_2017);
    float _2035 = log2(_2033);
    float _2037 = -_2027;
    float _2039 = fma(_2037, _2009, 1.0);
    float _2041 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2043 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2029);
    float _2045 = _2011 * _1969;
    float _2047 = _2011 * _1981;
    float _2049 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2041);
    float _2051 = _2011 * _1977;
    float _2053 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2031);
    float _2055 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2043);
    float _2057 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2049);
    float _2059 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2061 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2053);
    float _2063 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2065 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2067 = floor(_2025);
    float _2069 = -_2059;
    float _2071 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2069);
    float _2073 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2075 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2079 = -_2051;
    float _2081 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2071);
    float _2083 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2075);
    float _2085 = log2(_2039);
    float _2087 = fma(_2081, -0.5, 0.5);
    float _2089 = fma(_2081, 0.5, 0.5);
    float _2091 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2083);
    float _2093 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2095 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2077);
    float _2097 = fma(_2089, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2099 = exp2(_2073);
    float _2101 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2103 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2093);
    float _2105 = -_2067;
    float _2107 = _2025 + _2105;
    float _2109 = fma(_2089, _2097, -0.212114393711090087890625);
    float _2111 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2091);
    float _2113 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2103);
    float _2115 = _2047 + 1.0;
    float _2117 = sqrt(_2087);
    float2 _5979 = float2(_2021, _2107);
    float _2119 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5979, float2(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5979, float2(0.0), isnan(_5979)), level(0.0)).x;
    float _2121 = fma(_2089, _2109, 1.570728778839111328125);
    float _2123 = 1.0 / _2111;
    float _2125 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2095);
    float _2127 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2113);
    float _2129 = _2085 * 0.693147182464599609375;
    float _2131 = -_2047;
    float _2133 = fma(_2099, _2115, _2131);
    float _2135 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2125);
    float _2137 = _2117 * 0.636619746685028076171875;
    float _2139 = fma(_2133, 0.5, 0.5);
    float _2141 = -_2121;
    float _2143 = fma(_2137, _2141, 1.0);
    float _2145 = _2135 * _2123;
    float _2147 = _2127 * _2123;
    float _2149 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2151 = fma(_2145, 0.5, 0.5);
    float _2153 = fma(_2147, -0.5, 0.5);
    float3 _6044 = float3(_2151, _2153, _2149);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6044, float3(0.0), isnan(_6044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6044, float3(0.0), isnan(_6044)), level(0.0)).x;
    float3 _6055 = float3(_2151, _2153, _2149);
    float4 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6055, float3(0.0), isnan(_6055)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6055, float3(0.0), isnan(_6055)), level(0.0)).xyzw;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2158.w;
    float2 _6071 = float2(_2143, _2139);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6071, float2(0.0), isnan(_6071)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6071, float2(0.0), isnan(_6071)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    float _2178 = abs(_1709);
    float _2180 = log2(_2178);
    float _2182 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _1699;
    out.m_78.y = _1697;
    out.m_78.z = _1701;
    bool _2184 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2186 = isnan(_1931);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2192 = _2188 || _2190;
    float _2194 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2182);
    float _2196 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2194);
    float _2198 = in.m_80.x;
    float _2200 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2196);
    bool _2202 = _1709 <= 8000.0;
    bool _2204 = isnan(_1709);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(8000.0);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2216 = exp2(_2214);
    out.gl_Position.x = _2135;
    out.gl_Position.y = _2127;
    out.gl_Position.z = _2200;
    out.gl_Position.w = _2111;
    float _2218 = _1763 * _1821;
    float _2220 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2222 = precise::clamp(_2220, 0.0, 1.0);
    float _2224 = _2127;
    float _2226 = _2111;
    float _2228 = _2200;
    float _2230 = _2218;
    if (!_2192)
    {
        _2224 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2232 = _2224;
    float _2234 = fma(_2222, -2.0, 3.0);
    float _2236 = _2222 * _2222;
    float _2238 = _2236 * _2234;
    float _2240 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2242 = -_2238;
    float _2244 = _2242 + 1.0;
    float _2246 = exp2(_2240);
    float _2248 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2238);
    float _2250 = _2200 + _2111;
    float _2252 = _2232;
    float _2254 = _2232;
    if (!_2192)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2256 = _2226;
    float _2258 = _2212 * _2248;
    float _2260 = _2250 * 0.5;
    float _2262 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2264 = _2256;
    float _2266 = _2256;
    if (!_2192)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2268 = _2228;
    out.m_82.z = _2260;
    out.m_82.w = _2111;
    float _2270 = -_2246;
    float _2272 = _2270 + 1.0;
    float _2274 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2276 = -_2119;
    float _2278 = _2276 + 1.0;
    float _2280 = _2278 * _2262;
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = -_2282;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2288 = _2286 * _2198;
    float _2290 = _2288 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _2290;
    float _2292 = _2274 * _2155;
    float _2294 = -_2274;
    float _2296 = _2294 + 1.0;
    float _2298 = _2166 * _2292;
    float _2300 = _2176 * _2292;
    float _2302 = _2166 * _2296;
    float _2304 = fma(_2172, _2298, _2160);
    float _2306 = fma(_2174, _2298, _2162);
    float _2308 = fma(_2166, _2300, _2164);
    float _2310 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2312 = _2298;
    float _2314 = _2160;
    float _2316 = _2268;
    float _2318 = _2268;
    if (!_2192)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2320 = _2312;
    float _2322 = _2320;
    float _2324 = _2320;
    if (!_2192)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2326 = _2314;
    out.m_86.x = _2304;
    out.m_86.y = _2306;
    out.m_86.z = _2308;
    out.m_86.w = _2302;
    float _2328 = _2326;
    float _2330 = _2326;
    if (!_2192)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2332 = _2230;
    bool _2334 = !_2192;
    float _2336 = _2332;
    float _2338 = _2332;
    if (!_2334)
    {
        bool _2340 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2342 = isnan(_1931);
        bool _2344 = _2340 || _2342;
        bool _2346 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2348 = _2344 || _2346;
        if (!_2348)
        {
            float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2352 = _1931 + _2350;
            float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2356 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2354;
            float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2362 = 1.0 / _2356;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2380 = _2352 * _2362;
            float _2382 = precise::clamp(_2380, 0.0, 1.0);
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2388 = fma(_2382, _2360, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2390 = fma(_2382, _2386, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2392 = fma(_2382, _2366, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2394 = fma(_2382, _2370, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2396 = fma(_2382, _2374, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2398 = fma(_2382, _2378, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2330 = _2392;
            _2254 = _2396;
            _2324 = _2388;
            _2318 = _2394;
            _2266 = _2390;
            _2338 = _2398;
            _2400 = true;
        }
        else
        {
            bool _2402 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2404 = isnan(_1931);
            bool _2406 = _2402 || _2404;
            bool _2408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2410 = _2406 || _2408;
            if (!_2410)
            {
                _2322 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2412 = _2322;
            _2324 = _2412;
            if (!_2410)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2414 = _2328;
            _2330 = _2414;
            if (!_2410)
            {
                _2264 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2416 = _2264;
            _2266 = _2416;
            if (!_2410)
            {
                _2316 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2418 = _2316;
            _2318 = _2418;
            if (!_2410)
            {
                _2252 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2420 = _2252;
            _2254 = _2420;
            if (!_2410)
            {
                _2336 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2422 = _2336;
            bool _2424 = !_2410;
            _2338 = _2422;
            if (!_2424)
            {
                bool _2426 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2428 = isnan(_1931);
                bool _2430 = _2426 || _2428;
                bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2434 = _2430 || _2432;
                if (!_2434)
                {
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2438 = _1931 + _2436;
                    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2442 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2440;
                    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2448 = 1.0 / _2442;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2466 = _2438 * _2448;
                    float _2468 = precise::clamp(_2466, 0.0, 1.0);
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2474 = fma(_2468, _2446, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2476 = fma(_2468, _2472, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2478 = fma(_2468, _2452, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2480 = fma(_2468, _2456, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2482 = fma(_2468, _2460, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2484 = fma(_2468, _2464, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2330 = _2478;
                    _2254 = _2482;
                    _2324 = _2474;
                    _2318 = _2480;
                    _2266 = _2476;
                    _2338 = _2484;
                    _2400 = true;
                }
                else
                {
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2254 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2324 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2318 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2266 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2338 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2400 = false;
    float _2486 = _2330;
    float _2488 = _2254;
    float _2490 = _2324;
    float _2492 = _2318;
    float _2494 = _2266;
    float _2496 = _2338;
    float _2498 = fma(_1445, -0.5, 0.5);
    float _2500 = precise::clamp(_2498, 0.0, 1.0);
    float _2502 = -_2486;
    float _2504 = _2502 + _2488;
    float _2506 = _2310 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2508 = -_2490;
    float _2510 = _2508 + _2492;
    float _2512 = fma(_2500, _2504, _2486);
    out.m_88.x = 0.0;
    float _2514 = -_2494;
    float _2516 = _2514 + _2496;
    float _2518 = fma(_2500, _2510, _2490);
    float _2520 = _2512 * 0.586610972881317138671875;
    out.m_51.x = _2506;
    bool _2522 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2524 = fma(_2500, _2516, _2494);
    float _2526 = fma(_2518, 0.298911988735198974609375, _2520);
    bool _2528 = _1763 > 0.0;
    bool _2530 = isnan(_1763);
    bool _2532 = _2528 || _2530;
    bool _2534 = isnan(0.0);
    bool _2536 = _2532 || _2534;
    float _2538 = fma(_2524, 0.114477999508380889892578125, _2526);
    bool _2540 = _1821 <= 0.0;
    bool _2542 = !_2536;
    bool _2544 = _2540 || _2542;
    float _2546 = -_2538;
    float _2548 = _2518 + _2546;
    float _2550 = -_2538;
    float _2552 = _2512 + _2550;
    float _2554 = -_2538;
    float _2556 = _2524 + _2554;
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2538);
    float _2560 = fma(_2552, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2538);
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2538);
    bool _2564 = !_2522;
    if (!_2564)
    {
        float _2566 = -_1697;
        float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2570 = -_1699;
        float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2574 = -_1701;
        float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2578 = _2568 * _2568;
        float _2580 = fma(_2572, _2572, _2578);
        float _2582 = fma(_2576, _2576, _2580);
        float _2584 = sqrt(_2582);
        float _2586 = rsqrt(_2582);
        float _2588 = -_2584;
        float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        float _2596 = _2572 * _2586;
        float _2598 = _2568 * _2586;
        float _2600 = abs(_2594);
        float _2602 = log2(_2600);
        float _2604 = _2576 * _2586;
        float _2606 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2608 = _1445 * _2598;
        float _2610 = -_2598;
        float _2612 = -_2606;
        float _2614 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2612);
        float _2616 = fma(_1443, _2596, _2608);
        float _2618 = -_2604;
        float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2614);
        float _2622 = fma(_1447, _2604, _2616);
        float _2624 = precise::clamp(_2622, 0.0, 1.0);
        float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2628 = _2620 + _2626;
        float _2630 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2632 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2634 = precise::clamp(_2632, 0.0, 1.0);
        float _2636 = exp2(_2630);
        float _2638 = _2636 * _2634;
        float _2640 = _2624 * _2638;
        float _2642 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2644 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2646 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2642;
        out.m_88.y = _2644;
        out.m_88.z = _2646;
    }
    out.m_90.x = _2558;
    out.m_90.y = _2560;
    out.m_90.z = _2562;
    if (!_2544)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2648 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2648;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2400 = false;
    bool _1495 = false;
    bool _309 = false;
    bool _213 = false;
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
        float _2704 = as_type<float>(_123);
        out.gl_Position.z = _2704;
    }
    if (!_113)
    {
        return out;
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = -_127;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    bool _145 = _133 >= _129;
    bool _147 = !_143;
    bool _149 = _145 || _147;
    float _151 = _127;
    float _153 = _133;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _151;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2769 = as_type<float>(_159);
        out.gl_Position.z = _2769;
    }
    if (_149)
    {
        return out;
    }
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    float _167 = 1.0 / _129;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _133 * _167;
    float _173 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _185 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    bool _191 = !_169;
    float _193 = _185;
    float _211;
    if (!_191)
    {
        float _195 = in.m_57.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _171;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_57.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _171;
    }
    _309 = false;
    float _311 = _307;
    float _313 = as_type<float>(int(gl_VertexIndex));
    float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _317 = log2(_315);
    float _319 = in.m_57.x;
    float _321 = in.m_57.y;
    float _323 = in.m_57.z;
    float _325 = in.m_57.w;
    float _327 = in.m_62.x;
    float _329 = in.m_62.y;
    float _331 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _333 = in.m_48.x;
    float _335 = in.m_48.y;
    float _337 = in.m_48.z;
    float _339 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _331);
    float _341 = _317 * _133;
    int _343 = as_type<int>(_313) & 1;
    bool _345 = _343 != 0;
    int _347 = as_type<int>(_313) & 2;
    bool _349 = _347 != 0;
    float _351 = exp2(_341);
    float _353 = _323 * 2.0;
    bool _355 = _325 > 0.5;
    float _357 = _285 * _327;
    int _359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _361 = _359 != 0;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _365 = _363 != 0;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _369 = _367 != 0;
    float _371 = floor(_353);
    float _373 = _287 * _329;
    float _375 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _377 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _385 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].x, _375);
    float _387 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _389 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _395 = _319 * 2.0;
    float _397 = _321 * 2.0;
    float _399 = 1.0 / _383;
    bool _401 = _371 >= 0.0;
    bool _403 = isnan(_371);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _413 = -_351;
    float _415 = _413 + 1.0;
    float _417 = _357 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _419 = _373 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _421 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _411);
    float _423 = _321 + _323;
    float _425 = 1.0 / _393;
    float _427 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _421);
    float _429 = _423 + (-1.0);
    bool _431 = !_369;
    int _433 = _431 ? 0 : 1;
    float _435 = floor(_395);
    int _437 = _409 ? 0 : 1;
    bool _439 = _371 > 0.0;
    int _441 = ~_437;
    int _443 = _441 + 1;
    int _445 = _443 + 1;
    float _447 = floor(_397);
    float _449 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = _321 + _319;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _461 = abs(_433);
    float _463 = _453 * _425;
    float _465 = _455 + (-1.0);
    int _467 = _445;
    if (!_439)
    {
        int _469 = ~_437;
        int _471 = _469 + 1;
        _467 = _471;
    }
    int _473 = _467;
    float _475 = _459 * _399;
    bool _477 = _435 >= 0.0;
    bool _479 = isnan(_435);
    bool _481 = _477 || _479;
    bool _483 = isnan(0.0);
    bool _485 = _481 || _483;
    float _487 = _323 + _319;
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _491 = rsqrt(_427);
    int _493 = _485 ? 0 : 1;
    float _495 = _487 + (-1.0);
    bool _497 = _447 >= 0.0;
    bool _499 = isnan(_447);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = !_361;
    int _509 = _507 ? 0 : 1;
    float _511 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _513 = _447 > 0.0;
    float _515 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    int _517 = _505 ? 0 : 1;
    float _519 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].z, _387);
    bool _521 = _435 > 0.0;
    float _523 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    float _525 = _519 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _527 = abs(_509);
    bool _529 = !_365;
    int _531 = _529 ? 0 : 1;
    float _533 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _339);
    float _535 = float(_527);
    float _537 = float(_473);
    int _539 = ~_517;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    int _545 = _543;
    float _547 = _525;
    if (!_513)
    {
        int _549 = ~_517;
        int _551 = _549 + 1;
        _545 = _551;
    }
    int _553 = _545;
    int _555 = ~_493;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _563 = 1.0 + _561;
    int _565 = abs(_531);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _311 + _567;
    int _571 = _559;
    if (!_521)
    {
        int _573 = ~_493;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _535 * _537;
    float _581 = in.m_64.x;
    float _583 = in.m_64.y;
    float _585 = in.m_64.z;
    float _587 = 1.0 / _563;
    float _589 = float(_565);
    float _591 = fma(_463, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(1.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    float _603 = _579 * (-2.0);
    float _605 = float(_553);
    bool _607 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _615 = _611 || _613;
    float _617 = float(_461);
    float _619 = float(_577);
    float _621 = _615 ? _415 : 0.0;
    float _623 = _617 * _605;
    bool _625 = _321 > 0.5;
    float _627 = _589 * _619;
    float _629 = _321 + (-0.5);
    if (_601)
    {
        float _631 = _621 * _587;
        _153 = _631;
    }
    float _633 = _153;
    float _635 = fma(_489, _603, _489);
    float _637 = _627 * (-2.0);
    bool _639 = _319 > 0.5;
    float _641 = fma(_603, _581, _581);
    float _643 = _319 + (-0.5);
    float _645 = fma(_449, _637, _449);
    float _647 = _623 * (-2.0);
    float _649 = _491 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _651 = fma(_637, _583, _583);
    float _653 = _491 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _655 = fma(_511, _647, _511);
    float _657 = fma(_647, _585, _585);
    float _659 = _649 * _649;
    float _661 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[196].x, _641);
    bool _663 = !_345;
    float _665 = _663 ? (-0.5) : 0.5;
    float _667 = _491 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _669 = fma(_653, _653, _659);
    float _671 = _323 + (-0.5);
    float _673 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[196].y, _651);
    float _675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _665);
    float _677 = fma(_667, _667, _669);
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[196].z, _657);
    float _681 = _525 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _683 = _417 * _675;
    float _685 = _515 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _687 = fma(_635, _633, _661);
    float _689 = fma(_645, _633, _673);
    float _691 = fma(_655, _633, _679);
    float _693 = _523 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[0].x, _681);
    bool _697 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _699 = isnan(_311);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _533 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _711 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[0].z, _695);
    bool _713 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _715 = isnan(_311);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -_707;
    float _727 = _725 + 1.0;
    float _729 = rsqrt(_677);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _731;
    float _735 = _711 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _737 = _687 * 0.15915493667125701904296875;
    bool _739 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _741 = isnan(_311);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = _723 * _727;
    float _753 = _689 * 0.15915493667125701904296875;
    float _755 = -_735;
    float _757 = _709 + _755;
    float _759 = _691 * 0.15915493667125701904296875;
    float _761 = -_723;
    float _763 = _761 + 1.0;
    bool _765 = !_349;
    float _767 = _765 ? (-0.5) : 0.5;
    float _769 = 1.0 / _733;
    float _771 = -_525;
    float _773 = _771 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _775 = _749 * _763;
    float _777 = abs(_757);
    float _779 = precise::max(_777, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _767);
    float _783 = -_685;
    float _785 = _783 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _787 = _591 * _775;
    float _789 = _773 * _773;
    float _791 = _737 * 6.283185482025146484375;
    float _793 = sin(_791);
    float _795 = _419 * _781;
    float _797 = precise::min(_779, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _799 = fma(_785, _785, _789);
    bool _801 = _735 >= _709;
    bool _803 = isnan(_735);
    bool _805 = _801 || _803;
    bool _807 = isnan(_709);
    bool _809 = _805 || _807;
    float _811 = -_693;
    float _813 = _811 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _815 = _653 * _729;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _819 = _797 + _817;
    float _821 = _737 * 6.283185482025146484375;
    float _823 = cos(_821);
    bool _825 = !_809;
    float _827 = _825 ? 1.0 : (-1.0);
    float _829 = fma(_813, _813, _799);
    float _831 = _819 * _769;
    float _833 = _649 * _729;
    float _835 = _667 * _729;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _839 = _311 + _837;
    float _841 = _827 * _831;
    float _843 = _753 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _835 * _835;
    float _849 = -_749;
    float _851 = _849 + 1.0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _855 = _853 != 0;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _859 = _857 != 0;
    float _861 = _753 * 6.283185482025146484375;
    float _863 = cos(_861);
    float _865 = _759 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _823 * _845;
    float _871 = _793 * _845;
    float _873 = _759 * 6.283185482025146484375;
    float _875 = sin(_873);
    float _877 = _793 * _863;
    float _879 = _823 * _863;
    float _881 = _823 * _867;
    float _883 = _793 * _867;
    float _885 = _863 * _867;
    float _887 = _845 * _867;
    float _889 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _891 = sqrt(_829);
    float _893 = _881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _895 = -_869;
    float _897 = fma(_875, _877, _895);
    float _899 = -_877;
    float _901 = fma(_875, _869, _899);
    float _903 = _881 * _795;
    float _905 = fma(_875, _879, _871);
    float _907 = -_795;
    float _909 = _875 * _907;
    float _911 = _883 * _795;
    float _913 = fma(_875, _871, _879);
    float _915 = fma(_905, _683, _903);
    float _917 = fma(_885, _683, _909);
    float _919 = fma(_897, _683, _911);
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _925 = fma(_901, _889, _915);
    float _927 = fma(_887, _889, _917);
    float _929 = fma(_913, _889, _919);
    float _931 = fma(_171, _923, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _933 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _935 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _937 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _939 = _171 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _933);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _935);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _937);
    float _947 = _939 * _841;
    float _949 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _951 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].z, _943);
    float _953 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].z, _945);
    float _955 = _525 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _959 = _951 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _963 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[2].x, _955);
    float _965 = _525 + _957;
    float _967 = _685 + _959;
    float _969 = _947 * 0.15915493667125701904296875;
    float _971 = _693 + _961;
    float _973 = _965 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _975 = _965 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _977 = _965 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _979 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[2].z, _963);
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[2].x, _973);
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[1].x, _975);
    float _985 = abs(_891);
    float _987 = precise::max(0.0, _985);
    float _989 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[0].x, _977);
    float _991 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[2].z, _981);
    float _993 = _969 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[1].z, _983);
    float _999 = precise::min(_987, 40.0);
    float _1001 = _979 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1003 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1005 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[0].z, _989);
    float _1007 = _997 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1009 = fma(_999, -0.02500000037252902984619140625, 1.0);
    float _1011 = _969 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = -_1003;
    float _1017 = _1015 + _1001;
    float _1019 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1021 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1023 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1025 = fma(_1009, _1017, _1003);
    float _1027 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1029 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1021);
    float _1031 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1023);
    float _1033 = -_995;
    float _1035 = _1033 + 1.0;
    float _1037 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1027);
    float _1039 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1029);
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1031);
    float _1043 = _815 * _1035;
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1037);
    float _1047 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1049 = _835 * _1013;
    float _1051 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1053 = _815 * _1013;
    float _1055 = -_525;
    float _1057 = _1055 + _1047;
    float _1059 = -_1049;
    float _1061 = fma(_833, _1043, _1059);
    float _1063 = fma(_815, _1043, _995);
    float _1065 = -_685;
    float _1067 = _1065 + _1051;
    float _1069 = _833 * _1035;
    float _1071 = _1061 * _1057;
    float _1073 = _833 * _1013;
    float _1075 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1077 = fma(_1035, _847, _995);
    float _1079 = fma(_1063, _1067, _1071);
    float _1081 = fma(_835, _1069, _1053);
    float _1083 = -_1073;
    float _1085 = fma(_835, _1043, _1083);
    float _1087 = fma(_835, _1043, _1073);
    float _1089 = -_693;
    float _1091 = _1089 + _1075;
    float _1093 = _1081 * _1057;
    float _1095 = _881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1097 = fma(_1087, _1091, _1079);
    float _1099 = fma(_1085, _1067, _1093);
    float _1101 = fma(_475, _839, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1103 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[115].x, _787);
    float _1105 = fma(_1077, _1091, _1099);
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1109 = fma(_1097, _931, _685);
    float _1111 = fma(_1105, _931, _693);
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1119 = _1109 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1123 = _1111 + _1121;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1127 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1129 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1131 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1133 = _1119 * _1119;
    float _1135 = _1123 * _1123;
    float _1137 = fma(_1101, _751, _1103);
    float _1139 = _881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_66.x = _1127;
    out.m_66.y = _1129;
    out.m_66.z = _1131;
    out.m_66.w = _1125;
    float _1141 = fma(_833, _1043, _1049);
    float _1143 = fma(_833, _1069, _995);
    float _1145 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1137);
    float _1147 = -_875;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1139);
    float _1151 = -_875;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _1155 = -_875;
    float _1157 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1095);
    float _1159 = -_1053;
    float _1161 = fma(_835, _1069, _1159);
    float _1163 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1149);
    float _1165 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1153);
    float _1167 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1157);
    float _1169 = _901 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1173 = _1171 != 0;
    float _1175 = _1133 + _1135;
    float _1177 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1179 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1181 = _1143 * _1057;
    float _1183 = sqrt(_1175);
    float _1185 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1177);
    float _1187 = _901 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1189 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1179);
    float _1191 = fma(_1141, _1067, _1181);
    float _1193 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1195 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1187);
    float _1197 = _901 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1201 = fma(_1161, _1091, _1191);
    float _1203 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1193);
    float _1205 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1169);
    float _1207 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1197);
    float _1209 = _525 + _1201;
    float _1211 = -_767;
    int _1213 = _355 ? as_type<int>(_1211) : as_type<int>(_767);
    float _1215 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1195);
    bool _1217 = _1183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1221 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1207);
    float _1223 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1205);
    bool _1225 = _323 > 0.5;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1229 = _1207;
    float _1231 = _1067;
    float _1233 = _1091;
    float _1235 = _1133;
    float _1237 = _1135;
    if (!_1217)
    {
        _1229 = _1109;
    }
    float _1239 = _1229;
    float _1241 = _1239;
    if (!_1217)
    {
        _1231 = _1111;
    }
    float _1243 = _1231;
    float _1245 = _1243;
    if (!_1217)
    {
        _1233 = _1209;
    }
    float _1247 = _1233;
    bool _1249 = !_1217;
    float _1251 = _1247;
    if (!_1249)
    {
        float _1253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1257 = _1183 + _1255;
        float _1259 = rsqrt(_1175);
        float _1261 = _1257 * _1253;
        float _1263 = _1209 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = _1261 * 0.15915493667125701904296875;
        float _1267 = _1265 * 6.283185482025146484375;
        float _1269 = sin(_1267);
        float _1271 = _1265 * 6.283185482025146484375;
        float _1273 = cos(_1271);
        float _1275 = fma(_1269, _1263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1277 = _1259 * _1275;
        float _1279 = fma(_1119, _1277, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1281 = _1273 + (-1.0);
        float _1283 = fma(_1123, _1277, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1287 = _1279 + _1285;
        float _1289 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1293 = _1283 + _1291;
        float _1295 = _1287 * _1287;
        float _1297 = fma(_1209, _1273, _1289);
        float _1299 = _1293 * _1293;
        _1251 = _1297;
        _1235 = _1295;
        _1237 = _1299;
        _1241 = _1279;
        _1245 = _1283;
    }
    float _1301 = _1251;
    float _1303 = _1235;
    float _1305 = _1237;
    float _1307 = _1241;
    float _1309 = _1245;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1313 = _1301 + _1311;
    float _1315 = _767 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1317 = -_665;
    int _1319 = _639 ? as_type<int>(_1317) : as_type<int>(_665);
    float _1321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1325 = _1323 != 0;
    float _1327 = fma(_1313, _1313, _1303);
    float _1329 = fma(_1315, _1315, 1.0);
    float _1331 = -_767;
    int _1333 = _625 ? as_type<int>(_1331) : as_type<int>(_767);
    float _1335 = _665 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1337 = !_1325;
    float _1339 = _1337 ? _665 : as_type<float>(_1319);
    float _1341 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1189);
    bool _1343 = !_1173;
    float _1345 = _1343 ? _767 : as_type<float>(_1213);
    float _1347 = rsqrt(_1329);
    float _1349 = -_665;
    int _1351 = _1225 ? as_type<int>(_1349) : as_type<int>(_665);
    float _1353 = _1339 + 0.5;
    bool _1355 = !_855;
    float _1357 = _1355 ? _767 : as_type<float>(_1333);
    float _1359 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1185);
    float _1361 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1203);
    float _1363 = _1315 * _1163;
    bool _1365 = !_859;
    float _1367 = _1365 ? _665 : as_type<float>(_1351);
    float _1369 = _1315 * _1165;
    float _1371 = _1315 * _1167;
    float _1373 = fma(_1335, _1341, _1363);
    float _1375 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1377 = fma(_1335, _1359, _1369);
    float _1379 = fma(_1335, _1361, _1371);
    float _1381 = _1367 + 0.5;
    float _1383 = -_1345;
    float _1385 = _1383 + 0.5;
    float _1387 = _1315 * _1347;
    float _1389 = _1375 * _1199;
    float _1391 = -_1357;
    float _1393 = _1391 + 0.5;
    float _1395 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1397 = -_1215;
    float _1399 = _1387 * _1397;
    float _1401 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1405 = _1327 + _1305;
    float _1407 = fma(_1347, _1163, _1399);
    float _1409 = _1401 * _1321;
    float _1411 = -_1223;
    float _1413 = _1387 * _1411;
    float _1415 = _1403 * _1219;
    float _1417 = -_1221;
    float _1419 = _1387 * _1417;
    float _1421 = _1395 * _1227;
    float _1423 = fma(_1347, _1165, _1413);
    float _1425 = fma(_1347, _1167, _1419);
    float _1427 = sqrt(_1405);
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1435 = _1145 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1439 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1441 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1443 = _1215 + _1373;
    float _1445 = _1223 + _1377;
    float _1447 = _1221 + _1379;
    out.m_68.x = _1389;
    out.m_68.y = _1415;
    out.m_68.z = _1421;
    out.m_68.w = _1409;
    out.m_70.x = _1439;
    out.m_70.y = _1437;
    out.m_70.z = _1441;
    out.m_70.w = _1435;
    bool _1449 = _1427 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1451 = isnan(_1427);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1457 = _1453 || _1455;
    out.m_72.x = _1341;
    out.m_72.y = _1359;
    out.m_72.z = _1361;
    out.m_74.x = _1407;
    out.m_74.y = _1423;
    out.m_74.z = _1425;
    out.m_76.x = _1443;
    out.m_76.y = _1445;
    out.m_76.z = _1447;
    float _1459 = _1377;
    if (!_1457)
    {
        _1459 = 1.0;
    }
    float _1461 = _1459;
    bool _1463 = !_1457;
    float _1465 = _1461;
    if (!_1463)
    {
        bool _1467 = _1427 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1469 = isnan(_1427);
        bool _1471 = _1467 || _1469;
        bool _1473 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1475 = _1471 || _1473;
        if (!_1475)
        {
            float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1479 = _1427 + _1477;
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1489 = 1.0 / _1483;
            float _1491 = _1479 * _1489;
            float _1493 = fma(_1491, _1487, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1465 = _1493;
            _1495 = true;
        }
        else
        {
            bool _1497 = _1427 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1499 = isnan(_1427);
            bool _1501 = _1497 || _1499;
            bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1505 = _1501 || _1503;
            if (!_1505)
            {
                float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1509 = _1427 + _1507;
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1511 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1519 = 1.0 / _1513;
                float _1521 = _1509 * _1519;
                float _1523 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1465 = _1523;
                _1495 = true;
            }
            else
            {
                _1465 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1495 = false;
    float _1525 = _1465;
    float _1527 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1529 = _1301 + _1527;
    float _1531 = _525 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1533 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1535 = _1307 + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1539 = _1309 + _1537;
    float _1541 = fma(_1529, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1543 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1531);
    float _1545 = fma(_1535, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1547 = fma(_1539, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1549 = -_525;
    float _1551 = _1549 + _1541;
    float _1553 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1543);
    float _1555 = -_685;
    float _1557 = _1555 + _1545;
    float _1559 = _525 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1561 = _1551 * _1551;
    float _1563 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1565 = -_693;
    float _1567 = _1565 + _1547;
    float _1569 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1559);
    float _1571 = fma(_1557, _1557, _1561);
    float _1573 = 1.0 / _1563;
    float _1575 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1569);
    float _1577 = fma(_1567, _1567, _1571);
    float _1579 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1581 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(0.5);
    bool _1589 = _1585 || _1587;
    float _1591 = sqrt(_1577);
    float _1593 = _1579 + _1563;
    float _1595 = _1593 * _1573;
    float _1597 = _1595 * 0.5;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1599);
    float _1603 = _1563;
    float _1605 = _1597;
    float _1607 = _1525;
    float _1609 = _1557;
    float _1611 = _1551;
    if (_1589)
    {
        _547 = 1.0;
    }
    float _1613 = _547;
    bool _1615 = _1591 > 0.0;
    float _1617 = 1.0 / _1601;
    float _1619 = _1591;
    float _1621 = _1613;
    if (!_1615)
    {
        _1619 = _1545;
    }
    float _1623 = _1619;
    float _1625 = _1623;
    if (!_1615)
    {
        _1603 = _1541;
    }
    float _1627 = _1603;
    float _1629 = _1627;
    if (!_1615)
    {
        _1605 = _1547;
    }
    float _1631 = _1605;
    bool _1633 = !_1615;
    float _1635 = _1631;
    float _1637 = _1631;
    if (!_1633)
    {
        float _1639 = _187 * _187;
        float _1641 = rsqrt(_1577);
        float _1643 = fma(_185, _185, _1639);
        float _1645 = fma(_189, _189, _1643);
        float _1647 = sqrt(_1645);
        float _1649 = _1557 * _1641;
        float _1651 = _1551 * _1641;
        float _1653 = _1567 * _1641;
        bool _1655 = _1647 > 0.0;
        float _1657 = _1641;
        float _1659 = _1647;
        _1607 = _1649;
        if (!_1655)
        {
            _1657 = _1545;
        }
        float _1661 = _1657;
        _1625 = _1661;
        if (!_1655)
        {
            _1659 = _1541;
        }
        float _1663 = _1659;
        _1629 = _1663;
        if (!_1655)
        {
            _1635 = _1547;
        }
        float _1665 = _1635;
        bool _1667 = !_1655;
        _1637 = _1665;
        if (!_1667)
        {
            float _1669 = rsqrt(_1645);
            float _1671 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1673 = _187 * _1669;
            float _1675 = _185 * _1669;
            float _1677 = _189 * _1669;
            float _1679 = _1651 * _1673;
            float _1681 = fma(_1649, _1675, _1679);
            float _1683 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1685 = fma(_1653, _1677, _1681);
            float _1687 = _1685 * _1683;
            float _1689 = fma(_185, _1687, _1545);
            float _1691 = fma(_187, _1687, _1541);
            float _1693 = fma(_189, _1687, _1547);
            _1629 = _1691;
            _1625 = _1689;
            _1637 = _1693;
        }
    }
    float _1695 = _1607;
    float _1697 = _1629;
    float _1699 = _1625;
    float _1701 = _1637;
    float _1703 = _1695;
    if (_1589)
    {
        _193 = 1.0;
    }
    float _1705 = _193;
    float _1707 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1709 = _1617 * _1707;
    float _1711 = _1705;
    if (!_1589)
    {
        float _1713 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1715 = _1713 * 0.15915493667125701904296875;
        float _1717 = _1715 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1723 = _1721 * 0.15915493667125701904296875;
        float _1725 = _1715 * 6.283185482025146484375;
        float _1727 = sin(_1725);
        float _1729 = 1.0 / _1719;
        float _1731 = _1723 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        float _1735 = _1727 * _1729;
        float _1737 = _1723 * 6.283185482025146484375;
        float _1739 = sin(_1737);
        float _1741 = _1733 * _1735;
        float _1743 = 1.0 / _1741;
        float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1747 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1745;
        float _1749 = 1.0 / _1747;
        float _1751 = _1739 * _1743;
        float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1755 = fma(_1709, _1751, _1753);
        float _1757 = _1755 * _1749;
        float _1759 = precise::clamp(_1757, 0.0, 1.0);
        _1703 = _1723;
        _1621 = _1759;
    }
    float _1761 = _1703;
    float _1763 = _1621;
    float _1765 = _1761;
    if (!_1589)
    {
        float _1767 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1769 = _1767 * 0.15915493667125701904296875;
        float _1771 = _1769 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1777 = _1775 * 0.15915493667125701904296875;
        float _1779 = _1769 * 6.283185482025146484375;
        float _1781 = sin(_1779);
        float _1783 = 1.0 / _1773;
        float _1785 = _1777 * 6.283185482025146484375;
        float _1787 = cos(_1785);
        float _1789 = _1781 * _1783;
        float _1791 = _1777 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        float _1795 = _1787 * _1789;
        float _1797 = 1.0 / _1795;
        float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1801 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1799;
        float _1803 = 1.0 / _1801;
        float _1805 = _1793 * _1797;
        float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1809 = fma(_1709, _1805, _1807);
        float _1811 = _1809 * _1803;
        float _1813 = precise::clamp(_1811, 0.0, 1.0);
        float _1815 = -_1813;
        float _1817 = _1815 + 1.0;
        _1765 = _1797;
        _1711 = _1817;
    }
    float _1819 = _1765;
    float _1821 = _1711;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1825 = _1697 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1829 = _1699 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1833 = _1701 + _1831;
    float _1835 = _1825 * _1825;
    float _1837 = fma(_1829, _1829, _1835);
    float _1839 = fma(_1833, _1833, _1837);
    float _1841 = rsqrt(_1839);
    float _1843 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1845 = _1829 * _1843;
    float _1847 = _1833 * _1843;
    float _1849 = _1845 * _1845;
    float _1851 = _1847 * _1847;
    float _1853 = _1849 + _1851;
    float _1855 = sqrt(_1853);
    bool _1857 = _1855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1861 = _1855 + _1859;
    float _1863 = _1819;
    float _1865 = _1853;
    float _1867 = _1861;
    float _1869 = _1825;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1857)
    {
        float _1873 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1863 = _1873;
    }
    float _1875 = _1863;
    if (_1857)
    {
        float _1877 = rsqrt(_1853);
        _1865 = _1877;
    }
    float _1879 = _1865;
    float _1881 = _1875;
    float _1883 = _1879;
    if (_1857)
    {
        float _1885 = _1861 * _1875;
        _1867 = _1885;
    }
    float _1887 = _1867;
    if (_1857)
    {
        float _1889 = _1887 * 0.15915493667125701904296875;
        _1609 = _1889;
    }
    float _1891 = _1609;
    float _1893 = _1833;
    float _1895 = _1891;
    if (_1857)
    {
        float _1897 = _1891 * 6.283185482025146484375;
        float _1899 = sin(_1897);
        _1893 = _1899;
    }
    float _1901 = _1893;
    float _1903 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1905 = precise::max(0.0, _1903);
    float _1907 = _1541;
    if (_1857)
    {
        float _1909 = _1891 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        _1907 = _1911;
    }
    float _1913 = _1907;
    float _1915 = -_1843;
    float _1917 = -_1905;
    float _1919 = fma(_1825, _1915, _1917);
    float _1921 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1857)
    {
        float _1923 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1869 = _1923;
    }
    float _1925 = _1869;
    float _1927 = _1925;
    if (!_1857)
    {
        _1895 = _1845;
    }
    float _1929 = _1895;
    float _1931 = sqrt(_1839);
    float _1933 = _1901;
    float _1935 = _1929;
    if (_1857)
    {
        float _1937 = fma(_1901, _1925, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1881 = _1937;
    }
    float _1939 = _1881;
    float _1941 = _1939;
    if (!_1857)
    {
        _1933 = _1847;
    }
    float _1943 = _1933;
    float _1945 = _1943;
    if (_1857)
    {
        float _1947 = _1913 + (-1.0);
        _1927 = _1947;
    }
    float _1949 = _1927;
    float _1951 = _1949;
    if (_1857)
    {
        float _1953 = _1879 * _1939;
        _1871 = _1953;
    }
    float _1955 = _1871;
    if (!_1857)
    {
        _1941 = _1919;
    }
    float _1957 = _1941;
    float _1959 = floor(_1921);
    float _1961 = _1957;
    if (_1857)
    {
        float _1963 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1611 = _1963;
    }
    float _1965 = _1611;
    if (_1857)
    {
        float _1967 = _1845 * _1955;
        _1935 = _1967;
    }
    float _1969 = _1935;
    if (!_1857)
    {
        _1883 = _1849;
    }
    float _1971 = _1883;
    float _1973 = _1971;
    if (_1857)
    {
        float _1975 = _1847 * _1955;
        _1945 = _1975;
    }
    float _1977 = _1945;
    if (_1857)
    {
        float _1979 = fma(_1919, _1913, _1965);
        _1961 = _1979;
    }
    float _1981 = _1961;
    if (_1857)
    {
        float _1983 = _1969 * _1969;
        _1973 = _1983;
    }
    float _1985 = _1973;
    if (!_1857)
    {
        _1951 = _1851;
    }
    float _1987 = _1951;
    float _1989 = _1987;
    if (_1857)
    {
        float _1991 = _1977 * _1977;
        _1989 = _1991;
    }
    float _1993 = _1989;
    float _1995 = fma(_1981, _1981, _1985);
    float _1997 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1999 = _1995 + _1993;
    float _2001 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1997);
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2005 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2003);
    float _2007 = precise::clamp(_2005, 0.0, 1.0);
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2011 = rsqrt(_1999);
    float _2013 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2001);
    float _2015 = -_2007;
    float _2017 = _2015 + 1.0;
    float _2019 = -_1959;
    float _2021 = _1921 + _2019;
    float _2023 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2025 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2027 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2029 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2031 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2033 = abs(_2017);
    float _2035 = log2(_2033);
    float _2037 = -_2027;
    float _2039 = fma(_2037, _2009, 1.0);
    float _2041 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2043 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2029);
    float _2045 = _2011 * _1969;
    float _2047 = _2011 * _1981;
    float _2049 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2041);
    float _2051 = _2011 * _1977;
    float _2053 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2031);
    float _2055 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2043);
    float _2057 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2049);
    float _2059 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2061 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2053);
    float _2063 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2065 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2067 = floor(_2025);
    float _2069 = -_2059;
    float _2071 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2069);
    float _2073 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2075 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2079 = -_2051;
    float _2081 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2071);
    float _2083 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2075);
    float _2085 = log2(_2039);
    float _2087 = fma(_2081, -0.5, 0.5);
    float _2089 = fma(_2081, 0.5, 0.5);
    float _2091 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2083);
    float _2093 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2095 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2077);
    float _2097 = fma(_2089, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2099 = exp2(_2073);
    float _2101 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2103 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2093);
    float _2105 = -_2067;
    float _2107 = _2025 + _2105;
    float _2109 = fma(_2089, _2097, -0.212114393711090087890625);
    float _2111 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2091);
    float _2113 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2103);
    float _2115 = _2047 + 1.0;
    float _2117 = sqrt(_2087);
    float2 _5979 = float2(_2021, _2107);
    float _2119 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5979, float2(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5979, float2(0.0), isnan(_5979)), level(0.0)).x;
    float _2121 = fma(_2089, _2109, 1.570728778839111328125);
    float _2123 = 1.0 / _2111;
    float _2125 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2095);
    float _2127 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2113);
    float _2129 = _2085 * 0.693147182464599609375;
    float _2131 = -_2047;
    float _2133 = fma(_2099, _2115, _2131);
    float _2135 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2125);
    float _2137 = _2117 * 0.636619746685028076171875;
    float _2139 = fma(_2133, 0.5, 0.5);
    float _2141 = -_2121;
    float _2143 = fma(_2137, _2141, 1.0);
    float _2145 = _2135 * _2123;
    float _2147 = _2127 * _2123;
    float _2149 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2151 = fma(_2145, 0.5, 0.5);
    float _2153 = fma(_2147, -0.5, 0.5);
    float3 _6044 = float3(_2151, _2153, _2149);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6044, float3(0.0), isnan(_6044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6044, float3(0.0), isnan(_6044)), level(0.0)).x;
    float3 _6055 = float3(_2151, _2153, _2149);
    float4 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6055, float3(0.0), isnan(_6055)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6055, float3(0.0), isnan(_6055)), level(0.0)).xyzw;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2158.w;
    float2 _6071 = float2(_2143, _2139);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6071, float2(0.0), isnan(_6071)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6071, float2(0.0), isnan(_6071)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    float _2178 = abs(_1709);
    float _2180 = log2(_2178);
    float _2182 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _1699;
    out.m_78.y = _1697;
    out.m_78.z = _1701;
    bool _2184 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2186 = isnan(_1931);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2192 = _2188 || _2190;
    float _2194 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2182);
    float _2196 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2194);
    float _2198 = in.m_80.x;
    float _2200 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2196);
    bool _2202 = _1709 <= 8000.0;
    bool _2204 = isnan(_1709);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(8000.0);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2216 = exp2(_2214);
    out.gl_Position.x = _2135;
    out.gl_Position.y = _2127;
    out.gl_Position.z = _2200;
    out.gl_Position.w = _2111;
    float _2218 = _1763 * _1821;
    float _2220 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2222 = precise::clamp(_2220, 0.0, 1.0);
    float _2224 = _2127;
    float _2226 = _2111;
    float _2228 = _2200;
    float _2230 = _2218;
    if (!_2192)
    {
        _2224 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2232 = _2224;
    float _2234 = fma(_2222, -2.0, 3.0);
    float _2236 = _2222 * _2222;
    float _2238 = _2236 * _2234;
    float _2240 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2242 = -_2238;
    float _2244 = _2242 + 1.0;
    float _2246 = exp2(_2240);
    float _2248 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2238);
    float _2250 = _2200 + _2111;
    float _2252 = _2232;
    float _2254 = _2232;
    if (!_2192)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2256 = _2226;
    float _2258 = _2212 * _2248;
    float _2260 = _2250 * 0.5;
    float _2262 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2264 = _2256;
    float _2266 = _2256;
    if (!_2192)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2268 = _2228;
    out.m_82.z = _2260;
    out.m_82.w = _2111;
    float _2270 = -_2246;
    float _2272 = _2270 + 1.0;
    float _2274 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2276 = -_2119;
    float _2278 = _2276 + 1.0;
    float _2280 = _2278 * _2262;
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = -_2282;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2288 = _2286 * _2198;
    float _2290 = _2288 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _2290;
    float _2292 = _2274 * _2155;
    float _2294 = -_2274;
    float _2296 = _2294 + 1.0;
    float _2298 = _2166 * _2292;
    float _2300 = _2176 * _2292;
    float _2302 = _2166 * _2296;
    float _2304 = fma(_2172, _2298, _2160);
    float _2306 = fma(_2174, _2298, _2162);
    float _2308 = fma(_2166, _2300, _2164);
    float _2310 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2312 = _2298;
    float _2314 = _2160;
    float _2316 = _2268;
    float _2318 = _2268;
    if (!_2192)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2320 = _2312;
    float _2322 = _2320;
    float _2324 = _2320;
    if (!_2192)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2326 = _2314;
    out.m_86.x = _2304;
    out.m_86.y = _2306;
    out.m_86.z = _2308;
    out.m_86.w = _2302;
    float _2328 = _2326;
    float _2330 = _2326;
    if (!_2192)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2332 = _2230;
    bool _2334 = !_2192;
    float _2336 = _2332;
    float _2338 = _2332;
    if (!_2334)
    {
        bool _2340 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2342 = isnan(_1931);
        bool _2344 = _2340 || _2342;
        bool _2346 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2348 = _2344 || _2346;
        if (!_2348)
        {
            float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2352 = _1931 + _2350;
            float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2356 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2354;
            float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2362 = 1.0 / _2356;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2380 = _2352 * _2362;
            float _2382 = precise::clamp(_2380, 0.0, 1.0);
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2388 = fma(_2382, _2360, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2390 = fma(_2382, _2386, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2392 = fma(_2382, _2366, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2394 = fma(_2382, _2370, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2396 = fma(_2382, _2374, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2398 = fma(_2382, _2378, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2330 = _2392;
            _2254 = _2396;
            _2324 = _2388;
            _2318 = _2394;
            _2266 = _2390;
            _2338 = _2398;
            _2400 = true;
        }
        else
        {
            bool _2402 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2404 = isnan(_1931);
            bool _2406 = _2402 || _2404;
            bool _2408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2410 = _2406 || _2408;
            if (!_2410)
            {
                _2322 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2412 = _2322;
            _2324 = _2412;
            if (!_2410)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2414 = _2328;
            _2330 = _2414;
            if (!_2410)
            {
                _2264 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2416 = _2264;
            _2266 = _2416;
            if (!_2410)
            {
                _2316 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2418 = _2316;
            _2318 = _2418;
            if (!_2410)
            {
                _2252 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2420 = _2252;
            _2254 = _2420;
            if (!_2410)
            {
                _2336 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2422 = _2336;
            bool _2424 = !_2410;
            _2338 = _2422;
            if (!_2424)
            {
                bool _2426 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2428 = isnan(_1931);
                bool _2430 = _2426 || _2428;
                bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2434 = _2430 || _2432;
                if (!_2434)
                {
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2438 = _1931 + _2436;
                    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2442 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2440;
                    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2448 = 1.0 / _2442;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2466 = _2438 * _2448;
                    float _2468 = precise::clamp(_2466, 0.0, 1.0);
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2474 = fma(_2468, _2446, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2476 = fma(_2468, _2472, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2478 = fma(_2468, _2452, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2480 = fma(_2468, _2456, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2482 = fma(_2468, _2460, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2484 = fma(_2468, _2464, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2330 = _2478;
                    _2254 = _2482;
                    _2324 = _2474;
                    _2318 = _2480;
                    _2266 = _2476;
                    _2338 = _2484;
                    _2400 = true;
                }
                else
                {
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2254 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2324 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2318 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2266 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2338 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2400 = false;
    float _2486 = _2330;
    float _2488 = _2254;
    float _2490 = _2324;
    float _2492 = _2318;
    float _2494 = _2266;
    float _2496 = _2338;
    float _2498 = fma(_1445, -0.5, 0.5);
    float _2500 = precise::clamp(_2498, 0.0, 1.0);
    float _2502 = -_2486;
    float _2504 = _2502 + _2488;
    float _2506 = _2310 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2508 = -_2490;
    float _2510 = _2508 + _2492;
    float _2512 = fma(_2500, _2504, _2486);
    out.m_88.x = 0.0;
    float _2514 = -_2494;
    float _2516 = _2514 + _2496;
    float _2518 = fma(_2500, _2510, _2490);
    float _2520 = _2512 * 0.586610972881317138671875;
    out.m_51.x = _2506;
    bool _2522 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2524 = fma(_2500, _2516, _2494);
    float _2526 = fma(_2518, 0.298911988735198974609375, _2520);
    bool _2528 = _1763 > 0.0;
    bool _2530 = isnan(_1763);
    bool _2532 = _2528 || _2530;
    bool _2534 = isnan(0.0);
    bool _2536 = _2532 || _2534;
    float _2538 = fma(_2524, 0.114477999508380889892578125, _2526);
    bool _2540 = _1821 <= 0.0;
    bool _2542 = !_2536;
    bool _2544 = _2540 || _2542;
    float _2546 = -_2538;
    float _2548 = _2518 + _2546;
    float _2550 = -_2538;
    float _2552 = _2512 + _2550;
    float _2554 = -_2538;
    float _2556 = _2524 + _2554;
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2538);
    float _2560 = fma(_2552, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2538);
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2538);
    bool _2564 = !_2522;
    if (!_2564)
    {
        float _2566 = -_1697;
        float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2570 = -_1699;
        float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2574 = -_1701;
        float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2578 = _2568 * _2568;
        float _2580 = fma(_2572, _2572, _2578);
        float _2582 = fma(_2576, _2576, _2580);
        float _2584 = sqrt(_2582);
        float _2586 = rsqrt(_2582);
        float _2588 = -_2584;
        float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        float _2596 = _2572 * _2586;
        float _2598 = _2568 * _2586;
        float _2600 = abs(_2594);
        float _2602 = log2(_2600);
        float _2604 = _2576 * _2586;
        float _2606 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2608 = _1445 * _2598;
        float _2610 = -_2598;
        float _2612 = -_2606;
        float _2614 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2612);
        float _2616 = fma(_1443, _2596, _2608);
        float _2618 = -_2604;
        float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2614);
        float _2622 = fma(_1447, _2604, _2616);
        float _2624 = precise::clamp(_2622, 0.0, 1.0);
        float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2628 = _2620 + _2626;
        float _2630 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2632 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2634 = precise::clamp(_2632, 0.0, 1.0);
        float _2636 = exp2(_2630);
        float _2638 = _2636 * _2634;
        float _2640 = _2624 * _2638;
        float _2642 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2644 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2646 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2642;
        out.m_88.y = _2644;
        out.m_88.z = _2646;
    }
    out.m_90.x = _2558;
    out.m_90.y = _2560;
    out.m_90.z = _2562;
    if (!_2544)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2648 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2648;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2400 = false;
    bool _1495 = false;
    bool _309 = false;
    bool _213 = false;
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
        float _2704 = as_type<float>(_123);
        out.gl_Position.z = _2704;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = -_127;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    bool _145 = _133 >= _129;
    bool _147 = !_143;
    bool _149 = _145 || _147;
    float _151 = _127;
    float _153 = _133;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _151;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2769 = as_type<float>(_159);
        out.gl_Position.z = _2769;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    float _167 = 1.0 / _129;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _133 * _167;
    float _173 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _185 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    bool _191 = !_169;
    float _193 = _185;
    float _211;
    if (!_191)
    {
        float _195 = in.m_57.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _171;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_57.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _171;
    }
    _309 = false;
    float _311 = _307;
    float _313 = as_type<float>(int(gl_VertexIndex));
    float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _317 = log2(_315);
    float _319 = in.m_57.x;
    float _321 = in.m_57.y;
    float _323 = in.m_57.z;
    float _325 = in.m_57.w;
    float _327 = in.m_62.x;
    float _329 = in.m_62.y;
    float _331 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _333 = in.m_48.x;
    float _335 = in.m_48.y;
    float _337 = in.m_48.z;
    float _339 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _331);
    float _341 = _317 * _133;
    int _343 = as_type<int>(_313) & 1;
    bool _345 = _343 != 0;
    int _347 = as_type<int>(_313) & 2;
    bool _349 = _347 != 0;
    float _351 = exp2(_341);
    float _353 = _323 * 2.0;
    bool _355 = _325 > 0.5;
    float _357 = _285 * _327;
    int _359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _361 = _359 != 0;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _365 = _363 != 0;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _369 = _367 != 0;
    float _371 = floor(_353);
    float _373 = _287 * _329;
    float _375 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _377 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _385 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].x, _375);
    float _387 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _389 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _395 = _319 * 2.0;
    float _397 = _321 * 2.0;
    float _399 = 1.0 / _383;
    bool _401 = _371 >= 0.0;
    bool _403 = isnan(_371);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _413 = -_351;
    float _415 = _413 + 1.0;
    float _417 = _357 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _419 = _373 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _421 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _411);
    float _423 = _321 + _323;
    float _425 = 1.0 / _393;
    float _427 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _421);
    float _429 = _423 + (-1.0);
    bool _431 = !_369;
    int _433 = _431 ? 0 : 1;
    float _435 = floor(_395);
    int _437 = _409 ? 0 : 1;
    bool _439 = _371 > 0.0;
    int _441 = ~_437;
    int _443 = _441 + 1;
    int _445 = _443 + 1;
    float _447 = floor(_397);
    float _449 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = _321 + _319;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _461 = abs(_433);
    float _463 = _453 * _425;
    float _465 = _455 + (-1.0);
    int _467 = _445;
    if (!_439)
    {
        int _469 = ~_437;
        int _471 = _469 + 1;
        _467 = _471;
    }
    int _473 = _467;
    float _475 = _459 * _399;
    bool _477 = _435 >= 0.0;
    bool _479 = isnan(_435);
    bool _481 = _477 || _479;
    bool _483 = isnan(0.0);
    bool _485 = _481 || _483;
    float _487 = _323 + _319;
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _491 = rsqrt(_427);
    int _493 = _485 ? 0 : 1;
    float _495 = _487 + (-1.0);
    bool _497 = _447 >= 0.0;
    bool _499 = isnan(_447);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = !_361;
    int _509 = _507 ? 0 : 1;
    float _511 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _513 = _447 > 0.0;
    float _515 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    int _517 = _505 ? 0 : 1;
    float _519 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].z, _387);
    bool _521 = _435 > 0.0;
    float _523 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    float _525 = _519 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _527 = abs(_509);
    bool _529 = !_365;
    int _531 = _529 ? 0 : 1;
    float _533 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _339);
    float _535 = float(_527);
    float _537 = float(_473);
    int _539 = ~_517;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    int _545 = _543;
    float _547 = _525;
    if (!_513)
    {
        int _549 = ~_517;
        int _551 = _549 + 1;
        _545 = _551;
    }
    int _553 = _545;
    int _555 = ~_493;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _563 = 1.0 + _561;
    int _565 = abs(_531);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _311 + _567;
    int _571 = _559;
    if (!_521)
    {
        int _573 = ~_493;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _535 * _537;
    float _581 = in.m_64.x;
    float _583 = in.m_64.y;
    float _585 = in.m_64.z;
    float _587 = 1.0 / _563;
    float _589 = float(_565);
    float _591 = fma(_463, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(1.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    float _603 = _579 * (-2.0);
    float _605 = float(_553);
    bool _607 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _615 = _611 || _613;
    float _617 = float(_461);
    float _619 = float(_577);
    float _621 = _615 ? _415 : 0.0;
    float _623 = _617 * _605;
    bool _625 = _321 > 0.5;
    float _627 = _589 * _619;
    float _629 = _321 + (-0.5);
    if (_601)
    {
        float _631 = _621 * _587;
        _153 = _631;
    }
    float _633 = _153;
    float _635 = fma(_489, _603, _489);
    float _637 = _627 * (-2.0);
    bool _639 = _319 > 0.5;
    float _641 = fma(_603, _581, _581);
    float _643 = _319 + (-0.5);
    float _645 = fma(_449, _637, _449);
    float _647 = _623 * (-2.0);
    float _649 = _491 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _651 = fma(_637, _583, _583);
    float _653 = _491 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _655 = fma(_511, _647, _511);
    float _657 = fma(_647, _585, _585);
    float _659 = _649 * _649;
    float _661 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[196].x, _641);
    bool _663 = !_345;
    float _665 = _663 ? (-0.5) : 0.5;
    float _667 = _491 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _669 = fma(_653, _653, _659);
    float _671 = _323 + (-0.5);
    float _673 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[196].y, _651);
    float _675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _665);
    float _677 = fma(_667, _667, _669);
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[196].z, _657);
    float _681 = _525 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _683 = _417 * _675;
    float _685 = _515 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _687 = fma(_635, _633, _661);
    float _689 = fma(_645, _633, _673);
    float _691 = fma(_655, _633, _679);
    float _693 = _523 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[0].x, _681);
    bool _697 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _699 = isnan(_311);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _533 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _711 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[0].z, _695);
    bool _713 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _715 = isnan(_311);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -_707;
    float _727 = _725 + 1.0;
    float _729 = rsqrt(_677);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _731;
    float _735 = _711 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _737 = _687 * 0.15915493667125701904296875;
    bool _739 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _741 = isnan(_311);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = _723 * _727;
    float _753 = _689 * 0.15915493667125701904296875;
    float _755 = -_735;
    float _757 = _709 + _755;
    float _759 = _691 * 0.15915493667125701904296875;
    float _761 = -_723;
    float _763 = _761 + 1.0;
    bool _765 = !_349;
    float _767 = _765 ? (-0.5) : 0.5;
    float _769 = 1.0 / _733;
    float _771 = -_525;
    float _773 = _771 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _775 = _749 * _763;
    float _777 = abs(_757);
    float _779 = precise::max(_777, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _767);
    float _783 = -_685;
    float _785 = _783 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _787 = _591 * _775;
    float _789 = _773 * _773;
    float _791 = _737 * 6.283185482025146484375;
    float _793 = sin(_791);
    float _795 = _419 * _781;
    float _797 = precise::min(_779, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _799 = fma(_785, _785, _789);
    bool _801 = _735 >= _709;
    bool _803 = isnan(_735);
    bool _805 = _801 || _803;
    bool _807 = isnan(_709);
    bool _809 = _805 || _807;
    float _811 = -_693;
    float _813 = _811 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _815 = _653 * _729;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _819 = _797 + _817;
    float _821 = _737 * 6.283185482025146484375;
    float _823 = cos(_821);
    bool _825 = !_809;
    float _827 = _825 ? 1.0 : (-1.0);
    float _829 = fma(_813, _813, _799);
    float _831 = _819 * _769;
    float _833 = _649 * _729;
    float _835 = _667 * _729;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _839 = _311 + _837;
    float _841 = _827 * _831;
    float _843 = _753 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _835 * _835;
    float _849 = -_749;
    float _851 = _849 + 1.0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _855 = _853 != 0;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _859 = _857 != 0;
    float _861 = _753 * 6.283185482025146484375;
    float _863 = cos(_861);
    float _865 = _759 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _823 * _845;
    float _871 = _793 * _845;
    float _873 = _759 * 6.283185482025146484375;
    float _875 = sin(_873);
    float _877 = _793 * _863;
    float _879 = _823 * _863;
    float _881 = _823 * _867;
    float _883 = _793 * _867;
    float _885 = _863 * _867;
    float _887 = _845 * _867;
    float _889 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _891 = sqrt(_829);
    float _893 = _881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _895 = -_869;
    float _897 = fma(_875, _877, _895);
    float _899 = -_877;
    float _901 = fma(_875, _869, _899);
    float _903 = _881 * _795;
    float _905 = fma(_875, _879, _871);
    float _907 = -_795;
    float _909 = _875 * _907;
    float _911 = _883 * _795;
    float _913 = fma(_875, _871, _879);
    float _915 = fma(_905, _683, _903);
    float _917 = fma(_885, _683, _909);
    float _919 = fma(_897, _683, _911);
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _925 = fma(_901, _889, _915);
    float _927 = fma(_887, _889, _917);
    float _929 = fma(_913, _889, _919);
    float _931 = fma(_171, _923, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _933 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _935 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _937 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _939 = _171 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _933);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _935);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _937);
    float _947 = _939 * _841;
    float _949 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _951 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].z, _943);
    float _953 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].z, _945);
    float _955 = _525 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _959 = _951 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _963 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[2].x, _955);
    float _965 = _525 + _957;
    float _967 = _685 + _959;
    float _969 = _947 * 0.15915493667125701904296875;
    float _971 = _693 + _961;
    float _973 = _965 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _975 = _965 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _977 = _965 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _979 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[2].z, _963);
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[2].x, _973);
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[1].x, _975);
    float _985 = abs(_891);
    float _987 = precise::max(0.0, _985);
    float _989 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[0].x, _977);
    float _991 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[2].z, _981);
    float _993 = _969 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[1].z, _983);
    float _999 = precise::min(_987, 40.0);
    float _1001 = _979 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1003 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1005 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[0].z, _989);
    float _1007 = _997 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1009 = fma(_999, -0.02500000037252902984619140625, 1.0);
    float _1011 = _969 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = -_1003;
    float _1017 = _1015 + _1001;
    float _1019 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1021 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1023 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1025 = fma(_1009, _1017, _1003);
    float _1027 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1029 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1021);
    float _1031 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1023);
    float _1033 = -_995;
    float _1035 = _1033 + 1.0;
    float _1037 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1027);
    float _1039 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1029);
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1031);
    float _1043 = _815 * _1035;
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1037);
    float _1047 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1049 = _835 * _1013;
    float _1051 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1053 = _815 * _1013;
    float _1055 = -_525;
    float _1057 = _1055 + _1047;
    float _1059 = -_1049;
    float _1061 = fma(_833, _1043, _1059);
    float _1063 = fma(_815, _1043, _995);
    float _1065 = -_685;
    float _1067 = _1065 + _1051;
    float _1069 = _833 * _1035;
    float _1071 = _1061 * _1057;
    float _1073 = _833 * _1013;
    float _1075 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1077 = fma(_1035, _847, _995);
    float _1079 = fma(_1063, _1067, _1071);
    float _1081 = fma(_835, _1069, _1053);
    float _1083 = -_1073;
    float _1085 = fma(_835, _1043, _1083);
    float _1087 = fma(_835, _1043, _1073);
    float _1089 = -_693;
    float _1091 = _1089 + _1075;
    float _1093 = _1081 * _1057;
    float _1095 = _881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1097 = fma(_1087, _1091, _1079);
    float _1099 = fma(_1085, _1067, _1093);
    float _1101 = fma(_475, _839, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1103 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[115].x, _787);
    float _1105 = fma(_1077, _1091, _1099);
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1109 = fma(_1097, _931, _685);
    float _1111 = fma(_1105, _931, _693);
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1119 = _1109 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1123 = _1111 + _1121;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1127 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1129 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1131 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1133 = _1119 * _1119;
    float _1135 = _1123 * _1123;
    float _1137 = fma(_1101, _751, _1103);
    float _1139 = _881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_66.x = _1127;
    out.m_66.y = _1129;
    out.m_66.z = _1131;
    out.m_66.w = _1125;
    float _1141 = fma(_833, _1043, _1049);
    float _1143 = fma(_833, _1069, _995);
    float _1145 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1137);
    float _1147 = -_875;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1139);
    float _1151 = -_875;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _1155 = -_875;
    float _1157 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1095);
    float _1159 = -_1053;
    float _1161 = fma(_835, _1069, _1159);
    float _1163 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1149);
    float _1165 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1153);
    float _1167 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1157);
    float _1169 = _901 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1173 = _1171 != 0;
    float _1175 = _1133 + _1135;
    float _1177 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1179 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1181 = _1143 * _1057;
    float _1183 = sqrt(_1175);
    float _1185 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1177);
    float _1187 = _901 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1189 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1179);
    float _1191 = fma(_1141, _1067, _1181);
    float _1193 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1195 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1187);
    float _1197 = _901 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1201 = fma(_1161, _1091, _1191);
    float _1203 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1193);
    float _1205 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1169);
    float _1207 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1197);
    float _1209 = _525 + _1201;
    float _1211 = -_767;
    int _1213 = _355 ? as_type<int>(_1211) : as_type<int>(_767);
    float _1215 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1195);
    bool _1217 = _1183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1221 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1207);
    float _1223 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1205);
    bool _1225 = _323 > 0.5;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1229 = _1207;
    float _1231 = _1067;
    float _1233 = _1091;
    float _1235 = _1133;
    float _1237 = _1135;
    if (!_1217)
    {
        _1229 = _1109;
    }
    float _1239 = _1229;
    float _1241 = _1239;
    if (!_1217)
    {
        _1231 = _1111;
    }
    float _1243 = _1231;
    float _1245 = _1243;
    if (!_1217)
    {
        _1233 = _1209;
    }
    float _1247 = _1233;
    bool _1249 = !_1217;
    float _1251 = _1247;
    if (!_1249)
    {
        float _1253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1257 = _1183 + _1255;
        float _1259 = rsqrt(_1175);
        float _1261 = _1257 * _1253;
        float _1263 = _1209 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = _1261 * 0.15915493667125701904296875;
        float _1267 = _1265 * 6.283185482025146484375;
        float _1269 = sin(_1267);
        float _1271 = _1265 * 6.283185482025146484375;
        float _1273 = cos(_1271);
        float _1275 = fma(_1269, _1263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1277 = _1259 * _1275;
        float _1279 = fma(_1119, _1277, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1281 = _1273 + (-1.0);
        float _1283 = fma(_1123, _1277, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1287 = _1279 + _1285;
        float _1289 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1293 = _1283 + _1291;
        float _1295 = _1287 * _1287;
        float _1297 = fma(_1209, _1273, _1289);
        float _1299 = _1293 * _1293;
        _1251 = _1297;
        _1235 = _1295;
        _1237 = _1299;
        _1241 = _1279;
        _1245 = _1283;
    }
    float _1301 = _1251;
    float _1303 = _1235;
    float _1305 = _1237;
    float _1307 = _1241;
    float _1309 = _1245;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1313 = _1301 + _1311;
    float _1315 = _767 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1317 = -_665;
    int _1319 = _639 ? as_type<int>(_1317) : as_type<int>(_665);
    float _1321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1325 = _1323 != 0;
    float _1327 = fma(_1313, _1313, _1303);
    float _1329 = fma(_1315, _1315, 1.0);
    float _1331 = -_767;
    int _1333 = _625 ? as_type<int>(_1331) : as_type<int>(_767);
    float _1335 = _665 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1337 = !_1325;
    float _1339 = _1337 ? _665 : as_type<float>(_1319);
    float _1341 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1189);
    bool _1343 = !_1173;
    float _1345 = _1343 ? _767 : as_type<float>(_1213);
    float _1347 = rsqrt(_1329);
    float _1349 = -_665;
    int _1351 = _1225 ? as_type<int>(_1349) : as_type<int>(_665);
    float _1353 = _1339 + 0.5;
    bool _1355 = !_855;
    float _1357 = _1355 ? _767 : as_type<float>(_1333);
    float _1359 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1185);
    float _1361 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1203);
    float _1363 = _1315 * _1163;
    bool _1365 = !_859;
    float _1367 = _1365 ? _665 : as_type<float>(_1351);
    float _1369 = _1315 * _1165;
    float _1371 = _1315 * _1167;
    float _1373 = fma(_1335, _1341, _1363);
    float _1375 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1377 = fma(_1335, _1359, _1369);
    float _1379 = fma(_1335, _1361, _1371);
    float _1381 = _1367 + 0.5;
    float _1383 = -_1345;
    float _1385 = _1383 + 0.5;
    float _1387 = _1315 * _1347;
    float _1389 = _1375 * _1199;
    float _1391 = -_1357;
    float _1393 = _1391 + 0.5;
    float _1395 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1397 = -_1215;
    float _1399 = _1387 * _1397;
    float _1401 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1405 = _1327 + _1305;
    float _1407 = fma(_1347, _1163, _1399);
    float _1409 = _1401 * _1321;
    float _1411 = -_1223;
    float _1413 = _1387 * _1411;
    float _1415 = _1403 * _1219;
    float _1417 = -_1221;
    float _1419 = _1387 * _1417;
    float _1421 = _1395 * _1227;
    float _1423 = fma(_1347, _1165, _1413);
    float _1425 = fma(_1347, _1167, _1419);
    float _1427 = sqrt(_1405);
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1435 = _1145 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1439 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1441 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1443 = _1215 + _1373;
    float _1445 = _1223 + _1377;
    float _1447 = _1221 + _1379;
    out.m_68.x = _1389;
    out.m_68.y = _1415;
    out.m_68.z = _1421;
    out.m_68.w = _1409;
    out.m_70.x = _1439;
    out.m_70.y = _1437;
    out.m_70.z = _1441;
    out.m_70.w = _1435;
    bool _1449 = _1427 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1451 = isnan(_1427);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1457 = _1453 || _1455;
    out.m_72.x = _1341;
    out.m_72.y = _1359;
    out.m_72.z = _1361;
    out.m_74.x = _1407;
    out.m_74.y = _1423;
    out.m_74.z = _1425;
    out.m_76.x = _1443;
    out.m_76.y = _1445;
    out.m_76.z = _1447;
    float _1459 = _1377;
    if (!_1457)
    {
        _1459 = 1.0;
    }
    float _1461 = _1459;
    bool _1463 = !_1457;
    float _1465 = _1461;
    if (!_1463)
    {
        bool _1467 = _1427 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1469 = isnan(_1427);
        bool _1471 = _1467 || _1469;
        bool _1473 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1475 = _1471 || _1473;
        if (!_1475)
        {
            float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1479 = _1427 + _1477;
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1489 = 1.0 / _1483;
            float _1491 = _1479 * _1489;
            float _1493 = fma(_1491, _1487, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1465 = _1493;
            _1495 = true;
        }
        else
        {
            bool _1497 = _1427 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1499 = isnan(_1427);
            bool _1501 = _1497 || _1499;
            bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1505 = _1501 || _1503;
            if (!_1505)
            {
                float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1509 = _1427 + _1507;
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1511 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1519 = 1.0 / _1513;
                float _1521 = _1509 * _1519;
                float _1523 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1465 = _1523;
                _1495 = true;
            }
            else
            {
                _1465 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1495 = false;
    float _1525 = _1465;
    float _1527 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1529 = _1301 + _1527;
    float _1531 = _525 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1533 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1535 = _1307 + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1539 = _1309 + _1537;
    float _1541 = fma(_1529, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1543 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1531);
    float _1545 = fma(_1535, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1547 = fma(_1539, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1549 = -_525;
    float _1551 = _1549 + _1541;
    float _1553 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1543);
    float _1555 = -_685;
    float _1557 = _1555 + _1545;
    float _1559 = _525 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1561 = _1551 * _1551;
    float _1563 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1565 = -_693;
    float _1567 = _1565 + _1547;
    float _1569 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1559);
    float _1571 = fma(_1557, _1557, _1561);
    float _1573 = 1.0 / _1563;
    float _1575 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1569);
    float _1577 = fma(_1567, _1567, _1571);
    float _1579 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1581 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(0.5);
    bool _1589 = _1585 || _1587;
    float _1591 = sqrt(_1577);
    float _1593 = _1579 + _1563;
    float _1595 = _1593 * _1573;
    float _1597 = _1595 * 0.5;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1599);
    float _1603 = _1563;
    float _1605 = _1597;
    float _1607 = _1525;
    float _1609 = _1557;
    float _1611 = _1551;
    if (_1589)
    {
        _547 = 1.0;
    }
    float _1613 = _547;
    bool _1615 = _1591 > 0.0;
    float _1617 = 1.0 / _1601;
    float _1619 = _1591;
    float _1621 = _1613;
    if (!_1615)
    {
        _1619 = _1545;
    }
    float _1623 = _1619;
    float _1625 = _1623;
    if (!_1615)
    {
        _1603 = _1541;
    }
    float _1627 = _1603;
    float _1629 = _1627;
    if (!_1615)
    {
        _1605 = _1547;
    }
    float _1631 = _1605;
    bool _1633 = !_1615;
    float _1635 = _1631;
    float _1637 = _1631;
    if (!_1633)
    {
        float _1639 = _187 * _187;
        float _1641 = rsqrt(_1577);
        float _1643 = fma(_185, _185, _1639);
        float _1645 = fma(_189, _189, _1643);
        float _1647 = sqrt(_1645);
        float _1649 = _1557 * _1641;
        float _1651 = _1551 * _1641;
        float _1653 = _1567 * _1641;
        bool _1655 = _1647 > 0.0;
        float _1657 = _1641;
        float _1659 = _1647;
        _1607 = _1649;
        if (!_1655)
        {
            _1657 = _1545;
        }
        float _1661 = _1657;
        _1625 = _1661;
        if (!_1655)
        {
            _1659 = _1541;
        }
        float _1663 = _1659;
        _1629 = _1663;
        if (!_1655)
        {
            _1635 = _1547;
        }
        float _1665 = _1635;
        bool _1667 = !_1655;
        _1637 = _1665;
        if (!_1667)
        {
            float _1669 = rsqrt(_1645);
            float _1671 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1673 = _187 * _1669;
            float _1675 = _185 * _1669;
            float _1677 = _189 * _1669;
            float _1679 = _1651 * _1673;
            float _1681 = fma(_1649, _1675, _1679);
            float _1683 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1685 = fma(_1653, _1677, _1681);
            float _1687 = _1685 * _1683;
            float _1689 = fma(_185, _1687, _1545);
            float _1691 = fma(_187, _1687, _1541);
            float _1693 = fma(_189, _1687, _1547);
            _1629 = _1691;
            _1625 = _1689;
            _1637 = _1693;
        }
    }
    float _1695 = _1607;
    float _1697 = _1629;
    float _1699 = _1625;
    float _1701 = _1637;
    float _1703 = _1695;
    if (_1589)
    {
        _193 = 1.0;
    }
    float _1705 = _193;
    float _1707 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1709 = _1617 * _1707;
    float _1711 = _1705;
    if (!_1589)
    {
        float _1713 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1715 = _1713 * 0.15915493667125701904296875;
        float _1717 = _1715 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1723 = _1721 * 0.15915493667125701904296875;
        float _1725 = _1715 * 6.283185482025146484375;
        float _1727 = sin(_1725);
        float _1729 = 1.0 / _1719;
        float _1731 = _1723 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        float _1735 = _1727 * _1729;
        float _1737 = _1723 * 6.283185482025146484375;
        float _1739 = sin(_1737);
        float _1741 = _1733 * _1735;
        float _1743 = 1.0 / _1741;
        float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1747 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1745;
        float _1749 = 1.0 / _1747;
        float _1751 = _1739 * _1743;
        float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1755 = fma(_1709, _1751, _1753);
        float _1757 = _1755 * _1749;
        float _1759 = precise::clamp(_1757, 0.0, 1.0);
        _1703 = _1723;
        _1621 = _1759;
    }
    float _1761 = _1703;
    float _1763 = _1621;
    float _1765 = _1761;
    if (!_1589)
    {
        float _1767 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1769 = _1767 * 0.15915493667125701904296875;
        float _1771 = _1769 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1777 = _1775 * 0.15915493667125701904296875;
        float _1779 = _1769 * 6.283185482025146484375;
        float _1781 = sin(_1779);
        float _1783 = 1.0 / _1773;
        float _1785 = _1777 * 6.283185482025146484375;
        float _1787 = cos(_1785);
        float _1789 = _1781 * _1783;
        float _1791 = _1777 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        float _1795 = _1787 * _1789;
        float _1797 = 1.0 / _1795;
        float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1801 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1799;
        float _1803 = 1.0 / _1801;
        float _1805 = _1793 * _1797;
        float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1809 = fma(_1709, _1805, _1807);
        float _1811 = _1809 * _1803;
        float _1813 = precise::clamp(_1811, 0.0, 1.0);
        float _1815 = -_1813;
        float _1817 = _1815 + 1.0;
        _1765 = _1797;
        _1711 = _1817;
    }
    float _1819 = _1765;
    float _1821 = _1711;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1825 = _1697 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1829 = _1699 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1833 = _1701 + _1831;
    float _1835 = _1825 * _1825;
    float _1837 = fma(_1829, _1829, _1835);
    float _1839 = fma(_1833, _1833, _1837);
    float _1841 = rsqrt(_1839);
    float _1843 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1845 = _1829 * _1843;
    float _1847 = _1833 * _1843;
    float _1849 = _1845 * _1845;
    float _1851 = _1847 * _1847;
    float _1853 = _1849 + _1851;
    float _1855 = sqrt(_1853);
    bool _1857 = _1855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1861 = _1855 + _1859;
    float _1863 = _1819;
    float _1865 = _1853;
    float _1867 = _1861;
    float _1869 = _1825;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1857)
    {
        float _1873 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1863 = _1873;
    }
    float _1875 = _1863;
    if (_1857)
    {
        float _1877 = rsqrt(_1853);
        _1865 = _1877;
    }
    float _1879 = _1865;
    float _1881 = _1875;
    float _1883 = _1879;
    if (_1857)
    {
        float _1885 = _1861 * _1875;
        _1867 = _1885;
    }
    float _1887 = _1867;
    if (_1857)
    {
        float _1889 = _1887 * 0.15915493667125701904296875;
        _1609 = _1889;
    }
    float _1891 = _1609;
    float _1893 = _1833;
    float _1895 = _1891;
    if (_1857)
    {
        float _1897 = _1891 * 6.283185482025146484375;
        float _1899 = sin(_1897);
        _1893 = _1899;
    }
    float _1901 = _1893;
    float _1903 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1905 = precise::max(0.0, _1903);
    float _1907 = _1541;
    if (_1857)
    {
        float _1909 = _1891 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        _1907 = _1911;
    }
    float _1913 = _1907;
    float _1915 = -_1843;
    float _1917 = -_1905;
    float _1919 = fma(_1825, _1915, _1917);
    float _1921 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1857)
    {
        float _1923 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1869 = _1923;
    }
    float _1925 = _1869;
    float _1927 = _1925;
    if (!_1857)
    {
        _1895 = _1845;
    }
    float _1929 = _1895;
    float _1931 = sqrt(_1839);
    float _1933 = _1901;
    float _1935 = _1929;
    if (_1857)
    {
        float _1937 = fma(_1901, _1925, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1881 = _1937;
    }
    float _1939 = _1881;
    float _1941 = _1939;
    if (!_1857)
    {
        _1933 = _1847;
    }
    float _1943 = _1933;
    float _1945 = _1943;
    if (_1857)
    {
        float _1947 = _1913 + (-1.0);
        _1927 = _1947;
    }
    float _1949 = _1927;
    float _1951 = _1949;
    if (_1857)
    {
        float _1953 = _1879 * _1939;
        _1871 = _1953;
    }
    float _1955 = _1871;
    if (!_1857)
    {
        _1941 = _1919;
    }
    float _1957 = _1941;
    float _1959 = floor(_1921);
    float _1961 = _1957;
    if (_1857)
    {
        float _1963 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1611 = _1963;
    }
    float _1965 = _1611;
    if (_1857)
    {
        float _1967 = _1845 * _1955;
        _1935 = _1967;
    }
    float _1969 = _1935;
    if (!_1857)
    {
        _1883 = _1849;
    }
    float _1971 = _1883;
    float _1973 = _1971;
    if (_1857)
    {
        float _1975 = _1847 * _1955;
        _1945 = _1975;
    }
    float _1977 = _1945;
    if (_1857)
    {
        float _1979 = fma(_1919, _1913, _1965);
        _1961 = _1979;
    }
    float _1981 = _1961;
    if (_1857)
    {
        float _1983 = _1969 * _1969;
        _1973 = _1983;
    }
    float _1985 = _1973;
    if (!_1857)
    {
        _1951 = _1851;
    }
    float _1987 = _1951;
    float _1989 = _1987;
    if (_1857)
    {
        float _1991 = _1977 * _1977;
        _1989 = _1991;
    }
    float _1993 = _1989;
    float _1995 = fma(_1981, _1981, _1985);
    float _1997 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1999 = _1995 + _1993;
    float _2001 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1997);
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2005 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2003);
    float _2007 = precise::clamp(_2005, 0.0, 1.0);
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2011 = rsqrt(_1999);
    float _2013 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2001);
    float _2015 = -_2007;
    float _2017 = _2015 + 1.0;
    float _2019 = -_1959;
    float _2021 = _1921 + _2019;
    float _2023 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2025 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2027 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2029 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2031 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2033 = abs(_2017);
    float _2035 = log2(_2033);
    float _2037 = -_2027;
    float _2039 = fma(_2037, _2009, 1.0);
    float _2041 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2043 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2029);
    float _2045 = _2011 * _1969;
    float _2047 = _2011 * _1981;
    float _2049 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2041);
    float _2051 = _2011 * _1977;
    float _2053 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2031);
    float _2055 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2043);
    float _2057 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2049);
    float _2059 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2061 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2053);
    float _2063 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2065 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2067 = floor(_2025);
    float _2069 = -_2059;
    float _2071 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2069);
    float _2073 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2075 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2079 = -_2051;
    float _2081 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2071);
    float _2083 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2075);
    float _2085 = log2(_2039);
    float _2087 = fma(_2081, -0.5, 0.5);
    float _2089 = fma(_2081, 0.5, 0.5);
    float _2091 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2083);
    float _2093 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2095 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2077);
    float _2097 = fma(_2089, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2099 = exp2(_2073);
    float _2101 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2103 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2093);
    float _2105 = -_2067;
    float _2107 = _2025 + _2105;
    float _2109 = fma(_2089, _2097, -0.212114393711090087890625);
    float _2111 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2091);
    float _2113 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2103);
    float _2115 = _2047 + 1.0;
    float _2117 = sqrt(_2087);
    float2 _5979 = float2(_2021, _2107);
    float _2119 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5979, float2(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5979, float2(0.0), isnan(_5979)), level(0.0)).x;
    float _2121 = fma(_2089, _2109, 1.570728778839111328125);
    float _2123 = 1.0 / _2111;
    float _2125 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2095);
    float _2127 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2113);
    float _2129 = _2085 * 0.693147182464599609375;
    float _2131 = -_2047;
    float _2133 = fma(_2099, _2115, _2131);
    float _2135 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2125);
    float _2137 = _2117 * 0.636619746685028076171875;
    float _2139 = fma(_2133, 0.5, 0.5);
    float _2141 = -_2121;
    float _2143 = fma(_2137, _2141, 1.0);
    float _2145 = _2135 * _2123;
    float _2147 = _2127 * _2123;
    float _2149 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2151 = fma(_2145, 0.5, 0.5);
    float _2153 = fma(_2147, -0.5, 0.5);
    float3 _6044 = float3(_2151, _2153, _2149);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6044, float3(0.0), isnan(_6044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6044, float3(0.0), isnan(_6044)), level(0.0)).x;
    float3 _6055 = float3(_2151, _2153, _2149);
    float4 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6055, float3(0.0), isnan(_6055)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6055, float3(0.0), isnan(_6055)), level(0.0)).xyzw;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2158.w;
    float2 _6071 = float2(_2143, _2139);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6071, float2(0.0), isnan(_6071)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6071, float2(0.0), isnan(_6071)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    float _2178 = abs(_1709);
    float _2180 = log2(_2178);
    float _2182 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _1699;
    out.m_78.y = _1697;
    out.m_78.z = _1701;
    bool _2184 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2186 = isnan(_1931);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2192 = _2188 || _2190;
    float _2194 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2182);
    float _2196 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2194);
    float _2198 = in.m_80.x;
    float _2200 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2196);
    bool _2202 = _1709 <= 8000.0;
    bool _2204 = isnan(_1709);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(8000.0);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2216 = exp2(_2214);
    out.gl_Position.x = _2135;
    out.gl_Position.y = _2127;
    out.gl_Position.z = _2200;
    out.gl_Position.w = _2111;
    float _2218 = _1763 * _1821;
    float _2220 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2222 = precise::clamp(_2220, 0.0, 1.0);
    float _2224 = _2127;
    float _2226 = _2111;
    float _2228 = _2200;
    float _2230 = _2218;
    if (!_2192)
    {
        _2224 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2232 = _2224;
    float _2234 = fma(_2222, -2.0, 3.0);
    float _2236 = _2222 * _2222;
    float _2238 = _2236 * _2234;
    float _2240 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2242 = -_2238;
    float _2244 = _2242 + 1.0;
    float _2246 = exp2(_2240);
    float _2248 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2238);
    float _2250 = _2200 + _2111;
    float _2252 = _2232;
    float _2254 = _2232;
    if (!_2192)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2256 = _2226;
    float _2258 = _2212 * _2248;
    float _2260 = _2250 * 0.5;
    float _2262 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2264 = _2256;
    float _2266 = _2256;
    if (!_2192)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2268 = _2228;
    out.m_82.z = _2260;
    out.m_82.w = _2111;
    float _2270 = -_2246;
    float _2272 = _2270 + 1.0;
    float _2274 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2276 = -_2119;
    float _2278 = _2276 + 1.0;
    float _2280 = _2278 * _2262;
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = -_2282;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2288 = _2286 * _2198;
    float _2290 = _2288 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _2290;
    float _2292 = _2274 * _2155;
    float _2294 = -_2274;
    float _2296 = _2294 + 1.0;
    float _2298 = _2166 * _2292;
    float _2300 = _2176 * _2292;
    float _2302 = _2166 * _2296;
    float _2304 = fma(_2172, _2298, _2160);
    float _2306 = fma(_2174, _2298, _2162);
    float _2308 = fma(_2166, _2300, _2164);
    float _2310 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2312 = _2298;
    float _2314 = _2160;
    float _2316 = _2268;
    float _2318 = _2268;
    if (!_2192)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2320 = _2312;
    float _2322 = _2320;
    float _2324 = _2320;
    if (!_2192)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2326 = _2314;
    out.m_86.x = _2304;
    out.m_86.y = _2306;
    out.m_86.z = _2308;
    out.m_86.w = _2302;
    float _2328 = _2326;
    float _2330 = _2326;
    if (!_2192)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2332 = _2230;
    bool _2334 = !_2192;
    float _2336 = _2332;
    float _2338 = _2332;
    if (!_2334)
    {
        bool _2340 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2342 = isnan(_1931);
        bool _2344 = _2340 || _2342;
        bool _2346 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2348 = _2344 || _2346;
        if (!_2348)
        {
            float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2352 = _1931 + _2350;
            float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2356 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2354;
            float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2362 = 1.0 / _2356;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2380 = _2352 * _2362;
            float _2382 = precise::clamp(_2380, 0.0, 1.0);
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2388 = fma(_2382, _2360, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2390 = fma(_2382, _2386, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2392 = fma(_2382, _2366, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2394 = fma(_2382, _2370, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2396 = fma(_2382, _2374, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2398 = fma(_2382, _2378, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2330 = _2392;
            _2254 = _2396;
            _2324 = _2388;
            _2318 = _2394;
            _2266 = _2390;
            _2338 = _2398;
            _2400 = true;
        }
        else
        {
            bool _2402 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2404 = isnan(_1931);
            bool _2406 = _2402 || _2404;
            bool _2408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2410 = _2406 || _2408;
            if (!_2410)
            {
                _2322 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2412 = _2322;
            _2324 = _2412;
            if (!_2410)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2414 = _2328;
            _2330 = _2414;
            if (!_2410)
            {
                _2264 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2416 = _2264;
            _2266 = _2416;
            if (!_2410)
            {
                _2316 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2418 = _2316;
            _2318 = _2418;
            if (!_2410)
            {
                _2252 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2420 = _2252;
            _2254 = _2420;
            if (!_2410)
            {
                _2336 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2422 = _2336;
            bool _2424 = !_2410;
            _2338 = _2422;
            if (!_2424)
            {
                bool _2426 = _1931 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2428 = isnan(_1931);
                bool _2430 = _2426 || _2428;
                bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2434 = _2430 || _2432;
                if (!_2434)
                {
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2438 = _1931 + _2436;
                    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2442 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2440;
                    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2448 = 1.0 / _2442;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2466 = _2438 * _2448;
                    float _2468 = precise::clamp(_2466, 0.0, 1.0);
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2474 = fma(_2468, _2446, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2476 = fma(_2468, _2472, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2478 = fma(_2468, _2452, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2480 = fma(_2468, _2456, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2482 = fma(_2468, _2460, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2484 = fma(_2468, _2464, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2330 = _2478;
                    _2254 = _2482;
                    _2324 = _2474;
                    _2318 = _2480;
                    _2266 = _2476;
                    _2338 = _2484;
                    _2400 = true;
                }
                else
                {
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2254 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2324 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2318 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2266 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2338 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2400 = false;
    float _2486 = _2330;
    float _2488 = _2254;
    float _2490 = _2324;
    float _2492 = _2318;
    float _2494 = _2266;
    float _2496 = _2338;
    float _2498 = fma(_1445, -0.5, 0.5);
    float _2500 = precise::clamp(_2498, 0.0, 1.0);
    float _2502 = -_2486;
    float _2504 = _2502 + _2488;
    float _2506 = _2310 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2508 = -_2490;
    float _2510 = _2508 + _2492;
    float _2512 = fma(_2500, _2504, _2486);
    out.m_88.x = 0.0;
    float _2514 = -_2494;
    float _2516 = _2514 + _2496;
    float _2518 = fma(_2500, _2510, _2490);
    float _2520 = _2512 * 0.586610972881317138671875;
    out.m_51.x = _2506;
    bool _2522 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2524 = fma(_2500, _2516, _2494);
    float _2526 = fma(_2518, 0.298911988735198974609375, _2520);
    bool _2528 = _1763 > 0.0;
    bool _2530 = isnan(_1763);
    bool _2532 = _2528 || _2530;
    bool _2534 = isnan(0.0);
    bool _2536 = _2532 || _2534;
    float _2538 = fma(_2524, 0.114477999508380889892578125, _2526);
    bool _2540 = _1821 <= 0.0;
    bool _2542 = !_2536;
    bool _2544 = _2540 || _2542;
    float _2546 = -_2538;
    float _2548 = _2518 + _2546;
    float _2550 = -_2538;
    float _2552 = _2512 + _2550;
    float _2554 = -_2538;
    float _2556 = _2524 + _2554;
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2538);
    float _2560 = fma(_2552, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2538);
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2538);
    bool _2564 = !_2522;
    if (!_2564)
    {
        float _2566 = -_1697;
        float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2570 = -_1699;
        float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2574 = -_1701;
        float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2578 = _2568 * _2568;
        float _2580 = fma(_2572, _2572, _2578);
        float _2582 = fma(_2576, _2576, _2580);
        float _2584 = sqrt(_2582);
        float _2586 = rsqrt(_2582);
        float _2588 = -_2584;
        float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        float _2596 = _2572 * _2586;
        float _2598 = _2568 * _2586;
        float _2600 = abs(_2594);
        float _2602 = log2(_2600);
        float _2604 = _2576 * _2586;
        float _2606 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2608 = _1445 * _2598;
        float _2610 = -_2598;
        float _2612 = -_2606;
        float _2614 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2612);
        float _2616 = fma(_1443, _2596, _2608);
        float _2618 = -_2604;
        float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2614);
        float _2622 = fma(_1447, _2604, _2616);
        float _2624 = precise::clamp(_2622, 0.0, 1.0);
        float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2628 = _2620 + _2626;
        float _2630 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2632 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2634 = precise::clamp(_2632, 0.0, 1.0);
        float _2636 = exp2(_2630);
        float _2638 = _2636 * _2634;
        float _2640 = _2624 * _2638;
        float _2642 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2644 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2646 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2642;
        out.m_88.y = _2644;
        out.m_88.z = _2646;
    }
    out.m_90.x = _2558;
    out.m_90.y = _2560;
    out.m_90.z = _2562;
    if (!_2544)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2648 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2648;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

