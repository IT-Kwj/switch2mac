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
    float4 m_58 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 m_62 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _599 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1718 = as_type<float>(_109);
        out.gl_Position.z = _1718;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1787 = as_type<float>(_145);
        out.gl_Position.z = _1787;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_54.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    float _183 = _147;
    float _185 = _149;
    if (!_161)
    {
        float _187 = _149 * _149;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_177;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_161)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_181;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_161;
    float _209 = _201;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _149 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _149);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = _243 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _251 = _243 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _253 = _243 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _255 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[8].x, _249);
    float _257 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[8].y, _251);
    float _259 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[8].z, _253);
    float _261 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[10].x, _255);
    bool _263 = !_161;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _149 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _185 = _283;
    }
    float _285 = _185;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _289 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[10].y, _257);
    float _291 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[10].z, _259);
    float _293 = fma(_285, _163, _261);
    float _295 = fma(_285, _165, _289);
    float _297 = fma(_285, _167, _291);
    float _299 = fma(_293, _151, _169);
    float _301 = fma(_295, _151, _171);
    float _303 = fma(_297, _151, _173);
    bool _305 = !_287;
    float _323;
    if (!_305)
    {
        float _307 = in.m_56.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_93);
        float _329 = 1.0 / _327;
        float _331 = _127 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = 1.0 / _337;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _357 = _353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _359 = 1.0 / _341;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = _333 + _361;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _369 = _355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _371 = _365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _375 = 1.0 / _345;
    float _377 = _363 * _351;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _333 + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = _333 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _333 + _387;
    out.m_58.x = _357;
    out.m_58.y = _369;
    out.m_58.z = _371;
    out.m_58.w = _367;
    float _391 = 1.0 / _349;
    bool _393 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _395 = isnan(_333);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = _381 * _359;
    bool _407 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _409 = isnan(_333);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = _385 * _375;
    float _421 = -_403;
    float _423 = _421 + 1.0;
    bool _425 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _427 = isnan(_333);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = _417 * _423;
    float _439 = -_417;
    float _441 = _439 + 1.0;
    float _443 = in.m_56.x;
    float _445 = _389 * _391;
    bool _447 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _449 = isnan(_333);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    bool _459 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _461 = isnan(_333);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -_457;
    float _473 = _471 + 1.0;
    float _475 = _469 * _441;
    float _477 = -_469;
    float _479 = _477 + 1.0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _493 = _457 * _479;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = fma(_483, _377, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _501 = fma(_487, _377, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _503 = _435 * _473;
    float _505 = fma(_491, _405, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _507 = fma(_497, _405, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _509 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _511 = _499 * _503;
    float _513 = _501 * _503;
    float _515 = -_435;
    float _517 = _515 + 1.0;
    float _519 = in.m_54.x;
    float _521 = in.m_54.y;
    float _523 = _509 * _443;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _525;
    float _529 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].x, _511);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    float _537 = fma(_527, _419, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _539 = fma(_505, _493, _529);
    float _541 = fma(_533, _419, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _551 = fma(_507, _493, _535);
    float _553 = trunc(_523);
    int _555 = int(_553);
    float _557 = fma(_545, _445, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _559 = fma(_541, _475, _539);
    float _561 = fma(_549, _445, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _563 = fma(_537, _475, _551);
    float _565 = fma(_557, _437, _559);
    float _567 = fma(_561, _437, _563);
    float _569 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].x, _565);
    float _571 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].y, _567);
    float _573 = _569 * _519;
    float _575 = _571 * _521;
    int _577 = _555 << 4;
    int _579 = _577 + 1968;
    bool _581 = !_373;
    float _597;
    if (!_581)
    {
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _585 = _443 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_93);
        float _603 = 1.0 / _601;
        float _605 = _127 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = in.m_56.w;
    float _611 = _301 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _613 = in.m_56.z;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _617 = _615 != 0;
    float _619 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].x, _611);
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _623 = _621 != 0;
    float _625 = in.m_56.y;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _629 = _627 != 0;
    float _631 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].z, _619);
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _635 = _633 != 0;
    float _637 = _443 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _639 = _631 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _641 = _573 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _643 = _443 > 0.5;
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _647 = -_195;
    int _649 = _643 ? as_type<int>(_647) : as_type<int>(_195);
    bool _651 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _653 = isnan(_607);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _663;
    bool _667 = _609 > 0.5;
    float _669 = _301 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _671 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _673 = isnan(_607);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _685 = _613 > 0.5;
    float _687 = _301 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _689 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].x, _669);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _693 = _625 > 0.5;
    float _695 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].x, _687);
    float _697 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].z, _689);
    float _699 = -_691;
    float _701 = fma(_637, 2.0, _699);
    float _703 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].z, _695);
    float _705 = _697 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _715 = _705 + _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _721 = _639 + _719;
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _725 = _711 + _723;
    float _727 = _715 * _715;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _733 = 1.0 / _709;
    float _735 = fma(_725, _725, _727);
    float _737 = _645 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _739 = !_617;
    float _741 = _739 ? _195 : as_type<float>(_649);
    float _743 = fma(_721, _721, _735);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _749 = 1.0 / _731;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _753 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[78].z, _717);
    float _755 = -_127;
    float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[76].x, _701);
    float _759 = rsqrt(_743);
    float _761 = _625 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _763 = fma(_761, -2.0, _751);
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _767 = 1.0 / _747;
    float _769 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _763);
    float _771 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[78].w, _765);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _783 = _607 + _781;
    float _785 = sqrt(_743);
    float _787 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _753);
    float _789 = _775 * _733;
    float _791 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _771);
    float _793 = _715 * _759;
    float _795 = _725 * _759;
    float _797 = fma(_789, _783, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _799 = -_661;
    float _801 = _799 + 1.0;
    float _803 = -_793;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    float _807 = _665 * _767;
    float _809 = _641 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _811 = -_795;
    float _813 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[18].w, _725);
    float _815 = _805 * _805;
    bool _817 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _819 = isnan(_607);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = _779 * _749;
    float _831 = _721 * _759;
    float _833 = _785 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _835 = fma(_813, _813, _815);
    bool _837 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _839 = isnan(_607);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -_827;
    float _851 = _849 + 1.0;
    float _853 = _827 * _801;
    float _855 = precise::min(_809, _833);
    uint _858 = uint(int(uint(_579) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[int(_860)][_862];
    int _866 = int(_858) + 1;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    int _870 = _866 & 3;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[int(_868)][_870];
    float _874 = -_847;
    float _876 = _874 + 1.0;
    float _878 = _847 * _851;
    float _880 = -_831;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _721);
    float _884 = _793 * _855;
    float _886 = _795 * _855;
    float _888 = _681 * _876;
    float _890 = fma(_882, _882, _835);
    float _892 = -_884;
    float _894 = _715 + _892;
    float _896 = -_886;
    float _898 = _725 + _896;
    float _900 = _797 * _888;
    float _902 = -_681;
    float _904 = _902 + 1.0;
    float _906 = _894 * _894;
    int _908 = _579 + 8;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    uint _912 = uint(int(uint(int(_910)) >> uint(2)));
    int _914 = int(_910) & 3;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[int(_912)][_914];
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _920 = _607 + _918;
    float _922 = sqrt(_890);
    float _924 = fma(_898, _898, _906);
    float _926 = _831 * _855;
    float _928 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[131].x, _900);
    float _930 = _715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _932 = -_205;
    int _934 = _693 ? as_type<int>(_932) : as_type<int>(_205);
    float _936 = -_926;
    float _938 = _721 + _936;
    float _940 = fma(_829, _920, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _942 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[28].x, _930);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _946 = _607 + _944;
    float _948 = fma(_938, _938, _924);
    bool _950 = !_623;
    float _952 = _950 ? _205 : as_type<float>(_934);
    float _954 = fma(_940, _878, _928);
    float _956 = fma(_807, _946, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _958 = _741 + 0.5;
    float _960 = _683 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _962 = sqrt(_948);
    float _964 = _952 + (-0.5);
    float _966 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[28].z, _942);
    float _968 = fma(_737, _958, _757);
    float _970 = _759 * _922;
    float _972 = -_960;
    float _974 = -_769;
    float _976 = fma(_972, _964, _974);
    float _978 = fma(_956, _853, _954);
    bool _980 = _966 >= 0.0;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _984 = -_205;
    int _986 = _667 ? as_type<int>(_984) : as_type<int>(_205);
    float _988 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[134].x, _978);
    out.m_60.w = _855;
    bool _990 = !_635;
    float _992 = _990 ? _205 : as_type<float>(_986);
    float _994 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _996 = _759 * _962;
    float _998 = -_195;
    int _1000 = _685 ? as_type<int>(_998) : as_type<int>(_195);
    float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1004 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1006 = -_992;
    float _1008 = _1006 + 0.5;
    bool _1010 = !_629;
    float _1012 = _1010 ? _195 : as_type<float>(_1000);
    float _1014 = -_787;
    float _1016 = _1014 + 1.0;
    float _1018 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1020 = -_791;
    float _1022 = _1020 + 1.0;
    float _1024 = _996 * _970;
    float _1026 = _1012 + 0.5;
    float _1028 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1030 = fma(_952, _1022, _976);
    float _1032 = -_1016;
    float _1034 = fma(_741, _1032, _968);
    float _1036 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1038 = _916 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1040 = _916;
    float _1042 = _855;
    if (_980)
    {
        _1040 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1044 = _1040;
    float _1046 = _1036 * _982;
    float _1048 = _1028 * _1002;
    float _1050 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1056 = as_type<int>(_1044);
    if (_980)
    {
        float _1058 = _1044 * 5.0;
        _1056 = as_type<int>(_1058);
    }
    int _1060 = _1056;
    float _1062 = _641 * _1024;
    out.m_62.x = _1034;
    out.m_62.y = _1030;
    out.m_62.z = _1046;
    out.m_62.w = _1048;
    out.m_64.x = _1050;
    out.m_64.y = _1052;
    out.m_64.z = _1054;
    out.m_64.w = _994;
    if (_980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3322 = as_type<float>(_1060);
        out.gl_Position.z = _3322;
    }
    if (_980)
    {
        out.m_47.x = 0.0;
    }
    out.m_66.x = _1062;
    if (_980)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1064 = -_793;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    float _1068 = -_795;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _1072 = -_831;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1078 = _1066 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1082 = _1070 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1086 = _1074 + _1084;
    float _1088 = _1078 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1092 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1090);
    bool _1094 = _1092 >= 0.0;
    float _1096 = _1086;
    if (_1094)
    {
        _1096 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1098 = _1096;
    int _1100 = as_type<int>(_1098);
    if (_1094)
    {
        out.m_47.x = 0.0;
    }
    if (_1094)
    {
        float _1102 = _1098 * 5.0;
        _1100 = as_type<int>(_1102);
    }
    int _1104 = _1100;
    if (_1094)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3415 = as_type<float>(_1104);
        out.gl_Position.z = _3415;
    }
    if (_1094)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1106 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1112 = _1106 * _1024;
    float _1114 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1116 = _1114 * 0.5;
    float _1118 = _1062 * _1110;
    float _1120 = _1112 * _1108;
    float _1122 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1124 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1122);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1124);
    float _1130 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1126);
    float _1132 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1134 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1136 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1138 = _639 + _1134;
    float _1140 = _711 + _1136;
    float _1142 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1146 = _1138 + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1150 = _1140 + _1148;
    float _1152 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1142);
    float _1154 = _1146 * _1146;
    float _1156 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1152);
    float _1158 = fma(_1150, _1150, _1154);
    float _1160 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1162 = sqrt(_1158);
    float _1164 = _705 + _1160;
    bool _1166 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = _1160;
    float _1170 = _1140;
    float _1172 = _1156;
    float _1174 = _1150;
    if (!_1166)
    {
        _1168 = _1140;
    }
    float _1176 = _1168;
    float _1178 = _1176;
    if (!_1166)
    {
        _1170 = _1138;
    }
    float _1180 = _1170;
    float _1182 = _1180;
    if (!_1166)
    {
        _1172 = _1164;
    }
    float _1184 = _1172;
    bool _1186 = !_1166;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1194 = _1162 + _1192;
        float _1196 = _1164 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = rsqrt(_1158);
        float _1200 = _1194 * _1190;
        float _1202 = _1200 * 0.15915493667125701904296875;
        float _1204 = _1202 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1202 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = fma(_1206, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1214 = _1198 * _1212;
        float _1216 = _1210 + (-1.0);
        float _1218 = fma(_1150, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1220 = fma(_1146, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1222 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = fma(_1164, _1210, _1222);
        _1188 = _1224;
        _1178 = _1218;
        _1182 = _1220;
    }
    float _1226 = _1188;
    float _1228 = _1178;
    float _1230 = _1182;
    float _1232 = -_884;
    float _1234 = _1232 + _1226;
    float _1236 = -_886;
    float _1238 = _1236 + _1228;
    float _1240 = -_926;
    float _1242 = _1240 + _1230;
    float _1244 = -_793;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1248 = -_795;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1252 = -_831;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1242);
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1258 = _1246 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1262 = _1250 + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1266 = _1254 + _1264;
    float _1268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1270 = _1258 * _1258;
    float _1272 = fma(_1262, _1262, _1270);
    float _1274 = fma(_1266, _1266, _1272);
    float _1276 = rsqrt(_1274);
    float _1278 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1280 = _1262 * _1278;
    float _1282 = _1266 * _1278;
    float _1284 = _1280 * _1280;
    float _1286 = _1282 * _1282;
    float _1288 = _1284 + _1286;
    float _1290 = sqrt(_1288);
    bool _1292 = _1290 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1296 = _1290 + _1294;
    float _1298 = _1158;
    float _1300 = _1288;
    float _1302 = _1296;
    float _1304 = _1258;
    float _1306 = _1280;
    if (_1292)
    {
        float _1308 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1298 = _1308;
    }
    float _1310 = _1298;
    if (_1292)
    {
        float _1312 = rsqrt(_1288);
        _1300 = _1312;
    }
    float _1314 = _1300;
    float _1316 = _1314;
    if (_1292)
    {
        float _1318 = _1296 * _1310;
        _1302 = _1318;
    }
    float _1320 = _1302;
    if (_1292)
    {
        float _1322 = _1320 * 0.15915493667125701904296875;
        _1174 = _1322;
    }
    float _1324 = _1174;
    float _1326 = _1266;
    if (_1292)
    {
        float _1328 = _1324 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        _1326 = _1330;
    }
    float _1332 = _1326;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = precise::max(0.0, _1334);
    float _1338 = _1310;
    float _1340 = _1336;
    if (_1292)
    {
        float _1342 = _1324 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        _1338 = _1344;
    }
    float _1346 = _1338;
    float _1348 = -_1278;
    float _1350 = -_1336;
    float _1352 = fma(_1258, _1348, _1350);
    if (_1292)
    {
        float _1354 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1304 = _1354;
    }
    float _1356 = _1304;
    float _1358 = sqrt(_1274);
    float _1360 = _1332;
    float _1362 = _1356;
    if (_1292)
    {
        float _1364 = fma(_1332, _1356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1360 = _1364;
    }
    float _1366 = _1360;
    float _1368 = _1366;
    if (!_1292)
    {
        _1362 = _1282;
    }
    float _1370 = _1362;
    float _1372 = _1370;
    if (_1292)
    {
        float _1374 = _1346 + (-1.0);
        _1340 = _1374;
    }
    float _1376 = _1340;
    float _1378 = _1376;
    if (_1292)
    {
        float _1380 = _1314 * _1366;
        _1042 = _1380;
    }
    float _1382 = _1042;
    if (!_1292)
    {
        _1368 = _1352;
    }
    float _1384 = _1368;
    float _1386 = _1384;
    if (_1292)
    {
        float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1388;
    }
    float _1390 = _1378;
    float _1392 = _1390;
    if (_1292)
    {
        float _1394 = _1280 * _1382;
        _1306 = _1394;
    }
    float _1396 = _1306;
    if (!_1292)
    {
        _1316 = _1284;
    }
    float _1398 = _1316;
    float _1400 = _1398;
    if (_1292)
    {
        float _1402 = _1282 * _1382;
        _1372 = _1402;
    }
    float _1404 = _1372;
    if (_1292)
    {
        float _1406 = fma(_1352, _1346, _1390);
        _1386 = _1406;
    }
    float _1408 = _1386;
    if (_1292)
    {
        float _1410 = _1396 * _1396;
        _1400 = _1410;
    }
    float _1412 = _1400;
    if (!_1292)
    {
        _1392 = _1286;
    }
    float _1414 = _1392;
    float _1416 = _1414;
    if (_1292)
    {
        float _1418 = _1404 * _1404;
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = fma(_1408, _1408, _1412);
    float _1424 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1426 = _1422 + _1420;
    float _1428 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1432 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1430);
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1424);
    float _1438 = rsqrt(_1426);
    float _1440 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1428);
    float _1442 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1444 = -_1434;
    float _1446 = _1444 + 1.0;
    float _1448 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1436);
    float _1450 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1440);
    float _1452 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1454 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1442);
    float _1456 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1460 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1452);
    float _1462 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1454);
    float _1464 = abs(_1446);
    float _1466 = log2(_1464);
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1470 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1460);
    float _1472 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1474 = _1438 * _1396;
    float _1476 = -_1468;
    float _1478 = fma(_1476, _1268, 1.0);
    float _1480 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1482 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1484 = _1438 * _1408;
    float _1486 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1488 = _1438 * _1404;
    float _1490 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1482);
    float _1492 = log2(_1478);
    float _1494 = -_1486;
    float _1496 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1494);
    float _1498 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1490);
    float _1500 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1502 = -_1488;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1496);
    float _1506 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1508 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1498);
    float _1510 = exp2(_1500);
    float _1512 = fma(_1504, -0.5, 0.5);
    float _1514 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1516 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1506);
    float _1518 = fma(_1504, 0.5, 0.5);
    float _1520 = _1484 + 1.0;
    float _1522 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1514);
    float _1524 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1516);
    float _1526 = 1.0 / _1508;
    float _1528 = fma(_1518, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1530 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1522);
    float _1532 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1524);
    float _1534 = _1492 * 0.693147182464599609375;
    float _1536 = fma(_1518, _1528, -0.212114393711090087890625);
    float _1538 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1530);
    float _1540 = sqrt(_1512);
    float _1542 = -_1484;
    float _1544 = fma(_1510, _1520, _1542);
    float _1546 = fma(_1518, _1536, 1.570728778839111328125);
    float _1548 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1550 = fma(_1544, 0.5, 0.5);
    float _1552 = _1532 * _1526;
    float _1554 = _1538 * _1526;
    float _1556 = fma(_1552, 0.5, 0.5);
    float _1558 = fma(_1554, -0.5, 0.5);
    float _1560 = _1540 * 0.636619746685028076171875;
    float3 _4181 = float3(_1556, _1558, _1548);
    float _1562 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4181, float3(0.0), isnan(_4181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4181, float3(0.0), isnan(_4181)), level(0.0)).x;
    float3 _4192 = float3(_1556, _1558, _1548);
    float4 _1565 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4192, float3(0.0), isnan(_4192)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4192, float3(0.0), isnan(_4192)), level(0.0)).xyzw;
    float _1567 = _1565.x;
    float _1569 = _1565.y;
    float _1571 = _1565.z;
    float _1573 = _1565.w;
    float _1575 = -_1546;
    float _1577 = fma(_1560, _1575, 1.0);
    float2 _4214 = float2(_1577, _1550);
    float3 _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4214, float2(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4214, float2(0.0), isnan(_4214)), level(0.0)).xyz;
    float _1583 = _1581.x;
    float _1585 = _1581.y;
    float _1587 = _1581.z;
    float _1589 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1591 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1593 = -_884;
    float _1595 = _705 + _1593;
    float _1597 = -_886;
    float _1599 = _711 + _1597;
    float _1601 = -_926;
    float _1603 = _639 + _1601;
    float _1605 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1591);
    float _1607 = exp2(_1589);
    float _1609 = -_793;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1595);
    float _1613 = -_795;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1599);
    float _1617 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1605);
    float _1619 = -_831;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1603);
    float _1623 = _1508 * 0.5;
    out.m_68.x = _1250;
    out.m_68.y = _1246;
    out.m_68.z = _1254;
    float _1625 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1617);
    float _1627 = _1532 + _1508;
    out.m_70.x = _1615;
    out.m_70.y = _1611;
    out.m_70.z = _1621;
    float _1629 = _1625 + _1508;
    float _1631 = _1627 * 0.5;
    float _1633 = fma(_1538, -0.5, _1623);
    float _1635 = _1629 * 0.5;
    float _1637 = -_1607;
    float _1639 = _1637 + 1.0;
    out.gl_Position.x = _1532;
    out.gl_Position.y = _1538;
    out.gl_Position.z = _1625;
    out.gl_Position.w = _1508;
    float _1641 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.x = _1631;
    out.m_72.y = _1633;
    out.m_72.z = _1635;
    out.m_72.w = _1508;
    float _1645 = -_1643;
    float _1647 = _1645 + 1.0;
    out.m_47.x = _1641;
    float _1649 = _1643 * _1562;
    float _1651 = _1573 * _1649;
    float _1653 = _1587 * _1649;
    float _1655 = fma(_1583, _1651, _1567);
    float _1657 = fma(_1585, _1651, _1569);
    float _1659 = _1573 * _1647;
    float _1661 = fma(_1573, _1653, _1571);
    out.m_74.x = _1655;
    out.m_74.y = _1657;
    out.m_74.z = _1661;
    out.m_74.w = _1659;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _599 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1718 = as_type<float>(_109);
        out.gl_Position.z = _1718;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1787 = as_type<float>(_145);
        out.gl_Position.z = _1787;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_54.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    float _183 = _147;
    float _185 = _149;
    if (!_161)
    {
        float _187 = _149 * _149;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_177;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_161)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_181;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_161;
    float _209 = _201;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _149 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _149);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = _243 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _251 = _243 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _253 = _243 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _255 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[8].x, _249);
    float _257 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[8].y, _251);
    float _259 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[8].z, _253);
    float _261 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[10].x, _255);
    bool _263 = !_161;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _149 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _185 = _283;
    }
    float _285 = _185;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _289 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[10].y, _257);
    float _291 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[10].z, _259);
    float _293 = fma(_285, _163, _261);
    float _295 = fma(_285, _165, _289);
    float _297 = fma(_285, _167, _291);
    float _299 = fma(_293, _151, _169);
    float _301 = fma(_295, _151, _171);
    float _303 = fma(_297, _151, _173);
    bool _305 = !_287;
    float _323;
    if (!_305)
    {
        float _307 = in.m_56.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_93);
        float _329 = 1.0 / _327;
        float _331 = _127 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = 1.0 / _337;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _357 = _353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _359 = 1.0 / _341;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = _333 + _361;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _369 = _355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _371 = _365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _375 = 1.0 / _345;
    float _377 = _363 * _351;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _333 + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = _333 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _333 + _387;
    out.m_58.x = _357;
    out.m_58.y = _369;
    out.m_58.z = _371;
    out.m_58.w = _367;
    float _391 = 1.0 / _349;
    bool _393 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _395 = isnan(_333);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = _381 * _359;
    bool _407 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _409 = isnan(_333);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = _385 * _375;
    float _421 = -_403;
    float _423 = _421 + 1.0;
    bool _425 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _427 = isnan(_333);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = _417 * _423;
    float _439 = -_417;
    float _441 = _439 + 1.0;
    float _443 = in.m_56.x;
    float _445 = _389 * _391;
    bool _447 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _449 = isnan(_333);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    bool _459 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _461 = isnan(_333);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -_457;
    float _473 = _471 + 1.0;
    float _475 = _469 * _441;
    float _477 = -_469;
    float _479 = _477 + 1.0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _493 = _457 * _479;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = fma(_483, _377, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _501 = fma(_487, _377, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _503 = _435 * _473;
    float _505 = fma(_491, _405, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _507 = fma(_497, _405, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _509 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _511 = _499 * _503;
    float _513 = _501 * _503;
    float _515 = -_435;
    float _517 = _515 + 1.0;
    float _519 = in.m_54.x;
    float _521 = in.m_54.y;
    float _523 = _509 * _443;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _525;
    float _529 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].x, _511);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    float _537 = fma(_527, _419, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _539 = fma(_505, _493, _529);
    float _541 = fma(_533, _419, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _551 = fma(_507, _493, _535);
    float _553 = trunc(_523);
    int _555 = int(_553);
    float _557 = fma(_545, _445, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _559 = fma(_541, _475, _539);
    float _561 = fma(_549, _445, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _563 = fma(_537, _475, _551);
    float _565 = fma(_557, _437, _559);
    float _567 = fma(_561, _437, _563);
    float _569 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].x, _565);
    float _571 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].y, _567);
    float _573 = _569 * _519;
    float _575 = _571 * _521;
    int _577 = _555 << 4;
    int _579 = _577 + 1968;
    bool _581 = !_373;
    float _597;
    if (!_581)
    {
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _585 = _443 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_93);
        float _603 = 1.0 / _601;
        float _605 = _127 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = in.m_56.w;
    float _611 = _301 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _613 = in.m_56.z;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _617 = _615 != 0;
    float _619 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].x, _611);
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _623 = _621 != 0;
    float _625 = in.m_56.y;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _629 = _627 != 0;
    float _631 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].z, _619);
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _635 = _633 != 0;
    float _637 = _443 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _639 = _631 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _641 = _573 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _643 = _443 > 0.5;
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _647 = -_195;
    int _649 = _643 ? as_type<int>(_647) : as_type<int>(_195);
    bool _651 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _653 = isnan(_607);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _663;
    bool _667 = _609 > 0.5;
    float _669 = _301 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _671 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _673 = isnan(_607);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _685 = _613 > 0.5;
    float _687 = _301 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _689 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].x, _669);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _693 = _625 > 0.5;
    float _695 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].x, _687);
    float _697 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].z, _689);
    float _699 = -_691;
    float _701 = fma(_637, 2.0, _699);
    float _703 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].z, _695);
    float _705 = _697 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _715 = _705 + _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _721 = _639 + _719;
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _725 = _711 + _723;
    float _727 = _715 * _715;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _733 = 1.0 / _709;
    float _735 = fma(_725, _725, _727);
    float _737 = _645 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _739 = !_617;
    float _741 = _739 ? _195 : as_type<float>(_649);
    float _743 = fma(_721, _721, _735);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _749 = 1.0 / _731;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _753 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[78].z, _717);
    float _755 = -_127;
    float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[76].x, _701);
    float _759 = rsqrt(_743);
    float _761 = _625 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _763 = fma(_761, -2.0, _751);
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _767 = 1.0 / _747;
    float _769 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _763);
    float _771 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[78].w, _765);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _783 = _607 + _781;
    float _785 = sqrt(_743);
    float _787 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _753);
    float _789 = _775 * _733;
    float _791 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _771);
    float _793 = _715 * _759;
    float _795 = _725 * _759;
    float _797 = fma(_789, _783, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _799 = -_661;
    float _801 = _799 + 1.0;
    float _803 = -_793;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    float _807 = _665 * _767;
    float _809 = _641 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _811 = -_795;
    float _813 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[18].w, _725);
    float _815 = _805 * _805;
    bool _817 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _819 = isnan(_607);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = _779 * _749;
    float _831 = _721 * _759;
    float _833 = _785 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _835 = fma(_813, _813, _815);
    bool _837 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _839 = isnan(_607);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -_827;
    float _851 = _849 + 1.0;
    float _853 = _827 * _801;
    float _855 = precise::min(_809, _833);
    uint _858 = uint(int(uint(_579) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[int(_860)][_862];
    int _866 = int(_858) + 1;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    int _870 = _866 & 3;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[int(_868)][_870];
    float _874 = -_847;
    float _876 = _874 + 1.0;
    float _878 = _847 * _851;
    float _880 = -_831;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _721);
    float _884 = _793 * _855;
    float _886 = _795 * _855;
    float _888 = _681 * _876;
    float _890 = fma(_882, _882, _835);
    float _892 = -_884;
    float _894 = _715 + _892;
    float _896 = -_886;
    float _898 = _725 + _896;
    float _900 = _797 * _888;
    float _902 = -_681;
    float _904 = _902 + 1.0;
    float _906 = _894 * _894;
    int _908 = _579 + 8;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    uint _912 = uint(int(uint(int(_910)) >> uint(2)));
    int _914 = int(_910) & 3;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[int(_912)][_914];
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _920 = _607 + _918;
    float _922 = sqrt(_890);
    float _924 = fma(_898, _898, _906);
    float _926 = _831 * _855;
    float _928 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[131].x, _900);
    float _930 = _715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _932 = -_205;
    int _934 = _693 ? as_type<int>(_932) : as_type<int>(_205);
    float _936 = -_926;
    float _938 = _721 + _936;
    float _940 = fma(_829, _920, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _942 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[28].x, _930);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _946 = _607 + _944;
    float _948 = fma(_938, _938, _924);
    bool _950 = !_623;
    float _952 = _950 ? _205 : as_type<float>(_934);
    float _954 = fma(_940, _878, _928);
    float _956 = fma(_807, _946, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _958 = _741 + 0.5;
    float _960 = _683 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _962 = sqrt(_948);
    float _964 = _952 + (-0.5);
    float _966 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[28].z, _942);
    float _968 = fma(_737, _958, _757);
    float _970 = _759 * _922;
    float _972 = -_960;
    float _974 = -_769;
    float _976 = fma(_972, _964, _974);
    float _978 = fma(_956, _853, _954);
    bool _980 = _966 >= 0.0;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _984 = -_205;
    int _986 = _667 ? as_type<int>(_984) : as_type<int>(_205);
    float _988 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[134].x, _978);
    out.m_60.w = _855;
    bool _990 = !_635;
    float _992 = _990 ? _205 : as_type<float>(_986);
    float _994 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _996 = _759 * _962;
    float _998 = -_195;
    int _1000 = _685 ? as_type<int>(_998) : as_type<int>(_195);
    float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1004 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1006 = -_992;
    float _1008 = _1006 + 0.5;
    bool _1010 = !_629;
    float _1012 = _1010 ? _195 : as_type<float>(_1000);
    float _1014 = -_787;
    float _1016 = _1014 + 1.0;
    float _1018 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1020 = -_791;
    float _1022 = _1020 + 1.0;
    float _1024 = _996 * _970;
    float _1026 = _1012 + 0.5;
    float _1028 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1030 = fma(_952, _1022, _976);
    float _1032 = -_1016;
    float _1034 = fma(_741, _1032, _968);
    float _1036 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1038 = _916 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1040 = _916;
    float _1042 = _855;
    if (_980)
    {
        _1040 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1044 = _1040;
    float _1046 = _1036 * _982;
    float _1048 = _1028 * _1002;
    float _1050 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1056 = as_type<int>(_1044);
    if (_980)
    {
        float _1058 = _1044 * 5.0;
        _1056 = as_type<int>(_1058);
    }
    int _1060 = _1056;
    float _1062 = _641 * _1024;
    out.m_62.x = _1034;
    out.m_62.y = _1030;
    out.m_62.z = _1046;
    out.m_62.w = _1048;
    out.m_64.x = _1050;
    out.m_64.y = _1052;
    out.m_64.z = _1054;
    out.m_64.w = _994;
    if (_980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3322 = as_type<float>(_1060);
        out.gl_Position.z = _3322;
    }
    if (_980)
    {
        out.m_47.x = 0.0;
    }
    out.m_66.x = _1062;
    if (_980)
    {
        return out;
    }
    float _1064 = -_793;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    float _1068 = -_795;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _1072 = -_831;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1078 = _1066 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1082 = _1070 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1086 = _1074 + _1084;
    float _1088 = _1078 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1092 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1090);
    bool _1094 = _1092 >= 0.0;
    float _1096 = _1086;
    if (_1094)
    {
        _1096 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1098 = _1096;
    int _1100 = as_type<int>(_1098);
    if (_1094)
    {
        out.m_47.x = 0.0;
    }
    if (_1094)
    {
        float _1102 = _1098 * 5.0;
        _1100 = as_type<int>(_1102);
    }
    int _1104 = _1100;
    if (_1094)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3415 = as_type<float>(_1104);
        out.gl_Position.z = _3415;
    }
    if (_1094)
    {
        return out;
    }
    float _1106 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1112 = _1106 * _1024;
    float _1114 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1116 = _1114 * 0.5;
    float _1118 = _1062 * _1110;
    float _1120 = _1112 * _1108;
    float _1122 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1124 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1122);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1124);
    float _1130 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1126);
    float _1132 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1134 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1136 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1138 = _639 + _1134;
    float _1140 = _711 + _1136;
    float _1142 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1146 = _1138 + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1150 = _1140 + _1148;
    float _1152 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1142);
    float _1154 = _1146 * _1146;
    float _1156 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1152);
    float _1158 = fma(_1150, _1150, _1154);
    float _1160 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1162 = sqrt(_1158);
    float _1164 = _705 + _1160;
    bool _1166 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = _1160;
    float _1170 = _1140;
    float _1172 = _1156;
    float _1174 = _1150;
    if (!_1166)
    {
        _1168 = _1140;
    }
    float _1176 = _1168;
    float _1178 = _1176;
    if (!_1166)
    {
        _1170 = _1138;
    }
    float _1180 = _1170;
    float _1182 = _1180;
    if (!_1166)
    {
        _1172 = _1164;
    }
    float _1184 = _1172;
    bool _1186 = !_1166;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1194 = _1162 + _1192;
        float _1196 = _1164 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = rsqrt(_1158);
        float _1200 = _1194 * _1190;
        float _1202 = _1200 * 0.15915493667125701904296875;
        float _1204 = _1202 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1202 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = fma(_1206, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1214 = _1198 * _1212;
        float _1216 = _1210 + (-1.0);
        float _1218 = fma(_1150, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1220 = fma(_1146, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1222 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = fma(_1164, _1210, _1222);
        _1188 = _1224;
        _1178 = _1218;
        _1182 = _1220;
    }
    float _1226 = _1188;
    float _1228 = _1178;
    float _1230 = _1182;
    float _1232 = -_884;
    float _1234 = _1232 + _1226;
    float _1236 = -_886;
    float _1238 = _1236 + _1228;
    float _1240 = -_926;
    float _1242 = _1240 + _1230;
    float _1244 = -_793;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1248 = -_795;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1252 = -_831;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1242);
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1258 = _1246 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1262 = _1250 + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1266 = _1254 + _1264;
    float _1268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1270 = _1258 * _1258;
    float _1272 = fma(_1262, _1262, _1270);
    float _1274 = fma(_1266, _1266, _1272);
    float _1276 = rsqrt(_1274);
    float _1278 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1280 = _1262 * _1278;
    float _1282 = _1266 * _1278;
    float _1284 = _1280 * _1280;
    float _1286 = _1282 * _1282;
    float _1288 = _1284 + _1286;
    float _1290 = sqrt(_1288);
    bool _1292 = _1290 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1296 = _1290 + _1294;
    float _1298 = _1158;
    float _1300 = _1288;
    float _1302 = _1296;
    float _1304 = _1258;
    float _1306 = _1280;
    if (_1292)
    {
        float _1308 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1298 = _1308;
    }
    float _1310 = _1298;
    if (_1292)
    {
        float _1312 = rsqrt(_1288);
        _1300 = _1312;
    }
    float _1314 = _1300;
    float _1316 = _1314;
    if (_1292)
    {
        float _1318 = _1296 * _1310;
        _1302 = _1318;
    }
    float _1320 = _1302;
    if (_1292)
    {
        float _1322 = _1320 * 0.15915493667125701904296875;
        _1174 = _1322;
    }
    float _1324 = _1174;
    float _1326 = _1266;
    if (_1292)
    {
        float _1328 = _1324 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        _1326 = _1330;
    }
    float _1332 = _1326;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = precise::max(0.0, _1334);
    float _1338 = _1310;
    float _1340 = _1336;
    if (_1292)
    {
        float _1342 = _1324 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        _1338 = _1344;
    }
    float _1346 = _1338;
    float _1348 = -_1278;
    float _1350 = -_1336;
    float _1352 = fma(_1258, _1348, _1350);
    if (_1292)
    {
        float _1354 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1304 = _1354;
    }
    float _1356 = _1304;
    float _1358 = sqrt(_1274);
    float _1360 = _1332;
    float _1362 = _1356;
    if (_1292)
    {
        float _1364 = fma(_1332, _1356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1360 = _1364;
    }
    float _1366 = _1360;
    float _1368 = _1366;
    if (!_1292)
    {
        _1362 = _1282;
    }
    float _1370 = _1362;
    float _1372 = _1370;
    if (_1292)
    {
        float _1374 = _1346 + (-1.0);
        _1340 = _1374;
    }
    float _1376 = _1340;
    float _1378 = _1376;
    if (_1292)
    {
        float _1380 = _1314 * _1366;
        _1042 = _1380;
    }
    float _1382 = _1042;
    if (!_1292)
    {
        _1368 = _1352;
    }
    float _1384 = _1368;
    float _1386 = _1384;
    if (_1292)
    {
        float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1388;
    }
    float _1390 = _1378;
    float _1392 = _1390;
    if (_1292)
    {
        float _1394 = _1280 * _1382;
        _1306 = _1394;
    }
    float _1396 = _1306;
    if (!_1292)
    {
        _1316 = _1284;
    }
    float _1398 = _1316;
    float _1400 = _1398;
    if (_1292)
    {
        float _1402 = _1282 * _1382;
        _1372 = _1402;
    }
    float _1404 = _1372;
    if (_1292)
    {
        float _1406 = fma(_1352, _1346, _1390);
        _1386 = _1406;
    }
    float _1408 = _1386;
    if (_1292)
    {
        float _1410 = _1396 * _1396;
        _1400 = _1410;
    }
    float _1412 = _1400;
    if (!_1292)
    {
        _1392 = _1286;
    }
    float _1414 = _1392;
    float _1416 = _1414;
    if (_1292)
    {
        float _1418 = _1404 * _1404;
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = fma(_1408, _1408, _1412);
    float _1424 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1426 = _1422 + _1420;
    float _1428 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1432 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1430);
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1424);
    float _1438 = rsqrt(_1426);
    float _1440 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1428);
    float _1442 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1444 = -_1434;
    float _1446 = _1444 + 1.0;
    float _1448 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1436);
    float _1450 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1440);
    float _1452 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1454 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1442);
    float _1456 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1460 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1452);
    float _1462 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1454);
    float _1464 = abs(_1446);
    float _1466 = log2(_1464);
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1470 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1460);
    float _1472 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1474 = _1438 * _1396;
    float _1476 = -_1468;
    float _1478 = fma(_1476, _1268, 1.0);
    float _1480 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1482 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1484 = _1438 * _1408;
    float _1486 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1488 = _1438 * _1404;
    float _1490 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1482);
    float _1492 = log2(_1478);
    float _1494 = -_1486;
    float _1496 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1494);
    float _1498 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1490);
    float _1500 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1502 = -_1488;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1496);
    float _1506 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1508 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1498);
    float _1510 = exp2(_1500);
    float _1512 = fma(_1504, -0.5, 0.5);
    float _1514 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1516 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1506);
    float _1518 = fma(_1504, 0.5, 0.5);
    float _1520 = _1484 + 1.0;
    float _1522 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1514);
    float _1524 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1516);
    float _1526 = 1.0 / _1508;
    float _1528 = fma(_1518, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1530 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1522);
    float _1532 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1524);
    float _1534 = _1492 * 0.693147182464599609375;
    float _1536 = fma(_1518, _1528, -0.212114393711090087890625);
    float _1538 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1530);
    float _1540 = sqrt(_1512);
    float _1542 = -_1484;
    float _1544 = fma(_1510, _1520, _1542);
    float _1546 = fma(_1518, _1536, 1.570728778839111328125);
    float _1548 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1550 = fma(_1544, 0.5, 0.5);
    float _1552 = _1532 * _1526;
    float _1554 = _1538 * _1526;
    float _1556 = fma(_1552, 0.5, 0.5);
    float _1558 = fma(_1554, -0.5, 0.5);
    float _1560 = _1540 * 0.636619746685028076171875;
    float3 _4181 = float3(_1556, _1558, _1548);
    float _1562 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4181, float3(0.0), isnan(_4181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4181, float3(0.0), isnan(_4181)), level(0.0)).x;
    float3 _4192 = float3(_1556, _1558, _1548);
    float4 _1565 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4192, float3(0.0), isnan(_4192)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4192, float3(0.0), isnan(_4192)), level(0.0)).xyzw;
    float _1567 = _1565.x;
    float _1569 = _1565.y;
    float _1571 = _1565.z;
    float _1573 = _1565.w;
    float _1575 = -_1546;
    float _1577 = fma(_1560, _1575, 1.0);
    float2 _4214 = float2(_1577, _1550);
    float3 _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4214, float2(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4214, float2(0.0), isnan(_4214)), level(0.0)).xyz;
    float _1583 = _1581.x;
    float _1585 = _1581.y;
    float _1587 = _1581.z;
    float _1589 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1591 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1593 = -_884;
    float _1595 = _705 + _1593;
    float _1597 = -_886;
    float _1599 = _711 + _1597;
    float _1601 = -_926;
    float _1603 = _639 + _1601;
    float _1605 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1591);
    float _1607 = exp2(_1589);
    float _1609 = -_793;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1595);
    float _1613 = -_795;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1599);
    float _1617 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1605);
    float _1619 = -_831;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1603);
    float _1623 = _1508 * 0.5;
    out.m_68.x = _1250;
    out.m_68.y = _1246;
    out.m_68.z = _1254;
    float _1625 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1617);
    float _1627 = _1532 + _1508;
    out.m_70.x = _1615;
    out.m_70.y = _1611;
    out.m_70.z = _1621;
    float _1629 = _1625 + _1508;
    float _1631 = _1627 * 0.5;
    float _1633 = fma(_1538, -0.5, _1623);
    float _1635 = _1629 * 0.5;
    float _1637 = -_1607;
    float _1639 = _1637 + 1.0;
    out.gl_Position.x = _1532;
    out.gl_Position.y = _1538;
    out.gl_Position.z = _1625;
    out.gl_Position.w = _1508;
    float _1641 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.x = _1631;
    out.m_72.y = _1633;
    out.m_72.z = _1635;
    out.m_72.w = _1508;
    float _1645 = -_1643;
    float _1647 = _1645 + 1.0;
    out.m_47.x = _1641;
    float _1649 = _1643 * _1562;
    float _1651 = _1573 * _1649;
    float _1653 = _1587 * _1649;
    float _1655 = fma(_1583, _1651, _1567);
    float _1657 = fma(_1585, _1651, _1569);
    float _1659 = _1573 * _1647;
    float _1661 = fma(_1573, _1653, _1571);
    out.m_74.x = _1655;
    out.m_74.y = _1657;
    out.m_74.z = _1661;
    out.m_74.w = _1659;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _599 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1718 = as_type<float>(_109);
        out.gl_Position.z = _1718;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1787 = as_type<float>(_145);
        out.gl_Position.z = _1787;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_54.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    float _183 = _147;
    float _185 = _149;
    if (!_161)
    {
        float _187 = _149 * _149;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_177;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_161)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_181;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_161;
    float _209 = _201;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _149 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _149);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = _243 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _251 = _243 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _253 = _243 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _255 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[8].x, _249);
    float _257 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[8].y, _251);
    float _259 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[8].z, _253);
    float _261 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[10].x, _255);
    bool _263 = !_161;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _149 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _185 = _283;
    }
    float _285 = _185;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _289 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[10].y, _257);
    float _291 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[10].z, _259);
    float _293 = fma(_285, _163, _261);
    float _295 = fma(_285, _165, _289);
    float _297 = fma(_285, _167, _291);
    float _299 = fma(_293, _151, _169);
    float _301 = fma(_295, _151, _171);
    float _303 = fma(_297, _151, _173);
    bool _305 = !_287;
    float _323;
    if (!_305)
    {
        float _307 = in.m_56.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_93);
        float _329 = 1.0 / _327;
        float _331 = _127 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = 1.0 / _337;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _357 = _353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _359 = 1.0 / _341;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = _333 + _361;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _369 = _355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _371 = _365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _375 = 1.0 / _345;
    float _377 = _363 * _351;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _333 + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = _333 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _333 + _387;
    out.m_58.x = _357;
    out.m_58.y = _369;
    out.m_58.z = _371;
    out.m_58.w = _367;
    float _391 = 1.0 / _349;
    bool _393 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _395 = isnan(_333);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = _381 * _359;
    bool _407 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _409 = isnan(_333);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = _385 * _375;
    float _421 = -_403;
    float _423 = _421 + 1.0;
    bool _425 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _427 = isnan(_333);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = _417 * _423;
    float _439 = -_417;
    float _441 = _439 + 1.0;
    float _443 = in.m_56.x;
    float _445 = _389 * _391;
    bool _447 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _449 = isnan(_333);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    bool _459 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _461 = isnan(_333);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -_457;
    float _473 = _471 + 1.0;
    float _475 = _469 * _441;
    float _477 = -_469;
    float _479 = _477 + 1.0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _493 = _457 * _479;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = fma(_483, _377, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _501 = fma(_487, _377, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _503 = _435 * _473;
    float _505 = fma(_491, _405, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _507 = fma(_497, _405, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _509 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _511 = _499 * _503;
    float _513 = _501 * _503;
    float _515 = -_435;
    float _517 = _515 + 1.0;
    float _519 = in.m_54.x;
    float _521 = in.m_54.y;
    float _523 = _509 * _443;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _525;
    float _529 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].x, _511);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    float _537 = fma(_527, _419, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _539 = fma(_505, _493, _529);
    float _541 = fma(_533, _419, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _551 = fma(_507, _493, _535);
    float _553 = trunc(_523);
    int _555 = int(_553);
    float _557 = fma(_545, _445, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _559 = fma(_541, _475, _539);
    float _561 = fma(_549, _445, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _563 = fma(_537, _475, _551);
    float _565 = fma(_557, _437, _559);
    float _567 = fma(_561, _437, _563);
    float _569 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].x, _565);
    float _571 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].y, _567);
    float _573 = _569 * _519;
    float _575 = _571 * _521;
    int _577 = _555 << 4;
    int _579 = _577 + 1968;
    bool _581 = !_373;
    float _597;
    if (!_581)
    {
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _585 = _443 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_93);
        float _603 = 1.0 / _601;
        float _605 = _127 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = in.m_56.w;
    float _611 = _301 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _613 = in.m_56.z;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _617 = _615 != 0;
    float _619 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].x, _611);
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _623 = _621 != 0;
    float _625 = in.m_56.y;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _629 = _627 != 0;
    float _631 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].z, _619);
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _635 = _633 != 0;
    float _637 = _443 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _639 = _631 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _641 = _573 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _643 = _443 > 0.5;
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _647 = -_195;
    int _649 = _643 ? as_type<int>(_647) : as_type<int>(_195);
    bool _651 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _653 = isnan(_607);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _663;
    bool _667 = _609 > 0.5;
    float _669 = _301 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _671 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _673 = isnan(_607);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _685 = _613 > 0.5;
    float _687 = _301 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _689 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].x, _669);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _693 = _625 > 0.5;
    float _695 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].x, _687);
    float _697 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].z, _689);
    float _699 = -_691;
    float _701 = fma(_637, 2.0, _699);
    float _703 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].z, _695);
    float _705 = _697 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _715 = _705 + _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _721 = _639 + _719;
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _725 = _711 + _723;
    float _727 = _715 * _715;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _733 = 1.0 / _709;
    float _735 = fma(_725, _725, _727);
    float _737 = _645 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _739 = !_617;
    float _741 = _739 ? _195 : as_type<float>(_649);
    float _743 = fma(_721, _721, _735);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _749 = 1.0 / _731;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _753 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[78].z, _717);
    float _755 = -_127;
    float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[76].x, _701);
    float _759 = rsqrt(_743);
    float _761 = _625 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _763 = fma(_761, -2.0, _751);
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _767 = 1.0 / _747;
    float _769 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _763);
    float _771 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[78].w, _765);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _783 = _607 + _781;
    float _785 = sqrt(_743);
    float _787 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _753);
    float _789 = _775 * _733;
    float _791 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _771);
    float _793 = _715 * _759;
    float _795 = _725 * _759;
    float _797 = fma(_789, _783, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _799 = -_661;
    float _801 = _799 + 1.0;
    float _803 = -_793;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    float _807 = _665 * _767;
    float _809 = _641 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _811 = -_795;
    float _813 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[18].w, _725);
    float _815 = _805 * _805;
    bool _817 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _819 = isnan(_607);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = _779 * _749;
    float _831 = _721 * _759;
    float _833 = _785 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _835 = fma(_813, _813, _815);
    bool _837 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _839 = isnan(_607);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -_827;
    float _851 = _849 + 1.0;
    float _853 = _827 * _801;
    float _855 = precise::min(_809, _833);
    uint _858 = uint(int(uint(_579) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[int(_860)][_862];
    int _866 = int(_858) + 1;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    int _870 = _866 & 3;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[int(_868)][_870];
    float _874 = -_847;
    float _876 = _874 + 1.0;
    float _878 = _847 * _851;
    float _880 = -_831;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _721);
    float _884 = _793 * _855;
    float _886 = _795 * _855;
    float _888 = _681 * _876;
    float _890 = fma(_882, _882, _835);
    float _892 = -_884;
    float _894 = _715 + _892;
    float _896 = -_886;
    float _898 = _725 + _896;
    float _900 = _797 * _888;
    float _902 = -_681;
    float _904 = _902 + 1.0;
    float _906 = _894 * _894;
    int _908 = _579 + 8;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    uint _912 = uint(int(uint(int(_910)) >> uint(2)));
    int _914 = int(_910) & 3;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[int(_912)][_914];
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _920 = _607 + _918;
    float _922 = sqrt(_890);
    float _924 = fma(_898, _898, _906);
    float _926 = _831 * _855;
    float _928 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[131].x, _900);
    float _930 = _715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _932 = -_205;
    int _934 = _693 ? as_type<int>(_932) : as_type<int>(_205);
    float _936 = -_926;
    float _938 = _721 + _936;
    float _940 = fma(_829, _920, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _942 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[28].x, _930);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _946 = _607 + _944;
    float _948 = fma(_938, _938, _924);
    bool _950 = !_623;
    float _952 = _950 ? _205 : as_type<float>(_934);
    float _954 = fma(_940, _878, _928);
    float _956 = fma(_807, _946, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _958 = _741 + 0.5;
    float _960 = _683 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _962 = sqrt(_948);
    float _964 = _952 + (-0.5);
    float _966 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[28].z, _942);
    float _968 = fma(_737, _958, _757);
    float _970 = _759 * _922;
    float _972 = -_960;
    float _974 = -_769;
    float _976 = fma(_972, _964, _974);
    float _978 = fma(_956, _853, _954);
    bool _980 = _966 >= 0.0;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _984 = -_205;
    int _986 = _667 ? as_type<int>(_984) : as_type<int>(_205);
    float _988 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[134].x, _978);
    out.m_60.w = _855;
    bool _990 = !_635;
    float _992 = _990 ? _205 : as_type<float>(_986);
    float _994 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _996 = _759 * _962;
    float _998 = -_195;
    int _1000 = _685 ? as_type<int>(_998) : as_type<int>(_195);
    float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1004 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1006 = -_992;
    float _1008 = _1006 + 0.5;
    bool _1010 = !_629;
    float _1012 = _1010 ? _195 : as_type<float>(_1000);
    float _1014 = -_787;
    float _1016 = _1014 + 1.0;
    float _1018 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1020 = -_791;
    float _1022 = _1020 + 1.0;
    float _1024 = _996 * _970;
    float _1026 = _1012 + 0.5;
    float _1028 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1030 = fma(_952, _1022, _976);
    float _1032 = -_1016;
    float _1034 = fma(_741, _1032, _968);
    float _1036 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1038 = _916 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1040 = _916;
    float _1042 = _855;
    if (_980)
    {
        _1040 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1044 = _1040;
    float _1046 = _1036 * _982;
    float _1048 = _1028 * _1002;
    float _1050 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1056 = as_type<int>(_1044);
    if (_980)
    {
        float _1058 = _1044 * 5.0;
        _1056 = as_type<int>(_1058);
    }
    int _1060 = _1056;
    float _1062 = _641 * _1024;
    out.m_62.x = _1034;
    out.m_62.y = _1030;
    out.m_62.z = _1046;
    out.m_62.w = _1048;
    out.m_64.x = _1050;
    out.m_64.y = _1052;
    out.m_64.z = _1054;
    out.m_64.w = _994;
    if (_980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3322 = as_type<float>(_1060);
        out.gl_Position.z = _3322;
    }
    if (_980)
    {
        out.m_47.x = 0.0;
    }
    out.m_66.x = _1062;
    if (_980)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1064 = -_793;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    float _1068 = -_795;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _1072 = -_831;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1078 = _1066 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1082 = _1070 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1086 = _1074 + _1084;
    float _1088 = _1078 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1092 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1090);
    bool _1094 = _1092 >= 0.0;
    float _1096 = _1086;
    if (_1094)
    {
        _1096 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1098 = _1096;
    int _1100 = as_type<int>(_1098);
    if (_1094)
    {
        out.m_47.x = 0.0;
    }
    if (_1094)
    {
        float _1102 = _1098 * 5.0;
        _1100 = as_type<int>(_1102);
    }
    int _1104 = _1100;
    if (_1094)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3415 = as_type<float>(_1104);
        out.gl_Position.z = _3415;
    }
    if (_1094)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1106 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1112 = _1106 * _1024;
    float _1114 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1116 = _1114 * 0.5;
    float _1118 = _1062 * _1110;
    float _1120 = _1112 * _1108;
    float _1122 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1124 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1122);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1124);
    float _1130 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1126);
    float _1132 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1134 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1136 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1138 = _639 + _1134;
    float _1140 = _711 + _1136;
    float _1142 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1146 = _1138 + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1150 = _1140 + _1148;
    float _1152 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1142);
    float _1154 = _1146 * _1146;
    float _1156 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1152);
    float _1158 = fma(_1150, _1150, _1154);
    float _1160 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1162 = sqrt(_1158);
    float _1164 = _705 + _1160;
    bool _1166 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = _1160;
    float _1170 = _1140;
    float _1172 = _1156;
    float _1174 = _1150;
    if (!_1166)
    {
        _1168 = _1140;
    }
    float _1176 = _1168;
    float _1178 = _1176;
    if (!_1166)
    {
        _1170 = _1138;
    }
    float _1180 = _1170;
    float _1182 = _1180;
    if (!_1166)
    {
        _1172 = _1164;
    }
    float _1184 = _1172;
    bool _1186 = !_1166;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1194 = _1162 + _1192;
        float _1196 = _1164 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = rsqrt(_1158);
        float _1200 = _1194 * _1190;
        float _1202 = _1200 * 0.15915493667125701904296875;
        float _1204 = _1202 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1202 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = fma(_1206, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1214 = _1198 * _1212;
        float _1216 = _1210 + (-1.0);
        float _1218 = fma(_1150, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1220 = fma(_1146, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1222 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = fma(_1164, _1210, _1222);
        _1188 = _1224;
        _1178 = _1218;
        _1182 = _1220;
    }
    float _1226 = _1188;
    float _1228 = _1178;
    float _1230 = _1182;
    float _1232 = -_884;
    float _1234 = _1232 + _1226;
    float _1236 = -_886;
    float _1238 = _1236 + _1228;
    float _1240 = -_926;
    float _1242 = _1240 + _1230;
    float _1244 = -_793;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1248 = -_795;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1252 = -_831;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1242);
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1258 = _1246 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1262 = _1250 + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1266 = _1254 + _1264;
    float _1268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1270 = _1258 * _1258;
    float _1272 = fma(_1262, _1262, _1270);
    float _1274 = fma(_1266, _1266, _1272);
    float _1276 = rsqrt(_1274);
    float _1278 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1280 = _1262 * _1278;
    float _1282 = _1266 * _1278;
    float _1284 = _1280 * _1280;
    float _1286 = _1282 * _1282;
    float _1288 = _1284 + _1286;
    float _1290 = sqrt(_1288);
    bool _1292 = _1290 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1296 = _1290 + _1294;
    float _1298 = _1158;
    float _1300 = _1288;
    float _1302 = _1296;
    float _1304 = _1258;
    float _1306 = _1280;
    if (_1292)
    {
        float _1308 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1298 = _1308;
    }
    float _1310 = _1298;
    if (_1292)
    {
        float _1312 = rsqrt(_1288);
        _1300 = _1312;
    }
    float _1314 = _1300;
    float _1316 = _1314;
    if (_1292)
    {
        float _1318 = _1296 * _1310;
        _1302 = _1318;
    }
    float _1320 = _1302;
    if (_1292)
    {
        float _1322 = _1320 * 0.15915493667125701904296875;
        _1174 = _1322;
    }
    float _1324 = _1174;
    float _1326 = _1266;
    if (_1292)
    {
        float _1328 = _1324 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        _1326 = _1330;
    }
    float _1332 = _1326;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = precise::max(0.0, _1334);
    float _1338 = _1310;
    float _1340 = _1336;
    if (_1292)
    {
        float _1342 = _1324 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        _1338 = _1344;
    }
    float _1346 = _1338;
    float _1348 = -_1278;
    float _1350 = -_1336;
    float _1352 = fma(_1258, _1348, _1350);
    if (_1292)
    {
        float _1354 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1304 = _1354;
    }
    float _1356 = _1304;
    float _1358 = sqrt(_1274);
    float _1360 = _1332;
    float _1362 = _1356;
    if (_1292)
    {
        float _1364 = fma(_1332, _1356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1360 = _1364;
    }
    float _1366 = _1360;
    float _1368 = _1366;
    if (!_1292)
    {
        _1362 = _1282;
    }
    float _1370 = _1362;
    float _1372 = _1370;
    if (_1292)
    {
        float _1374 = _1346 + (-1.0);
        _1340 = _1374;
    }
    float _1376 = _1340;
    float _1378 = _1376;
    if (_1292)
    {
        float _1380 = _1314 * _1366;
        _1042 = _1380;
    }
    float _1382 = _1042;
    if (!_1292)
    {
        _1368 = _1352;
    }
    float _1384 = _1368;
    float _1386 = _1384;
    if (_1292)
    {
        float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1388;
    }
    float _1390 = _1378;
    float _1392 = _1390;
    if (_1292)
    {
        float _1394 = _1280 * _1382;
        _1306 = _1394;
    }
    float _1396 = _1306;
    if (!_1292)
    {
        _1316 = _1284;
    }
    float _1398 = _1316;
    float _1400 = _1398;
    if (_1292)
    {
        float _1402 = _1282 * _1382;
        _1372 = _1402;
    }
    float _1404 = _1372;
    if (_1292)
    {
        float _1406 = fma(_1352, _1346, _1390);
        _1386 = _1406;
    }
    float _1408 = _1386;
    if (_1292)
    {
        float _1410 = _1396 * _1396;
        _1400 = _1410;
    }
    float _1412 = _1400;
    if (!_1292)
    {
        _1392 = _1286;
    }
    float _1414 = _1392;
    float _1416 = _1414;
    if (_1292)
    {
        float _1418 = _1404 * _1404;
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = fma(_1408, _1408, _1412);
    float _1424 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1426 = _1422 + _1420;
    float _1428 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1432 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1430);
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1424);
    float _1438 = rsqrt(_1426);
    float _1440 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1428);
    float _1442 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1444 = -_1434;
    float _1446 = _1444 + 1.0;
    float _1448 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1436);
    float _1450 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1440);
    float _1452 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1454 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1442);
    float _1456 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1460 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1452);
    float _1462 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1454);
    float _1464 = abs(_1446);
    float _1466 = log2(_1464);
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1470 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1460);
    float _1472 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1474 = _1438 * _1396;
    float _1476 = -_1468;
    float _1478 = fma(_1476, _1268, 1.0);
    float _1480 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1482 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1484 = _1438 * _1408;
    float _1486 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1488 = _1438 * _1404;
    float _1490 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1482);
    float _1492 = log2(_1478);
    float _1494 = -_1486;
    float _1496 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1494);
    float _1498 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1490);
    float _1500 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1502 = -_1488;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1496);
    float _1506 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1508 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1498);
    float _1510 = exp2(_1500);
    float _1512 = fma(_1504, -0.5, 0.5);
    float _1514 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1516 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1506);
    float _1518 = fma(_1504, 0.5, 0.5);
    float _1520 = _1484 + 1.0;
    float _1522 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1514);
    float _1524 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1516);
    float _1526 = 1.0 / _1508;
    float _1528 = fma(_1518, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1530 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1522);
    float _1532 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1524);
    float _1534 = _1492 * 0.693147182464599609375;
    float _1536 = fma(_1518, _1528, -0.212114393711090087890625);
    float _1538 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1530);
    float _1540 = sqrt(_1512);
    float _1542 = -_1484;
    float _1544 = fma(_1510, _1520, _1542);
    float _1546 = fma(_1518, _1536, 1.570728778839111328125);
    float _1548 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1550 = fma(_1544, 0.5, 0.5);
    float _1552 = _1532 * _1526;
    float _1554 = _1538 * _1526;
    float _1556 = fma(_1552, 0.5, 0.5);
    float _1558 = fma(_1554, -0.5, 0.5);
    float _1560 = _1540 * 0.636619746685028076171875;
    float3 _4181 = float3(_1556, _1558, _1548);
    float _1562 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4181, float3(0.0), isnan(_4181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4181, float3(0.0), isnan(_4181)), level(0.0)).x;
    float3 _4192 = float3(_1556, _1558, _1548);
    float4 _1565 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4192, float3(0.0), isnan(_4192)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4192, float3(0.0), isnan(_4192)), level(0.0)).xyzw;
    float _1567 = _1565.x;
    float _1569 = _1565.y;
    float _1571 = _1565.z;
    float _1573 = _1565.w;
    float _1575 = -_1546;
    float _1577 = fma(_1560, _1575, 1.0);
    float2 _4214 = float2(_1577, _1550);
    float3 _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4214, float2(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4214, float2(0.0), isnan(_4214)), level(0.0)).xyz;
    float _1583 = _1581.x;
    float _1585 = _1581.y;
    float _1587 = _1581.z;
    float _1589 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1591 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1593 = -_884;
    float _1595 = _705 + _1593;
    float _1597 = -_886;
    float _1599 = _711 + _1597;
    float _1601 = -_926;
    float _1603 = _639 + _1601;
    float _1605 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1591);
    float _1607 = exp2(_1589);
    float _1609 = -_793;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1595);
    float _1613 = -_795;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1599);
    float _1617 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1605);
    float _1619 = -_831;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1603);
    float _1623 = _1508 * 0.5;
    out.m_68.x = _1250;
    out.m_68.y = _1246;
    out.m_68.z = _1254;
    float _1625 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1617);
    float _1627 = _1532 + _1508;
    out.m_70.x = _1615;
    out.m_70.y = _1611;
    out.m_70.z = _1621;
    float _1629 = _1625 + _1508;
    float _1631 = _1627 * 0.5;
    float _1633 = fma(_1538, -0.5, _1623);
    float _1635 = _1629 * 0.5;
    float _1637 = -_1607;
    float _1639 = _1637 + 1.0;
    out.gl_Position.x = _1532;
    out.gl_Position.y = _1538;
    out.gl_Position.z = _1625;
    out.gl_Position.w = _1508;
    float _1641 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.x = _1631;
    out.m_72.y = _1633;
    out.m_72.z = _1635;
    out.m_72.w = _1508;
    float _1645 = -_1643;
    float _1647 = _1645 + 1.0;
    out.m_47.x = _1641;
    float _1649 = _1643 * _1562;
    float _1651 = _1573 * _1649;
    float _1653 = _1587 * _1649;
    float _1655 = fma(_1583, _1651, _1567);
    float _1657 = fma(_1585, _1651, _1569);
    float _1659 = _1573 * _1647;
    float _1661 = fma(_1573, _1653, _1571);
    out.m_74.x = _1655;
    out.m_74.y = _1657;
    out.m_74.z = _1661;
    out.m_74.w = _1659;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

