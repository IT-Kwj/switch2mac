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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_52 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _397 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1370 = as_type<float>(_99);
        out.gl_Position.z = _1370;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = 0.0;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1438 = as_type<float>(_137);
        out.gl_Position.z = _1438;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = in.m_52.x;
    float _143 = in.m_52.y;
    float _145 = in.m_52.z;
    int _147 = as_type<int>(_139) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_139) & 2;
    bool _153 = _151 != 0;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _159 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _161 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _157);
    float _165 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _159);
    float _167 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _171 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _173 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_149;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_153;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_155;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_85);
        float _207 = 1.0 / _205;
        float _209 = _117 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = _211 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _211 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _233;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _227;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _253 = 1.0 / _235;
    float _255 = 1.0 / _231;
    float _257 = _215 * _249;
    bool _259 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = isnan(_211);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -_247;
    float _273 = _271 + 1.0;
    float _275 = _269 * _273;
    float _277 = _219 * _253;
    bool _279 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_211);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_269;
    float _293 = _291 + 1.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = _289 * _293;
    float _301 = -_289;
    float _303 = _301 + 1.0;
    float _305 = _223 * _255;
    bool _307 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_211);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = fma(_297, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_321, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = _317 * _303;
    float _337 = fma(_327, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = fma(_331, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = -_317;
    float _343 = _341 + 1.0;
    float _345 = _333 * _335;
    float _347 = _337 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _355;
    float _359 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _361 = fma(_351, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _363 = fma(_323, _299, _353);
    float _365 = fma(_357, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _367 = fma(_339, _299, _359);
    float _369 = fma(_361, _275, _363);
    float _371 = fma(_365, _275, _367);
    float _373 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _369);
    float _375 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _371);
    bool _377 = !_251;
    float _395;
    if (!_377)
    {
        float _379 = in.m_54.x;
        float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _383 = _379 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _387 = _385 * _381;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = true;
    }
    else
    {
        float _399 = float(_85);
        float _401 = 1.0 / _399;
        float _403 = _117 * _401;
        _395 = _403;
    }
    _397 = false;
    float _405 = _395;
    float _407 = in.m_42.x;
    float _409 = in.m_42.y;
    float _411 = in.m_42.z;
    float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _415 = in.m_54.x;
    float _417 = in.m_54.y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _419;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _429 = _427 != 0;
    float _431 = 1.0 / _421;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _435 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _437 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _439 = _417 > 0.5;
    float _441 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _443 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _435);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _447 = _405 + _445;
    float _449 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _451 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _441);
    float _453 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
    float _455 = _447 * _431;
    bool _457 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _459 = isnan(_405);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    bool _471 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _473 = isnan(_405);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _449);
    float _485 = _469 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = -_481;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _491;
    float _495 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _497 = _467 * _489;
    float _499 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _501 = _485 + _499;
    float _503 = fma(_493, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _509;
    float _513 = _453 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _515 = _503 * _497;
    float _517 = -_181;
    int _519 = _439 ? as_type<int>(_517) : as_type<int>(_181);
    float _521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _523 = _495 + _521;
    float _525 = _501 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _527 = fma(_507, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _529 = fma(_511, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _531 = !_429;
    float _533 = _531 ? _181 : as_type<float>(_519);
    float _535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _537 = _513 + _535;
    float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[28].x, _525);
    float _541 = _527 * _497;
    float _543 = -_467;
    float _545 = _543 + 1.0;
    float _547 = _529 * _497;
    bool _549 = _415 > 0.5;
    float _551 = -_533;
    float _553 = _551 + 0.5;
    float _555 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[28].z, _539);
    float _557 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].x, _541);
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].y, _515);
    float _561 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].z, _547);
    float _563 = _501 * _501;
    float _565 = -_177;
    int _567 = _549 ? as_type<int>(_565) : as_type<int>(_177);
    float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _571 = _555 >= 0.0;
    float _573 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[108].x, _557);
    float _575 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[108].y, _559);
    float _577 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[108].z, _561);
    float _579 = fma(_523, _523, _563);
    bool _581 = !_425;
    float _583 = _581 ? _177 : as_type<float>(_567);
    float _585 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _587 = fma(_537, _537, _579);
    float _589 = _583 + 0.5;
    float _591 = _553 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _593 = rsqrt(_587);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _599 = _589 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _601 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _603 = 0.0;
    int _605 = as_type<int>(_601);
    if (_571)
    {
        _603 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _607 = _603;
    float _609 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _611 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _599 * _413;
    float _615 = _591 * _569;
    float _617 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _621 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_571)
    {
        float _629 = _607 * 5.0;
        _605 = as_type<int>(_629);
    }
    int _631 = _605;
    out.m_56.x = _613;
    out.m_56.y = _615;
    float _633 = _501 * _593;
    float _635 = _523 * _593;
    out.m_58.x = _621;
    out.m_58.y = _623;
    out.m_58.z = _625;
    out.m_60.x = _627;
    out.m_60.y = _611;
    out.m_60.z = _617;
    out.m_60.w = _619;
    if (_571)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2305 = as_type<float>(_631);
        out.gl_Position.z = _2305;
    }
    if (_571)
    {
        out.m_45.x = 0.0;
    }
    if (_571)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _637 = -_633;
    float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _641 = _537 * _593;
    float _643 = -_635;
    float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[18].w, _495);
    float _647 = -_633;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _501);
    float _651 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _653 = _639 + _651;
    float _655 = -_641;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _513);
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _661 = _645 + _659;
    float _663 = -_635;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _667 = _653 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _671 = _657 + _669;
    float _673 = _649 * _649;
    float _675 = in.m_62.x;
    float _677 = in.m_62.y;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[28].x, _667);
    float _681 = -_641;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _537);
    float _685 = fma(_665, _665, _673);
    float _687 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[28].z, _679);
    float _689 = fma(_683, _683, _685);
    bool _691 = _687 >= 0.0;
    float _693 = sqrt(_689);
    float _695 = _671;
    if (_691)
    {
        _695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _697 = _695;
    int _699 = as_type<int>(_697);
    if (_691)
    {
        out.m_45.x = 0.0;
    }
    float _701 = _373 * _675;
    float _703 = _375 * _677;
    float _705 = _593 * _693;
    if (_691)
    {
        float _707 = _697 * 5.0;
        _699 = as_type<int>(_707);
    }
    int _709 = _699;
    if (_691)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2447 = as_type<float>(_709);
        out.gl_Position.z = _2447;
    }
    if (_691)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _711 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _713 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _719 = _711 * _705;
    float _721 = _713 * _705;
    float _723 = _705 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _725 = _723 * 0.5;
    float _727 = _715 * _719;
    float _729 = _717 * _721;
    float _731 = _727 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = _727 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _735 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _737 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _741 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[24].z, _737);
    float _743 = _739 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _745 = _741 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _747 = _513 + _743;
    float _749 = _495 + _745;
    float _751 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _753 = _747 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _757 = _749 + _755;
    float _759 = _753 * _753;
    float _761 = fma(_757, _757, _759);
    float _763 = _727 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _765 = sqrt(_761);
    float _767 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _763);
    float _769 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[25].z, _767);
    float _771 = _769 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _773 = _485 + _771;
    bool _775 = _765 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _777 = _727;
    float _779 = _729;
    float _781 = _725;
    if (!_775)
    {
        _777 = _749;
    }
    float _783 = _777;
    float _785 = _783;
    if (!_775)
    {
        _779 = _747;
    }
    float _787 = _779;
    float _789 = _787;
    if (!_775)
    {
        _781 = _773;
    }
    float _791 = _781;
    bool _793 = !_775;
    float _795 = _791;
    if (!_793)
    {
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _799 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _801 = _765 + _799;
        float _803 = rsqrt(_761);
        float _805 = _801 * _797;
        float _807 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _809 = _805 * 0.15915493667125701904296875;
        float _811 = _809 * 6.283185482025146484375;
        float _813 = sin(_811);
        float _815 = _809 * 6.283185482025146484375;
        float _817 = cos(_815);
        float _819 = fma(_813, _807, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _821 = _803 * _819;
        float _823 = _817 + (-1.0);
        float _825 = fma(_757, _821, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _827 = fma(_753, _821, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _829 = _823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _831 = fma(_773, _817, _829);
        _795 = _831;
        _785 = _825;
        _789 = _827;
    }
    float _833 = _795;
    float _835 = _785;
    float _837 = _789;
    float _839 = -_485;
    float _841 = _839 + _833;
    float _843 = -_495;
    float _845 = _843 + _835;
    float _847 = -_513;
    float _849 = _847 + _837;
    float _851 = _841 * _841;
    float _853 = fma(_845, _845, _851);
    float _855 = fma(_849, _849, _853);
    float _857 = sqrt(_855);
    bool _859 = _857 > 0.0;
    bool _861 = !_859;
    float _863 = _833;
    float _865 = _835;
    float _867 = _837;
    float _869 = _849;
    if (!_861)
    {
        float _871 = _171 * _171;
        float _873 = fma(_169, _169, _871);
        float _875 = fma(_173, _173, _873);
        float _877 = rsqrt(_855);
        float _879 = sqrt(_875);
        float _881 = _845 * _877;
        float _883 = _841 * _877;
        float _885 = _849 * _877;
        bool _887 = _879 > 0.0;
        bool _889 = !_887;
        if (!_889)
        {
            float _891 = rsqrt(_875);
            float _893 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _895 = _171 * _891;
            float _897 = _169 * _891;
            float _899 = _883 * _895;
            float _901 = _173 * _891;
            float _903 = fma(_881, _897, _899);
            float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _907 = fma(_885, _901, _903);
            float _909 = _907 * _905;
            float _911 = fma(_169, _909, _835);
            float _913 = fma(_171, _909, _833);
            float _915 = fma(_173, _909, _837);
            _863 = _913;
            _865 = _911;
            _867 = _915;
            _869 = _903;
        }
    }
    float _917 = _863;
    float _919 = _865;
    float _921 = _867;
    float _923 = _869;
    float _925 = -_633;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _929 = -_635;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    float _933 = -_641;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _939 = _927 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _931 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _947 = _935 + _945;
    float _949 = _939 * _939;
    float _951 = fma(_943, _943, _949);
    float _953 = fma(_947, _947, _951);
    float _955 = rsqrt(_953);
    float _957 = _955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _959 = _943 * _957;
    float _961 = _947 * _957;
    float _963 = _959 * _959;
    float _965 = _961 * _961;
    float _967 = _963 + _965;
    float _969 = sqrt(_967);
    bool _971 = _969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = _969 + _973;
    float _977 = _947;
    float _979 = _919;
    float _981 = _975;
    float _983 = _923;
    float _985 = _939;
    float _987 = _959;
    if (_971)
    {
        float _989 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _989;
    }
    float _991 = _977;
    if (_971)
    {
        float _993 = rsqrt(_967);
        _979 = _993;
    }
    float _995 = _979;
    float _997 = _995;
    if (_971)
    {
        float _999 = _975 * _991;
        _981 = _999;
    }
    float _1001 = _981;
    if (_971)
    {
        float _1003 = _1001 * 0.15915493667125701904296875;
        _983 = _1003;
    }
    float _1005 = _983;
    float _1007 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1009 = _955;
    if (_971)
    {
        float _1011 = _1005 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        _1009 = _1013;
    }
    float _1015 = _1009;
    float _1017 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1019 = precise::max(0.0, _1017);
    float _1021 = _951;
    float _1023 = _1017;
    float _1025 = _1019;
    if (_971)
    {
        float _1027 = _1005 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        _1021 = _1029;
    }
    float _1031 = _1021;
    float _1033 = -_957;
    float _1035 = -_1019;
    float _1037 = fma(_939, _1033, _1035);
    if (_971)
    {
        float _1039 = _1037 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1023 = _1039;
    }
    float _1041 = _1023;
    float _1043 = sqrt(_953);
    float _1045 = _1015;
    float _1047 = _1041;
    if (_971)
    {
        float _1049 = fma(_1015, _1041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _985 = _1049;
    }
    float _1051 = _985;
    float _1053 = _1051;
    if (!_971)
    {
        _1045 = _961;
    }
    float _1055 = _1045;
    float _1057 = _1055;
    if (_971)
    {
        float _1059 = _1031 + (-1.0);
        _1047 = _1059;
    }
    float _1061 = _1047;
    float _1063 = _1061;
    if (_971)
    {
        float _1065 = _995 * _1051;
        _1053 = _1065;
    }
    float _1067 = _1053;
    if (!_971)
    {
        _997 = _1037;
    }
    float _1069 = _997;
    float _1071 = _1069;
    if (_971)
    {
        float _1073 = _1061 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1025 = _1073;
    }
    float _1075 = _1025;
    float _1077 = _1075;
    if (_971)
    {
        float _1079 = _959 * _1067;
        _987 = _1079;
    }
    float _1081 = _987;
    if (!_971)
    {
        _1063 = _963;
    }
    float _1083 = _1063;
    float _1085 = _1083;
    if (_971)
    {
        float _1087 = _961 * _1067;
        _1057 = _1087;
    }
    float _1089 = _1057;
    if (_971)
    {
        float _1091 = fma(_1037, _1031, _1075);
        _1071 = _1091;
    }
    float _1093 = _1071;
    if (_971)
    {
        float _1095 = _1081 * _1081;
        _1085 = _1095;
    }
    float _1097 = _1085;
    if (!_971)
    {
        _1077 = _965;
    }
    float _1099 = _1077;
    float _1101 = _1099;
    if (_971)
    {
        float _1103 = _1089 * _1089;
        _1101 = _1103;
    }
    float _1105 = _1101;
    float _1107 = fma(_1093, _1093, _1097);
    float _1109 = _927 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1111 = _1107 + _1105;
    float _1113 = _927 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1115 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1117 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1115);
    float _1119 = precise::clamp(_1117, 0.0, 1.0);
    float _1121 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1109);
    float _1123 = rsqrt(_1111);
    float _1125 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1113);
    float _1127 = _927 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = -_1119;
    float _1131 = _1129 + 1.0;
    float _1133 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1125);
    float _1135 = _927 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1137 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1139 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1141 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1135);
    float _1143 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1137);
    float _1145 = abs(_1131);
    float _1147 = log2(_1145);
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1151 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1141);
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1155 = _1123 * _1081;
    float _1157 = -_1149;
    float _1159 = fma(_1157, _1007, 1.0);
    float _1161 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1121);
    float _1163 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1167 = _1123 * _1093;
    float _1169 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1171 = _1123 * _1089;
    float _1173 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1165);
    float _1175 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1177 = -_1169;
    float _1179 = fma(_1167, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1177);
    float _1181 = log2(_1159);
    float _1183 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1173);
    float _1185 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1187 = -_1171;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1179);
    float _1191 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1183);
    float _1195 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1197 = fma(_1189, -0.5, 0.5);
    float _1199 = exp2(_1185);
    float _1201 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1191);
    float _1203 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1195);
    float _1205 = fma(_1189, 0.5, 0.5);
    float _1207 = _1167 + 1.0;
    float _1209 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1201);
    float _1211 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1203);
    float _1213 = fma(_1205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1215 = 1.0 / _1193;
    float _1217 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1209);
    float _1219 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1211);
    float _1221 = fma(_1205, _1213, -0.212114393711090087890625);
    float _1223 = _1181 * 0.693147182464599609375;
    float _1225 = fma(_1205, _1221, 1.570728778839111328125);
    float _1227 = sqrt(_1197);
    float _1229 = -_1167;
    float _1231 = fma(_1199, _1207, _1229);
    float _1233 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1235 = fma(_1231, 0.5, 0.5);
    float _1237 = _1217 * _1215;
    float _1239 = _1219 * _1215;
    float _1241 = fma(_1237, 0.5, 0.5);
    float _1243 = fma(_1239, -0.5, 0.5);
    float _1245 = _1227 * 0.636619746685028076171875;
    float3 _3333 = float3(_1241, _1243, _1233);
    float _1247 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3333, float3(0.0), isnan(_3333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3333, float3(0.0), isnan(_3333)), level(0.0)).x;
    float _1249 = -_1225;
    float _1251 = fma(_1245, _1249, 1.0);
    float3 _3349 = float3(_1241, _1243, _1233);
    float4 _1254 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3349, float3(0.0), isnan(_3349)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3349, float3(0.0), isnan(_3349)), level(0.0)).xyzw;
    float _1256 = _1254.x;
    float _1258 = _1254.y;
    float _1260 = _1254.z;
    float _1262 = _1254.w;
    float2 _3366 = float2(_1251, _1235);
    float3 _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3366, float2(0.0), isnan(_3366)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3366, float2(0.0), isnan(_3366)), level(0.0)).xyz;
    float _1268 = _1266.x;
    float _1270 = _1266.y;
    float _1272 = _1266.z;
    float _1274 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1276 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1278 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1276);
    float _1280 = exp2(_1274);
    float _1282 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1278);
    float _1284 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1282);
    float _1286 = _1284 + _1193;
    out.gl_Position.x = _1217;
    out.gl_Position.y = _1219;
    out.gl_Position.z = _1284;
    out.gl_Position.w = _1193;
    float _1288 = _1286 * 0.5;
    float _1290 = -_1280;
    float _1292 = _1290 + 1.0;
    float _1294 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1296 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1288;
    out.m_64.w = _1193;
    out.m_45.x = _1294;
    float _1298 = _1296 * _1247;
    float _1300 = -_1296;
    float _1302 = _1300 + 1.0;
    float _1304 = _1262 * _1298;
    float _1306 = _1262 * _1302;
    float _1308 = _1272 * _1298;
    float _1310 = fma(_1268, _1304, _1256);
    float _1312 = fma(_1270, _1304, _1258);
    float _1314 = fma(_1262, _1308, _1260);
    out.m_66.x = _1310;
    out.m_66.y = _1312;
    out.m_66.z = _1314;
    out.m_66.w = _1306;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _397 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1370 = as_type<float>(_99);
        out.gl_Position.z = _1370;
    }
    if (!_89)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = 0.0;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1438 = as_type<float>(_137);
        out.gl_Position.z = _1438;
    }
    if (_129)
    {
        return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = in.m_52.x;
    float _143 = in.m_52.y;
    float _145 = in.m_52.z;
    int _147 = as_type<int>(_139) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_139) & 2;
    bool _153 = _151 != 0;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _159 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _161 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _157);
    float _165 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _159);
    float _167 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _171 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _173 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_149;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_153;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_155;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_85);
        float _207 = 1.0 / _205;
        float _209 = _117 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = _211 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _211 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _233;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _227;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _253 = 1.0 / _235;
    float _255 = 1.0 / _231;
    float _257 = _215 * _249;
    bool _259 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = isnan(_211);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -_247;
    float _273 = _271 + 1.0;
    float _275 = _269 * _273;
    float _277 = _219 * _253;
    bool _279 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_211);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_269;
    float _293 = _291 + 1.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = _289 * _293;
    float _301 = -_289;
    float _303 = _301 + 1.0;
    float _305 = _223 * _255;
    bool _307 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_211);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = fma(_297, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_321, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = _317 * _303;
    float _337 = fma(_327, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = fma(_331, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = -_317;
    float _343 = _341 + 1.0;
    float _345 = _333 * _335;
    float _347 = _337 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _355;
    float _359 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _361 = fma(_351, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _363 = fma(_323, _299, _353);
    float _365 = fma(_357, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _367 = fma(_339, _299, _359);
    float _369 = fma(_361, _275, _363);
    float _371 = fma(_365, _275, _367);
    float _373 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _369);
    float _375 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _371);
    bool _377 = !_251;
    float _395;
    if (!_377)
    {
        float _379 = in.m_54.x;
        float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _383 = _379 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _387 = _385 * _381;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = true;
    }
    else
    {
        float _399 = float(_85);
        float _401 = 1.0 / _399;
        float _403 = _117 * _401;
        _395 = _403;
    }
    _397 = false;
    float _405 = _395;
    float _407 = in.m_42.x;
    float _409 = in.m_42.y;
    float _411 = in.m_42.z;
    float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _415 = in.m_54.x;
    float _417 = in.m_54.y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _419;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _429 = _427 != 0;
    float _431 = 1.0 / _421;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _435 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _437 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _439 = _417 > 0.5;
    float _441 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _443 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _435);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _447 = _405 + _445;
    float _449 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _451 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _441);
    float _453 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
    float _455 = _447 * _431;
    bool _457 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _459 = isnan(_405);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    bool _471 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _473 = isnan(_405);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _449);
    float _485 = _469 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = -_481;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _491;
    float _495 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _497 = _467 * _489;
    float _499 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _501 = _485 + _499;
    float _503 = fma(_493, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _509;
    float _513 = _453 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _515 = _503 * _497;
    float _517 = -_181;
    int _519 = _439 ? as_type<int>(_517) : as_type<int>(_181);
    float _521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _523 = _495 + _521;
    float _525 = _501 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _527 = fma(_507, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _529 = fma(_511, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _531 = !_429;
    float _533 = _531 ? _181 : as_type<float>(_519);
    float _535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _537 = _513 + _535;
    float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[28].x, _525);
    float _541 = _527 * _497;
    float _543 = -_467;
    float _545 = _543 + 1.0;
    float _547 = _529 * _497;
    bool _549 = _415 > 0.5;
    float _551 = -_533;
    float _553 = _551 + 0.5;
    float _555 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[28].z, _539);
    float _557 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].x, _541);
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].y, _515);
    float _561 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].z, _547);
    float _563 = _501 * _501;
    float _565 = -_177;
    int _567 = _549 ? as_type<int>(_565) : as_type<int>(_177);
    float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _571 = _555 >= 0.0;
    float _573 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[108].x, _557);
    float _575 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[108].y, _559);
    float _577 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[108].z, _561);
    float _579 = fma(_523, _523, _563);
    bool _581 = !_425;
    float _583 = _581 ? _177 : as_type<float>(_567);
    float _585 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _587 = fma(_537, _537, _579);
    float _589 = _583 + 0.5;
    float _591 = _553 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _593 = rsqrt(_587);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _599 = _589 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _601 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _603 = 0.0;
    int _605 = as_type<int>(_601);
    if (_571)
    {
        _603 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _607 = _603;
    float _609 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _611 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _599 * _413;
    float _615 = _591 * _569;
    float _617 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _621 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_571)
    {
        float _629 = _607 * 5.0;
        _605 = as_type<int>(_629);
    }
    int _631 = _605;
    out.m_56.x = _613;
    out.m_56.y = _615;
    float _633 = _501 * _593;
    float _635 = _523 * _593;
    out.m_58.x = _621;
    out.m_58.y = _623;
    out.m_58.z = _625;
    out.m_60.x = _627;
    out.m_60.y = _611;
    out.m_60.z = _617;
    out.m_60.w = _619;
    if (_571)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2305 = as_type<float>(_631);
        out.gl_Position.z = _2305;
    }
    if (_571)
    {
        out.m_45.x = 0.0;
    }
    if (_571)
    {
        return out;
    }
    float _637 = -_633;
    float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _641 = _537 * _593;
    float _643 = -_635;
    float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[18].w, _495);
    float _647 = -_633;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _501);
    float _651 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _653 = _639 + _651;
    float _655 = -_641;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _513);
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _661 = _645 + _659;
    float _663 = -_635;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _667 = _653 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _671 = _657 + _669;
    float _673 = _649 * _649;
    float _675 = in.m_62.x;
    float _677 = in.m_62.y;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[28].x, _667);
    float _681 = -_641;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _537);
    float _685 = fma(_665, _665, _673);
    float _687 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[28].z, _679);
    float _689 = fma(_683, _683, _685);
    bool _691 = _687 >= 0.0;
    float _693 = sqrt(_689);
    float _695 = _671;
    if (_691)
    {
        _695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _697 = _695;
    int _699 = as_type<int>(_697);
    if (_691)
    {
        out.m_45.x = 0.0;
    }
    float _701 = _373 * _675;
    float _703 = _375 * _677;
    float _705 = _593 * _693;
    if (_691)
    {
        float _707 = _697 * 5.0;
        _699 = as_type<int>(_707);
    }
    int _709 = _699;
    if (_691)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2447 = as_type<float>(_709);
        out.gl_Position.z = _2447;
    }
    if (_691)
    {
        return out;
    }
    float _711 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _713 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _719 = _711 * _705;
    float _721 = _713 * _705;
    float _723 = _705 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _725 = _723 * 0.5;
    float _727 = _715 * _719;
    float _729 = _717 * _721;
    float _731 = _727 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = _727 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _735 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _737 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _741 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[24].z, _737);
    float _743 = _739 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _745 = _741 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _747 = _513 + _743;
    float _749 = _495 + _745;
    float _751 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _753 = _747 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _757 = _749 + _755;
    float _759 = _753 * _753;
    float _761 = fma(_757, _757, _759);
    float _763 = _727 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _765 = sqrt(_761);
    float _767 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _763);
    float _769 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[25].z, _767);
    float _771 = _769 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _773 = _485 + _771;
    bool _775 = _765 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _777 = _727;
    float _779 = _729;
    float _781 = _725;
    if (!_775)
    {
        _777 = _749;
    }
    float _783 = _777;
    float _785 = _783;
    if (!_775)
    {
        _779 = _747;
    }
    float _787 = _779;
    float _789 = _787;
    if (!_775)
    {
        _781 = _773;
    }
    float _791 = _781;
    bool _793 = !_775;
    float _795 = _791;
    if (!_793)
    {
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _799 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _801 = _765 + _799;
        float _803 = rsqrt(_761);
        float _805 = _801 * _797;
        float _807 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _809 = _805 * 0.15915493667125701904296875;
        float _811 = _809 * 6.283185482025146484375;
        float _813 = sin(_811);
        float _815 = _809 * 6.283185482025146484375;
        float _817 = cos(_815);
        float _819 = fma(_813, _807, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _821 = _803 * _819;
        float _823 = _817 + (-1.0);
        float _825 = fma(_757, _821, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _827 = fma(_753, _821, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _829 = _823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _831 = fma(_773, _817, _829);
        _795 = _831;
        _785 = _825;
        _789 = _827;
    }
    float _833 = _795;
    float _835 = _785;
    float _837 = _789;
    float _839 = -_485;
    float _841 = _839 + _833;
    float _843 = -_495;
    float _845 = _843 + _835;
    float _847 = -_513;
    float _849 = _847 + _837;
    float _851 = _841 * _841;
    float _853 = fma(_845, _845, _851);
    float _855 = fma(_849, _849, _853);
    float _857 = sqrt(_855);
    bool _859 = _857 > 0.0;
    bool _861 = !_859;
    float _863 = _833;
    float _865 = _835;
    float _867 = _837;
    float _869 = _849;
    if (!_861)
    {
        float _871 = _171 * _171;
        float _873 = fma(_169, _169, _871);
        float _875 = fma(_173, _173, _873);
        float _877 = rsqrt(_855);
        float _879 = sqrt(_875);
        float _881 = _845 * _877;
        float _883 = _841 * _877;
        float _885 = _849 * _877;
        bool _887 = _879 > 0.0;
        bool _889 = !_887;
        if (!_889)
        {
            float _891 = rsqrt(_875);
            float _893 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _895 = _171 * _891;
            float _897 = _169 * _891;
            float _899 = _883 * _895;
            float _901 = _173 * _891;
            float _903 = fma(_881, _897, _899);
            float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _907 = fma(_885, _901, _903);
            float _909 = _907 * _905;
            float _911 = fma(_169, _909, _835);
            float _913 = fma(_171, _909, _833);
            float _915 = fma(_173, _909, _837);
            _863 = _913;
            _865 = _911;
            _867 = _915;
            _869 = _903;
        }
    }
    float _917 = _863;
    float _919 = _865;
    float _921 = _867;
    float _923 = _869;
    float _925 = -_633;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _929 = -_635;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    float _933 = -_641;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _939 = _927 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _931 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _947 = _935 + _945;
    float _949 = _939 * _939;
    float _951 = fma(_943, _943, _949);
    float _953 = fma(_947, _947, _951);
    float _955 = rsqrt(_953);
    float _957 = _955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _959 = _943 * _957;
    float _961 = _947 * _957;
    float _963 = _959 * _959;
    float _965 = _961 * _961;
    float _967 = _963 + _965;
    float _969 = sqrt(_967);
    bool _971 = _969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = _969 + _973;
    float _977 = _947;
    float _979 = _919;
    float _981 = _975;
    float _983 = _923;
    float _985 = _939;
    float _987 = _959;
    if (_971)
    {
        float _989 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _989;
    }
    float _991 = _977;
    if (_971)
    {
        float _993 = rsqrt(_967);
        _979 = _993;
    }
    float _995 = _979;
    float _997 = _995;
    if (_971)
    {
        float _999 = _975 * _991;
        _981 = _999;
    }
    float _1001 = _981;
    if (_971)
    {
        float _1003 = _1001 * 0.15915493667125701904296875;
        _983 = _1003;
    }
    float _1005 = _983;
    float _1007 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1009 = _955;
    if (_971)
    {
        float _1011 = _1005 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        _1009 = _1013;
    }
    float _1015 = _1009;
    float _1017 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1019 = precise::max(0.0, _1017);
    float _1021 = _951;
    float _1023 = _1017;
    float _1025 = _1019;
    if (_971)
    {
        float _1027 = _1005 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        _1021 = _1029;
    }
    float _1031 = _1021;
    float _1033 = -_957;
    float _1035 = -_1019;
    float _1037 = fma(_939, _1033, _1035);
    if (_971)
    {
        float _1039 = _1037 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1023 = _1039;
    }
    float _1041 = _1023;
    float _1043 = sqrt(_953);
    float _1045 = _1015;
    float _1047 = _1041;
    if (_971)
    {
        float _1049 = fma(_1015, _1041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _985 = _1049;
    }
    float _1051 = _985;
    float _1053 = _1051;
    if (!_971)
    {
        _1045 = _961;
    }
    float _1055 = _1045;
    float _1057 = _1055;
    if (_971)
    {
        float _1059 = _1031 + (-1.0);
        _1047 = _1059;
    }
    float _1061 = _1047;
    float _1063 = _1061;
    if (_971)
    {
        float _1065 = _995 * _1051;
        _1053 = _1065;
    }
    float _1067 = _1053;
    if (!_971)
    {
        _997 = _1037;
    }
    float _1069 = _997;
    float _1071 = _1069;
    if (_971)
    {
        float _1073 = _1061 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1025 = _1073;
    }
    float _1075 = _1025;
    float _1077 = _1075;
    if (_971)
    {
        float _1079 = _959 * _1067;
        _987 = _1079;
    }
    float _1081 = _987;
    if (!_971)
    {
        _1063 = _963;
    }
    float _1083 = _1063;
    float _1085 = _1083;
    if (_971)
    {
        float _1087 = _961 * _1067;
        _1057 = _1087;
    }
    float _1089 = _1057;
    if (_971)
    {
        float _1091 = fma(_1037, _1031, _1075);
        _1071 = _1091;
    }
    float _1093 = _1071;
    if (_971)
    {
        float _1095 = _1081 * _1081;
        _1085 = _1095;
    }
    float _1097 = _1085;
    if (!_971)
    {
        _1077 = _965;
    }
    float _1099 = _1077;
    float _1101 = _1099;
    if (_971)
    {
        float _1103 = _1089 * _1089;
        _1101 = _1103;
    }
    float _1105 = _1101;
    float _1107 = fma(_1093, _1093, _1097);
    float _1109 = _927 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1111 = _1107 + _1105;
    float _1113 = _927 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1115 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1117 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1115);
    float _1119 = precise::clamp(_1117, 0.0, 1.0);
    float _1121 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1109);
    float _1123 = rsqrt(_1111);
    float _1125 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1113);
    float _1127 = _927 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = -_1119;
    float _1131 = _1129 + 1.0;
    float _1133 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1125);
    float _1135 = _927 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1137 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1139 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1141 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1135);
    float _1143 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1137);
    float _1145 = abs(_1131);
    float _1147 = log2(_1145);
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1151 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1141);
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1155 = _1123 * _1081;
    float _1157 = -_1149;
    float _1159 = fma(_1157, _1007, 1.0);
    float _1161 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1121);
    float _1163 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1167 = _1123 * _1093;
    float _1169 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1171 = _1123 * _1089;
    float _1173 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1165);
    float _1175 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1177 = -_1169;
    float _1179 = fma(_1167, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1177);
    float _1181 = log2(_1159);
    float _1183 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1173);
    float _1185 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1187 = -_1171;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1179);
    float _1191 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1183);
    float _1195 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1197 = fma(_1189, -0.5, 0.5);
    float _1199 = exp2(_1185);
    float _1201 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1191);
    float _1203 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1195);
    float _1205 = fma(_1189, 0.5, 0.5);
    float _1207 = _1167 + 1.0;
    float _1209 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1201);
    float _1211 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1203);
    float _1213 = fma(_1205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1215 = 1.0 / _1193;
    float _1217 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1209);
    float _1219 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1211);
    float _1221 = fma(_1205, _1213, -0.212114393711090087890625);
    float _1223 = _1181 * 0.693147182464599609375;
    float _1225 = fma(_1205, _1221, 1.570728778839111328125);
    float _1227 = sqrt(_1197);
    float _1229 = -_1167;
    float _1231 = fma(_1199, _1207, _1229);
    float _1233 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1235 = fma(_1231, 0.5, 0.5);
    float _1237 = _1217 * _1215;
    float _1239 = _1219 * _1215;
    float _1241 = fma(_1237, 0.5, 0.5);
    float _1243 = fma(_1239, -0.5, 0.5);
    float _1245 = _1227 * 0.636619746685028076171875;
    float3 _3333 = float3(_1241, _1243, _1233);
    float _1247 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3333, float3(0.0), isnan(_3333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3333, float3(0.0), isnan(_3333)), level(0.0)).x;
    float _1249 = -_1225;
    float _1251 = fma(_1245, _1249, 1.0);
    float3 _3349 = float3(_1241, _1243, _1233);
    float4 _1254 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3349, float3(0.0), isnan(_3349)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3349, float3(0.0), isnan(_3349)), level(0.0)).xyzw;
    float _1256 = _1254.x;
    float _1258 = _1254.y;
    float _1260 = _1254.z;
    float _1262 = _1254.w;
    float2 _3366 = float2(_1251, _1235);
    float3 _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3366, float2(0.0), isnan(_3366)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3366, float2(0.0), isnan(_3366)), level(0.0)).xyz;
    float _1268 = _1266.x;
    float _1270 = _1266.y;
    float _1272 = _1266.z;
    float _1274 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1276 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1278 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1276);
    float _1280 = exp2(_1274);
    float _1282 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1278);
    float _1284 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1282);
    float _1286 = _1284 + _1193;
    out.gl_Position.x = _1217;
    out.gl_Position.y = _1219;
    out.gl_Position.z = _1284;
    out.gl_Position.w = _1193;
    float _1288 = _1286 * 0.5;
    float _1290 = -_1280;
    float _1292 = _1290 + 1.0;
    float _1294 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1296 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1288;
    out.m_64.w = _1193;
    out.m_45.x = _1294;
    float _1298 = _1296 * _1247;
    float _1300 = -_1296;
    float _1302 = _1300 + 1.0;
    float _1304 = _1262 * _1298;
    float _1306 = _1262 * _1302;
    float _1308 = _1272 * _1298;
    float _1310 = fma(_1268, _1304, _1256);
    float _1312 = fma(_1270, _1304, _1258);
    float _1314 = fma(_1262, _1308, _1260);
    out.m_66.x = _1310;
    out.m_66.y = _1312;
    out.m_66.z = _1314;
    out.m_66.w = _1306;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _397 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1370 = as_type<float>(_99);
        out.gl_Position.z = _1370;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = 0.0;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1438 = as_type<float>(_137);
        out.gl_Position.z = _1438;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = in.m_52.x;
    float _143 = in.m_52.y;
    float _145 = in.m_52.z;
    int _147 = as_type<int>(_139) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_139) & 2;
    bool _153 = _151 != 0;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _159 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _161 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _157);
    float _165 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _159);
    float _167 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _171 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _173 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_149;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_153;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_155;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_85);
        float _207 = 1.0 / _205;
        float _209 = _117 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = _211 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _211 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _233;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _227;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _253 = 1.0 / _235;
    float _255 = 1.0 / _231;
    float _257 = _215 * _249;
    bool _259 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = isnan(_211);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -_247;
    float _273 = _271 + 1.0;
    float _275 = _269 * _273;
    float _277 = _219 * _253;
    bool _279 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_211);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_269;
    float _293 = _291 + 1.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = _289 * _293;
    float _301 = -_289;
    float _303 = _301 + 1.0;
    float _305 = _223 * _255;
    bool _307 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_211);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = fma(_297, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_321, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = _317 * _303;
    float _337 = fma(_327, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = fma(_331, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = -_317;
    float _343 = _341 + 1.0;
    float _345 = _333 * _335;
    float _347 = _337 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _355;
    float _359 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _361 = fma(_351, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _363 = fma(_323, _299, _353);
    float _365 = fma(_357, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _367 = fma(_339, _299, _359);
    float _369 = fma(_361, _275, _363);
    float _371 = fma(_365, _275, _367);
    float _373 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _369);
    float _375 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _371);
    bool _377 = !_251;
    float _395;
    if (!_377)
    {
        float _379 = in.m_54.x;
        float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _383 = _379 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _387 = _385 * _381;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = true;
    }
    else
    {
        float _399 = float(_85);
        float _401 = 1.0 / _399;
        float _403 = _117 * _401;
        _395 = _403;
    }
    _397 = false;
    float _405 = _395;
    float _407 = in.m_42.x;
    float _409 = in.m_42.y;
    float _411 = in.m_42.z;
    float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _415 = in.m_54.x;
    float _417 = in.m_54.y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _419;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _429 = _427 != 0;
    float _431 = 1.0 / _421;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _435 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _437 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _439 = _417 > 0.5;
    float _441 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _443 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _435);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _447 = _405 + _445;
    float _449 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _451 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _441);
    float _453 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
    float _455 = _447 * _431;
    bool _457 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _459 = isnan(_405);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    bool _471 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _473 = isnan(_405);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _449);
    float _485 = _469 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = -_481;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _491;
    float _495 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _497 = _467 * _489;
    float _499 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _501 = _485 + _499;
    float _503 = fma(_493, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _509;
    float _513 = _453 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _515 = _503 * _497;
    float _517 = -_181;
    int _519 = _439 ? as_type<int>(_517) : as_type<int>(_181);
    float _521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _523 = _495 + _521;
    float _525 = _501 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _527 = fma(_507, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _529 = fma(_511, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _531 = !_429;
    float _533 = _531 ? _181 : as_type<float>(_519);
    float _535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _537 = _513 + _535;
    float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[28].x, _525);
    float _541 = _527 * _497;
    float _543 = -_467;
    float _545 = _543 + 1.0;
    float _547 = _529 * _497;
    bool _549 = _415 > 0.5;
    float _551 = -_533;
    float _553 = _551 + 0.5;
    float _555 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[28].z, _539);
    float _557 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].x, _541);
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].y, _515);
    float _561 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].z, _547);
    float _563 = _501 * _501;
    float _565 = -_177;
    int _567 = _549 ? as_type<int>(_565) : as_type<int>(_177);
    float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _571 = _555 >= 0.0;
    float _573 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[108].x, _557);
    float _575 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[108].y, _559);
    float _577 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[108].z, _561);
    float _579 = fma(_523, _523, _563);
    bool _581 = !_425;
    float _583 = _581 ? _177 : as_type<float>(_567);
    float _585 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _587 = fma(_537, _537, _579);
    float _589 = _583 + 0.5;
    float _591 = _553 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _593 = rsqrt(_587);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _599 = _589 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _601 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _603 = 0.0;
    int _605 = as_type<int>(_601);
    if (_571)
    {
        _603 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _607 = _603;
    float _609 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _611 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _599 * _413;
    float _615 = _591 * _569;
    float _617 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _621 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_571)
    {
        float _629 = _607 * 5.0;
        _605 = as_type<int>(_629);
    }
    int _631 = _605;
    out.m_56.x = _613;
    out.m_56.y = _615;
    float _633 = _501 * _593;
    float _635 = _523 * _593;
    out.m_58.x = _621;
    out.m_58.y = _623;
    out.m_58.z = _625;
    out.m_60.x = _627;
    out.m_60.y = _611;
    out.m_60.z = _617;
    out.m_60.w = _619;
    if (_571)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2305 = as_type<float>(_631);
        out.gl_Position.z = _2305;
    }
    if (_571)
    {
        out.m_45.x = 0.0;
    }
    if (_571)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _637 = -_633;
    float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _641 = _537 * _593;
    float _643 = -_635;
    float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[18].w, _495);
    float _647 = -_633;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _501);
    float _651 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _653 = _639 + _651;
    float _655 = -_641;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _513);
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _661 = _645 + _659;
    float _663 = -_635;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _667 = _653 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _671 = _657 + _669;
    float _673 = _649 * _649;
    float _675 = in.m_62.x;
    float _677 = in.m_62.y;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[28].x, _667);
    float _681 = -_641;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _537);
    float _685 = fma(_665, _665, _673);
    float _687 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[28].z, _679);
    float _689 = fma(_683, _683, _685);
    bool _691 = _687 >= 0.0;
    float _693 = sqrt(_689);
    float _695 = _671;
    if (_691)
    {
        _695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _697 = _695;
    int _699 = as_type<int>(_697);
    if (_691)
    {
        out.m_45.x = 0.0;
    }
    float _701 = _373 * _675;
    float _703 = _375 * _677;
    float _705 = _593 * _693;
    if (_691)
    {
        float _707 = _697 * 5.0;
        _699 = as_type<int>(_707);
    }
    int _709 = _699;
    if (_691)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2447 = as_type<float>(_709);
        out.gl_Position.z = _2447;
    }
    if (_691)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _711 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _713 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _719 = _711 * _705;
    float _721 = _713 * _705;
    float _723 = _705 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _725 = _723 * 0.5;
    float _727 = _715 * _719;
    float _729 = _717 * _721;
    float _731 = _727 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = _727 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _735 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _737 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _741 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[24].z, _737);
    float _743 = _739 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _745 = _741 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _747 = _513 + _743;
    float _749 = _495 + _745;
    float _751 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _753 = _747 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _757 = _749 + _755;
    float _759 = _753 * _753;
    float _761 = fma(_757, _757, _759);
    float _763 = _727 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _765 = sqrt(_761);
    float _767 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _763);
    float _769 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[25].z, _767);
    float _771 = _769 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _773 = _485 + _771;
    bool _775 = _765 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _777 = _727;
    float _779 = _729;
    float _781 = _725;
    if (!_775)
    {
        _777 = _749;
    }
    float _783 = _777;
    float _785 = _783;
    if (!_775)
    {
        _779 = _747;
    }
    float _787 = _779;
    float _789 = _787;
    if (!_775)
    {
        _781 = _773;
    }
    float _791 = _781;
    bool _793 = !_775;
    float _795 = _791;
    if (!_793)
    {
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _799 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _801 = _765 + _799;
        float _803 = rsqrt(_761);
        float _805 = _801 * _797;
        float _807 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _809 = _805 * 0.15915493667125701904296875;
        float _811 = _809 * 6.283185482025146484375;
        float _813 = sin(_811);
        float _815 = _809 * 6.283185482025146484375;
        float _817 = cos(_815);
        float _819 = fma(_813, _807, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _821 = _803 * _819;
        float _823 = _817 + (-1.0);
        float _825 = fma(_757, _821, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _827 = fma(_753, _821, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _829 = _823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _831 = fma(_773, _817, _829);
        _795 = _831;
        _785 = _825;
        _789 = _827;
    }
    float _833 = _795;
    float _835 = _785;
    float _837 = _789;
    float _839 = -_485;
    float _841 = _839 + _833;
    float _843 = -_495;
    float _845 = _843 + _835;
    float _847 = -_513;
    float _849 = _847 + _837;
    float _851 = _841 * _841;
    float _853 = fma(_845, _845, _851);
    float _855 = fma(_849, _849, _853);
    float _857 = sqrt(_855);
    bool _859 = _857 > 0.0;
    bool _861 = !_859;
    float _863 = _833;
    float _865 = _835;
    float _867 = _837;
    float _869 = _849;
    if (!_861)
    {
        float _871 = _171 * _171;
        float _873 = fma(_169, _169, _871);
        float _875 = fma(_173, _173, _873);
        float _877 = rsqrt(_855);
        float _879 = sqrt(_875);
        float _881 = _845 * _877;
        float _883 = _841 * _877;
        float _885 = _849 * _877;
        bool _887 = _879 > 0.0;
        bool _889 = !_887;
        if (!_889)
        {
            float _891 = rsqrt(_875);
            float _893 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _895 = _171 * _891;
            float _897 = _169 * _891;
            float _899 = _883 * _895;
            float _901 = _173 * _891;
            float _903 = fma(_881, _897, _899);
            float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _907 = fma(_885, _901, _903);
            float _909 = _907 * _905;
            float _911 = fma(_169, _909, _835);
            float _913 = fma(_171, _909, _833);
            float _915 = fma(_173, _909, _837);
            _863 = _913;
            _865 = _911;
            _867 = _915;
            _869 = _903;
        }
    }
    float _917 = _863;
    float _919 = _865;
    float _921 = _867;
    float _923 = _869;
    float _925 = -_633;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _929 = -_635;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    float _933 = -_641;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _939 = _927 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _931 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _947 = _935 + _945;
    float _949 = _939 * _939;
    float _951 = fma(_943, _943, _949);
    float _953 = fma(_947, _947, _951);
    float _955 = rsqrt(_953);
    float _957 = _955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _959 = _943 * _957;
    float _961 = _947 * _957;
    float _963 = _959 * _959;
    float _965 = _961 * _961;
    float _967 = _963 + _965;
    float _969 = sqrt(_967);
    bool _971 = _969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = _969 + _973;
    float _977 = _947;
    float _979 = _919;
    float _981 = _975;
    float _983 = _923;
    float _985 = _939;
    float _987 = _959;
    if (_971)
    {
        float _989 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _989;
    }
    float _991 = _977;
    if (_971)
    {
        float _993 = rsqrt(_967);
        _979 = _993;
    }
    float _995 = _979;
    float _997 = _995;
    if (_971)
    {
        float _999 = _975 * _991;
        _981 = _999;
    }
    float _1001 = _981;
    if (_971)
    {
        float _1003 = _1001 * 0.15915493667125701904296875;
        _983 = _1003;
    }
    float _1005 = _983;
    float _1007 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1009 = _955;
    if (_971)
    {
        float _1011 = _1005 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        _1009 = _1013;
    }
    float _1015 = _1009;
    float _1017 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1019 = precise::max(0.0, _1017);
    float _1021 = _951;
    float _1023 = _1017;
    float _1025 = _1019;
    if (_971)
    {
        float _1027 = _1005 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        _1021 = _1029;
    }
    float _1031 = _1021;
    float _1033 = -_957;
    float _1035 = -_1019;
    float _1037 = fma(_939, _1033, _1035);
    if (_971)
    {
        float _1039 = _1037 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1023 = _1039;
    }
    float _1041 = _1023;
    float _1043 = sqrt(_953);
    float _1045 = _1015;
    float _1047 = _1041;
    if (_971)
    {
        float _1049 = fma(_1015, _1041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _985 = _1049;
    }
    float _1051 = _985;
    float _1053 = _1051;
    if (!_971)
    {
        _1045 = _961;
    }
    float _1055 = _1045;
    float _1057 = _1055;
    if (_971)
    {
        float _1059 = _1031 + (-1.0);
        _1047 = _1059;
    }
    float _1061 = _1047;
    float _1063 = _1061;
    if (_971)
    {
        float _1065 = _995 * _1051;
        _1053 = _1065;
    }
    float _1067 = _1053;
    if (!_971)
    {
        _997 = _1037;
    }
    float _1069 = _997;
    float _1071 = _1069;
    if (_971)
    {
        float _1073 = _1061 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1025 = _1073;
    }
    float _1075 = _1025;
    float _1077 = _1075;
    if (_971)
    {
        float _1079 = _959 * _1067;
        _987 = _1079;
    }
    float _1081 = _987;
    if (!_971)
    {
        _1063 = _963;
    }
    float _1083 = _1063;
    float _1085 = _1083;
    if (_971)
    {
        float _1087 = _961 * _1067;
        _1057 = _1087;
    }
    float _1089 = _1057;
    if (_971)
    {
        float _1091 = fma(_1037, _1031, _1075);
        _1071 = _1091;
    }
    float _1093 = _1071;
    if (_971)
    {
        float _1095 = _1081 * _1081;
        _1085 = _1095;
    }
    float _1097 = _1085;
    if (!_971)
    {
        _1077 = _965;
    }
    float _1099 = _1077;
    float _1101 = _1099;
    if (_971)
    {
        float _1103 = _1089 * _1089;
        _1101 = _1103;
    }
    float _1105 = _1101;
    float _1107 = fma(_1093, _1093, _1097);
    float _1109 = _927 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1111 = _1107 + _1105;
    float _1113 = _927 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1115 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1117 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1115);
    float _1119 = precise::clamp(_1117, 0.0, 1.0);
    float _1121 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1109);
    float _1123 = rsqrt(_1111);
    float _1125 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1113);
    float _1127 = _927 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = -_1119;
    float _1131 = _1129 + 1.0;
    float _1133 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1125);
    float _1135 = _927 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1137 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1139 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1141 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1135);
    float _1143 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1137);
    float _1145 = abs(_1131);
    float _1147 = log2(_1145);
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1151 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1141);
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1155 = _1123 * _1081;
    float _1157 = -_1149;
    float _1159 = fma(_1157, _1007, 1.0);
    float _1161 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1121);
    float _1163 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1167 = _1123 * _1093;
    float _1169 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1171 = _1123 * _1089;
    float _1173 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1165);
    float _1175 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1177 = -_1169;
    float _1179 = fma(_1167, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1177);
    float _1181 = log2(_1159);
    float _1183 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1173);
    float _1185 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1187 = -_1171;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1179);
    float _1191 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1183);
    float _1195 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1197 = fma(_1189, -0.5, 0.5);
    float _1199 = exp2(_1185);
    float _1201 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1191);
    float _1203 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1195);
    float _1205 = fma(_1189, 0.5, 0.5);
    float _1207 = _1167 + 1.0;
    float _1209 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1201);
    float _1211 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1203);
    float _1213 = fma(_1205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1215 = 1.0 / _1193;
    float _1217 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1209);
    float _1219 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1211);
    float _1221 = fma(_1205, _1213, -0.212114393711090087890625);
    float _1223 = _1181 * 0.693147182464599609375;
    float _1225 = fma(_1205, _1221, 1.570728778839111328125);
    float _1227 = sqrt(_1197);
    float _1229 = -_1167;
    float _1231 = fma(_1199, _1207, _1229);
    float _1233 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1235 = fma(_1231, 0.5, 0.5);
    float _1237 = _1217 * _1215;
    float _1239 = _1219 * _1215;
    float _1241 = fma(_1237, 0.5, 0.5);
    float _1243 = fma(_1239, -0.5, 0.5);
    float _1245 = _1227 * 0.636619746685028076171875;
    float3 _3333 = float3(_1241, _1243, _1233);
    float _1247 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3333, float3(0.0), isnan(_3333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3333, float3(0.0), isnan(_3333)), level(0.0)).x;
    float _1249 = -_1225;
    float _1251 = fma(_1245, _1249, 1.0);
    float3 _3349 = float3(_1241, _1243, _1233);
    float4 _1254 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3349, float3(0.0), isnan(_3349)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3349, float3(0.0), isnan(_3349)), level(0.0)).xyzw;
    float _1256 = _1254.x;
    float _1258 = _1254.y;
    float _1260 = _1254.z;
    float _1262 = _1254.w;
    float2 _3366 = float2(_1251, _1235);
    float3 _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3366, float2(0.0), isnan(_3366)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3366, float2(0.0), isnan(_3366)), level(0.0)).xyz;
    float _1268 = _1266.x;
    float _1270 = _1266.y;
    float _1272 = _1266.z;
    float _1274 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1276 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1278 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1276);
    float _1280 = exp2(_1274);
    float _1282 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1278);
    float _1284 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1282);
    float _1286 = _1284 + _1193;
    out.gl_Position.x = _1217;
    out.gl_Position.y = _1219;
    out.gl_Position.z = _1284;
    out.gl_Position.w = _1193;
    float _1288 = _1286 * 0.5;
    float _1290 = -_1280;
    float _1292 = _1290 + 1.0;
    float _1294 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1296 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1288;
    out.m_64.w = _1193;
    out.m_45.x = _1294;
    float _1298 = _1296 * _1247;
    float _1300 = -_1296;
    float _1302 = _1300 + 1.0;
    float _1304 = _1262 * _1298;
    float _1306 = _1262 * _1302;
    float _1308 = _1272 * _1298;
    float _1310 = fma(_1268, _1304, _1256);
    float _1312 = fma(_1270, _1304, _1258);
    float _1314 = fma(_1262, _1308, _1260);
    out.m_66.x = _1310;
    out.m_66.y = _1312;
    out.m_66.z = _1314;
    out.m_66.w = _1306;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

