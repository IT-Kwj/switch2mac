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
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1059 = false;
    bool _455 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1539 = as_type<float>(_101);
        out.gl_Position.z = _1539;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1608 = as_type<float>(_137);
        out.gl_Position.z = _1608;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_54.w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
    float _167 = 0.0;
    float _169 = _141;
    if (!_153)
    {
        float _171 = _141 * _141;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_139) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_139) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_153;
    float _201 = _181;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _141 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _141);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_153;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _141 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _169 = _255;
    }
    float _257 = _169;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _155, _261);
    float _269 = fma(_257, _157, _263);
    float _271 = fma(_257, _159, _265);
    float _273 = fma(_267, _143, _161);
    float _275 = fma(_269, _143, _163);
    float _277 = fma(_271, _143, _165);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_85);
        float _303 = 1.0 / _301;
        float _305 = _119 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    bool _313 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = isnan(_307);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _307 + _325;
    bool _329 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _331 = isnan(_307);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -_323;
    float _351 = _349 + 1.0;
    float _353 = 1.0 / _347;
    bool _355 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _357 = isnan(_307);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _339 * _351;
    float _369 = -_339;
    float _371 = _369 + 1.0;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _375 = _365 * _371;
    float _377 = 1.0 / _343;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = -_365;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = _327 * _353;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _397 = fma(_389, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _401 = _311 * _377;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _403;
    float _407 = in.m_54.x;
    float _409 = in.m_54.y;
    float _411 = fma(_381, _401, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _413 = fma(_405, _401, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = _411 * _375;
    float _417 = _413 * _375;
    float _419 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _421 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _415);
    float _423 = fma(_399, _367, _419);
    float _425 = fma(_397, _367, _421);
    float _427 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[145].x, _423);
    float _429 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[145].y, _425);
    float _431 = _427 * _407;
    float _433 = _429 * _409;
    bool _435 = !_373;
    float _453;
    if (!_435)
    {
        float _437 = in.m_56.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_85);
        float _459 = 1.0 / _457;
        float _461 = _119 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = in.m_56.x;
    float _467 = in.m_56.y;
    float _469 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _471 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _475 = _473 != 0;
    float _477 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _481 = _479 != 0;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _483;
    float _487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _493 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].z, _471);
    float _495 = 1.0 / _485;
    float _497 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _499 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _501 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].x, _469);
    float _503 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _505 = _497 * _499;
    float _507 = 1.0 / _491;
    float _509 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].x, _501);
    float _511 = _505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _513 = _467 > 0.5;
    float _515 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _517 = _465 > 0.5;
    float _519 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _521 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].y, _515);
    float _523 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].w, _519);
    float _525 = _477 * _487;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _527;
    float _531 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].z, _493);
    float _533 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].y, _521);
    float _535 = 1.0 / _529;
    float _537 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].w, _523);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _543 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _547 = _463 + _545;
    float _549 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _551 = 1.0 / _541;
    float _553 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _555 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _543);
    float _557 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _549);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _561 = _463 + _559;
    float _563 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _553);
    float _565 = _547 * _495;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _569 = _463 + _567;
    float _571 = _533 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _573 = -_193;
    int _575 = _517 ? as_type<int>(_573) : as_type<int>(_193);
    float _577 = _569 * _507;
    float _579 = _561 * _535;
    float _581 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _557);
    float _583 = -_197;
    int _585 = _513 ? as_type<int>(_583) : as_type<int>(_197);
    float _587 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _511);
    float _589 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _555);
    bool _591 = !_481;
    float _593 = _591 ? _197 : as_type<float>(_585);
    float _595 = sqrt(_581);
    float _597 = _509 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _599 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _563);
    bool _601 = !_475;
    float _603 = _601 ? _193 : as_type<float>(_575);
    float _605 = _531 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _607 = _505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _609 = sqrt(_589);
    float _611 = _505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _615 = _463 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _633 = _615 * _551;
    float _635 = sqrt(_599);
    float _637 = _595 * _597;
    float _639 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _607);
    float _641 = _537 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _643 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _587);
    float _645 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _639);
    float _647 = _609 * _571;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _653;
    float _657 = _645 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _659 = _647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _661 = _647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _663 = fma(_623, _577, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _665 = fma(_631, _577, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _667 = _635 * _605;
    float _669 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[24].x, _659);
    float _671 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[26].x, _661);
    float _673 = fma(_651, _577, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _675 = _643 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _677 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _669);
    float _679 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _671);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _681;
    float _685 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].w, _677);
    float _687 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].w, _679);
    bool _689 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _691 = isnan(_463);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _701;
    float _705 = _685 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _707 = _687 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _709 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _611);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _711;
    float _715 = _705 + _657;
    float _717 = _707 + _675;
    float _719 = fma(_683, _579, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    bool _721 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _723 = isnan(_463);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = fma(_703, _579, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _735 = -_699;
    float _737 = _735 + 1.0;
    float _739 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _741 = _715 + _739;
    float _743 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _745 = _717 + _743;
    float _747 = fma(_713, _579, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _749 = _731 * _737;
    float _751 = _741 * _741;
    float _753 = _745 * _745;
    float _755 = fma(_619, _565, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _757 = fma(_627, _565, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _759 = fma(_655, _565, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _761 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _763 = isnan(_463);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -_731;
    float _775 = _773 + 1.0;
    bool _777 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _779 = isnan(_463);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = _751 + _753;
    bool _791 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _793 = isnan(_463);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _771 * _775;
    float _805 = -_771;
    float _807 = _805 + 1.0;
    float _809 = -_787;
    float _811 = _809 + 1.0;
    float _813 = sqrt(_789);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _819 = _787 * _807;
    float _821 = _647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _827 = _801 * _811;
    float _829 = fma(_817, _633, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _831 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _709);
    float _833 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[25].x, _821);
    float _835 = -_801;
    float _837 = _835 + 1.0;
    float _839 = _755 * _827;
    float _841 = _757 * _827;
    float _843 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _833);
    float _845 = _759 * _827;
    float _847 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[123].x, _839);
    float _849 = _831 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _851 = _813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _853 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].w, _843);
    float _855 = fma(_663, _819, _847);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _863 = _853 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _865 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[123].y, _841);
    float _867 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[123].z, _845);
    float _869 = _863 + _849;
    float _871 = fma(_859, _633, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _873 = fma(_665, _819, _865);
    float _875 = fma(_825, _633, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _877 = fma(_673, _819, _867);
    float _879 = fma(_719, _803, _855);
    float _881 = _665;
    float _883 = _751;
    float _885 = _753;
    float _887 = _715;
    float _889 = _717;
    float _891 = _849;
    if (!_851)
    {
        _881 = _869;
    }
    float _893 = _881;
    bool _895 = !_851;
    float _897 = _893;
    if (!_895)
    {
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _901 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _903 = _813 + _901;
        float _905 = rsqrt(_789);
        float _907 = _903 * _899;
        float _909 = _869 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _911 = _907 * 0.15915493667125701904296875;
        float _913 = _911 * 6.283185482025146484375;
        float _915 = sin(_913);
        float _917 = _911 * 6.283185482025146484375;
        float _919 = cos(_917);
        float _921 = fma(_915, _909, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _923 = _905 * _921;
        float _925 = fma(_741, _923, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _927 = _919 + (-1.0);
        float _929 = fma(_745, _923, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _933 = _925 + _931;
        float _935 = _927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _939 = _929 + _937;
        float _941 = _933 * _933;
        float _943 = fma(_869, _919, _935);
        float _945 = _939 * _939;
        _897 = _943;
        _883 = _941;
        _885 = _945;
        _887 = _925;
        _889 = _929;
    }
    float _947 = _897;
    float _949 = _883;
    float _951 = _885;
    float _953 = _887;
    float _955 = _889;
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _959 = _947 + _957;
    float _961 = fma(_733, _803, _873);
    float _963 = fma(_747, _803, _877);
    float _965 = fma(_829, _749, _879);
    float _967 = fma(_959, _959, _949);
    float _969 = fma(_871, _749, _961);
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _973 = fma(_875, _749, _963);
    float _975 = _967 + _951;
    float _977 = _603 + 0.5;
    float _979 = -_593;
    float _981 = _979 + 0.5;
    float _983 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[127].x, _965);
    float _985 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[127].y, _969);
    float _987 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[127].z, _973);
    float _989 = sqrt(_975);
    float _991 = _977 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _993 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _995 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _997 = _985 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _999 = _987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1001 = _991 * _861;
    float _1003 = _995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = _993 * _971;
    float _1007 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1001;
    out.m_58.y = _1005;
    bool _1011 = _989 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1013 = isnan(_989);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1019 = _1015 || _1017;
    out.m_60.x = _1003;
    out.m_60.y = _1007;
    out.m_60.z = _1009;
    float _1021 = _971;
    float _1023 = _999;
    if (!_1019)
    {
        _1021 = 1.0;
    }
    float _1025 = _1021;
    bool _1027 = !_1019;
    float _1029 = _1025;
    if (!_1027)
    {
        bool _1031 = _989 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1033 = isnan(_989);
        bool _1035 = _1031 || _1033;
        bool _1037 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1039 = _1035 || _1037;
        if (!_1039)
        {
            float _1041 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1043 = _989 + _1041;
            float _1045 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1047 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1045;
            float _1049 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1051 = _1049 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1053 = 1.0 / _1047;
            float _1055 = _1043 * _1053;
            float _1057 = fma(_1055, _1051, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1029 = _1057;
            _1059 = true;
        }
        else
        {
            bool _1061 = _989 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1063 = isnan(_989);
            bool _1065 = _1061 || _1063;
            bool _1067 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1069 = _1065 || _1067;
            if (!_1069)
            {
                float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1073 = _989 + _1071;
                float _1075 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1077 = _1075 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1079 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1081 = _1079 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1083 = 1.0 / _1077;
                float _1085 = _1073 * _1083;
                float _1087 = fma(_1085, _1081, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1029 = _1087;
                _1059 = true;
            }
            else
            {
                _1029 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1059 = false;
    float _1089 = _1029;
    float _1091 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1093 = _947 + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1097 = _953 + _1095;
    float _1099 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1101 = _955 + _1099;
    float _1103 = fma(_1093, _1089, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1105 = fma(_1097, _1089, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1107 = fma(_1101, _1089, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1111 = _1103 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1115 = _1105 + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1119 = _1107 + _1117;
    float _1121 = _1111 * _1111;
    float _1123 = fma(_1115, _1115, _1121);
    float _1125 = fma(_1119, _1119, _1123);
    float _1127 = rsqrt(_1125);
    float _1129 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1131 = _1115 * _1129;
    float _1133 = _1119 * _1129;
    float _1135 = _1131 * _1131;
    float _1137 = _1133 * _1133;
    float _1139 = _1135 + _1137;
    float _1141 = sqrt(_1139);
    bool _1143 = _1141 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1147 = _1141 + _1145;
    float _1149 = _1123;
    float _1151 = _1147;
    float _1153 = _1111;
    float _1155 = _1131;
    if (_1143)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1149 = _1157;
    }
    float _1159 = _1149;
    float _1161 = _1159;
    if (_1143)
    {
        float _1163 = _1147 * _1159;
        _1151 = _1163;
    }
    float _1165 = _1151;
    if (_1143)
    {
        float _1167 = rsqrt(_1139);
        _1161 = _1167;
    }
    float _1169 = _1161;
    float _1171 = _1169;
    if (_1143)
    {
        float _1173 = _1165 * 0.15915493667125701904296875;
        _1023 = _1173;
    }
    float _1175 = _1023;
    float _1177 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1179 = _1119;
    if (_1143)
    {
        float _1181 = _1175 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        _1179 = _1183;
    }
    float _1185 = _1179;
    float _1187 = precise::max(0.0, _1177);
    float _1189 = _1127;
    float _1191 = _1187;
    if (_1143)
    {
        float _1193 = _1175 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        _1189 = _1195;
    }
    float _1197 = _1189;
    float _1199 = -_1129;
    float _1201 = -_1187;
    float _1203 = fma(_1111, _1199, _1201);
    if (_1143)
    {
        float _1205 = _1203 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1153 = _1205;
    }
    float _1207 = _1153;
    float _1209 = sqrt(_1125);
    float _1211 = _1185;
    float _1213 = _1207;
    if (_1143)
    {
        float _1215 = fma(_1185, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1211 = _1215;
    }
    float _1217 = _1211;
    float _1219 = _1217;
    if (!_1143)
    {
        _1213 = _1135;
    }
    float _1221 = _1213;
    float _1223 = _1221;
    if (_1143)
    {
        float _1225 = _1169 * _1217;
        _891 = _1225;
    }
    float _1227 = _891;
    if (!_1143)
    {
        _1219 = _1203;
    }
    float _1229 = _1219;
    float _1231 = _1229;
    float _1233 = _1197;
    if (_1143)
    {
        float _1235 = _1197 + (-1.0);
        _1191 = _1235;
    }
    float _1237 = _1191;
    float _1239 = _1237;
    if (_1143)
    {
        float _1241 = _1131 * _1227;
        _1155 = _1241;
    }
    float _1243 = _1155;
    if (_1143)
    {
        float _1245 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1171 = _1245;
    }
    float _1247 = _1171;
    if (!_1143)
    {
        _1239 = _1133;
    }
    float _1249 = _1239;
    float _1251 = _1249;
    if (_1143)
    {
        float _1253 = _1133 * _1227;
        _1251 = _1253;
    }
    float _1255 = _1251;
    if (_1143)
    {
        float _1257 = _1243 * _1243;
        _1223 = _1257;
    }
    float _1259 = _1223;
    if (_1143)
    {
        float _1261 = fma(_1203, _1197, _1247);
        _1231 = _1261;
    }
    float _1263 = _1231;
    if (!_1143)
    {
        _1233 = _1137;
    }
    float _1265 = _1233;
    float _1267 = _1265;
    if (_1143)
    {
        float _1269 = _1255 * _1255;
        _1267 = _1269;
    }
    float _1271 = _1267;
    float _1273 = fma(_1263, _1263, _1259);
    float _1275 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1277 = _1273 + _1271;
    float _1279 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1283 = fma(_1209, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1281);
    float _1285 = precise::clamp(_1283, 0.0, 1.0);
    float _1287 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1275);
    float _1289 = rsqrt(_1277);
    float _1291 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1279);
    float _1293 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1295 = -_1285;
    float _1297 = _1295 + 1.0;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1301 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1291);
    float _1303 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1305 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1293);
    float _1307 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1287);
    float _1309 = abs(_1297);
    float _1311 = log2(_1309);
    float _1313 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1315 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1303);
    float _1317 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1305);
    float _1319 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1321 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1315);
    float _1323 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1325 = _1289 * _1243;
    float _1327 = -_1319;
    float _1329 = fma(_1327, _1299, 1.0);
    float _1331 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1333 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1335 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1337 = _1289 * _1263;
    float _1339 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1341 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1333);
    float _1343 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1345 = _1289 * _1255;
    float _1347 = -_1339;
    float _1349 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1347);
    float _1351 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1341);
    float _1353 = log2(_1329);
    float _1355 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1357 = -_1345;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1349);
    float _1361 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1351);
    float _1363 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1365 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1355);
    float _1367 = fma(_1359, -0.5, 0.5);
    float _1369 = fma(_1359, 0.5, 0.5);
    float _1371 = exp2(_1343);
    float _1373 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1363);
    float _1375 = _1337 + 1.0;
    float _1377 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1365);
    float _1379 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1373);
    float _1381 = fma(_1369, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1383 = 1.0 / _1361;
    float _1385 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1379);
    float _1387 = _1353 * 0.693147182464599609375;
    float _1389 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1391 = sqrt(_1367);
    float _1393 = -_1337;
    float _1395 = fma(_1371, _1375, _1393);
    float _1397 = fma(_1369, _1381, -0.212114393711090087890625);
    float _1399 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1377);
    float _1401 = fma(_1395, 0.5, 0.5);
    float _1403 = fma(_1369, _1397, 1.570728778839111328125);
    float _1405 = _1385 * _1383;
    float _1407 = _1399 * _1383;
    float _1409 = fma(_1405, 0.5, 0.5);
    float _1411 = fma(_1407, -0.5, 0.5);
    float _1413 = _1391 * 0.636619746685028076171875;
    float3 _3757 = float3(_1409, _1411, _1389);
    float _1415 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3757, float3(0.0), isnan(_3757)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3757, float3(0.0), isnan(_3757)), level(0.0)).x;
    float3 _3768 = float3(_1409, _1411, _1389);
    float4 _1418 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3768, float3(0.0), isnan(_3768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3768, float3(0.0), isnan(_3768)), level(0.0)).xyzw;
    float _1420 = _1418.x;
    float _1422 = _1418.y;
    float _1424 = _1418.z;
    float _1426 = _1418.w;
    float _1428 = -_1403;
    float _1430 = fma(_1413, _1428, 1.0);
    float2 _3790 = float2(_1430, _1401);
    float3 _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3790, float2(0.0), isnan(_3790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3790, float2(0.0), isnan(_3790)), level(0.0)).xyz;
    float _1436 = _1434.x;
    float _1438 = _1434.y;
    float _1440 = _1434.z;
    float _1442 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1444 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.x = _1105;
    out.m_62.y = _1103;
    out.m_62.z = _1107;
    float _1446 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1444);
    float _1448 = exp2(_1442);
    float _1450 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1446);
    float _1452 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1450);
    float _1454 = _1452 + _1361;
    out.gl_Position.x = _1385;
    out.gl_Position.y = _1399;
    out.gl_Position.z = _1452;
    out.gl_Position.w = _1361;
    float _1456 = _1454 * 0.5;
    float _1458 = -_1448;
    float _1460 = _1458 + 1.0;
    float _1462 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1464 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _1456;
    out.m_64.w = _1361;
    out.m_47.x = _1464;
    float _1466 = _1462 * _1415;
    float _1468 = -_1462;
    float _1470 = _1468 + 1.0;
    float _1472 = _1426 * _1466;
    float _1474 = _1440 * _1466;
    float _1476 = fma(_1436, _1472, _1420);
    float _1478 = fma(_1438, _1472, _1422);
    float _1480 = _1426 * _1470;
    float _1482 = fma(_1426, _1474, _1424);
    out.m_66.x = _1476;
    out.m_66.y = _1478;
    out.m_66.z = _1482;
    out.m_66.w = _1480;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1059 = false;
    bool _455 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1539 = as_type<float>(_101);
        out.gl_Position.z = _1539;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1608 = as_type<float>(_137);
        out.gl_Position.z = _1608;
    }
    if (_129)
    {
        return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_54.w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
    float _167 = 0.0;
    float _169 = _141;
    if (!_153)
    {
        float _171 = _141 * _141;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_139) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_139) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_153;
    float _201 = _181;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _141 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _141);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_153;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _141 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _169 = _255;
    }
    float _257 = _169;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _155, _261);
    float _269 = fma(_257, _157, _263);
    float _271 = fma(_257, _159, _265);
    float _273 = fma(_267, _143, _161);
    float _275 = fma(_269, _143, _163);
    float _277 = fma(_271, _143, _165);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_85);
        float _303 = 1.0 / _301;
        float _305 = _119 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    bool _313 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = isnan(_307);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _307 + _325;
    bool _329 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _331 = isnan(_307);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -_323;
    float _351 = _349 + 1.0;
    float _353 = 1.0 / _347;
    bool _355 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _357 = isnan(_307);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _339 * _351;
    float _369 = -_339;
    float _371 = _369 + 1.0;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _375 = _365 * _371;
    float _377 = 1.0 / _343;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = -_365;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = _327 * _353;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _397 = fma(_389, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _401 = _311 * _377;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _403;
    float _407 = in.m_54.x;
    float _409 = in.m_54.y;
    float _411 = fma(_381, _401, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _413 = fma(_405, _401, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = _411 * _375;
    float _417 = _413 * _375;
    float _419 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _421 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _415);
    float _423 = fma(_399, _367, _419);
    float _425 = fma(_397, _367, _421);
    float _427 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[145].x, _423);
    float _429 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[145].y, _425);
    float _431 = _427 * _407;
    float _433 = _429 * _409;
    bool _435 = !_373;
    float _453;
    if (!_435)
    {
        float _437 = in.m_56.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_85);
        float _459 = 1.0 / _457;
        float _461 = _119 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = in.m_56.x;
    float _467 = in.m_56.y;
    float _469 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _471 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _475 = _473 != 0;
    float _477 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _481 = _479 != 0;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _483;
    float _487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _493 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].z, _471);
    float _495 = 1.0 / _485;
    float _497 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _499 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _501 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].x, _469);
    float _503 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _505 = _497 * _499;
    float _507 = 1.0 / _491;
    float _509 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].x, _501);
    float _511 = _505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _513 = _467 > 0.5;
    float _515 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _517 = _465 > 0.5;
    float _519 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _521 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].y, _515);
    float _523 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].w, _519);
    float _525 = _477 * _487;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _527;
    float _531 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].z, _493);
    float _533 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].y, _521);
    float _535 = 1.0 / _529;
    float _537 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].w, _523);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _543 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _547 = _463 + _545;
    float _549 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _551 = 1.0 / _541;
    float _553 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _555 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _543);
    float _557 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _549);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _561 = _463 + _559;
    float _563 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _553);
    float _565 = _547 * _495;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _569 = _463 + _567;
    float _571 = _533 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _573 = -_193;
    int _575 = _517 ? as_type<int>(_573) : as_type<int>(_193);
    float _577 = _569 * _507;
    float _579 = _561 * _535;
    float _581 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _557);
    float _583 = -_197;
    int _585 = _513 ? as_type<int>(_583) : as_type<int>(_197);
    float _587 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _511);
    float _589 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _555);
    bool _591 = !_481;
    float _593 = _591 ? _197 : as_type<float>(_585);
    float _595 = sqrt(_581);
    float _597 = _509 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _599 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _563);
    bool _601 = !_475;
    float _603 = _601 ? _193 : as_type<float>(_575);
    float _605 = _531 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _607 = _505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _609 = sqrt(_589);
    float _611 = _505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _615 = _463 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _633 = _615 * _551;
    float _635 = sqrt(_599);
    float _637 = _595 * _597;
    float _639 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _607);
    float _641 = _537 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _643 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _587);
    float _645 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _639);
    float _647 = _609 * _571;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _653;
    float _657 = _645 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _659 = _647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _661 = _647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _663 = fma(_623, _577, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _665 = fma(_631, _577, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _667 = _635 * _605;
    float _669 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[24].x, _659);
    float _671 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[26].x, _661);
    float _673 = fma(_651, _577, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _675 = _643 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _677 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _669);
    float _679 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _671);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _681;
    float _685 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].w, _677);
    float _687 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].w, _679);
    bool _689 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _691 = isnan(_463);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _701;
    float _705 = _685 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _707 = _687 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _709 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _611);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _711;
    float _715 = _705 + _657;
    float _717 = _707 + _675;
    float _719 = fma(_683, _579, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    bool _721 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _723 = isnan(_463);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = fma(_703, _579, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _735 = -_699;
    float _737 = _735 + 1.0;
    float _739 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _741 = _715 + _739;
    float _743 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _745 = _717 + _743;
    float _747 = fma(_713, _579, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _749 = _731 * _737;
    float _751 = _741 * _741;
    float _753 = _745 * _745;
    float _755 = fma(_619, _565, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _757 = fma(_627, _565, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _759 = fma(_655, _565, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _761 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _763 = isnan(_463);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -_731;
    float _775 = _773 + 1.0;
    bool _777 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _779 = isnan(_463);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = _751 + _753;
    bool _791 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _793 = isnan(_463);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _771 * _775;
    float _805 = -_771;
    float _807 = _805 + 1.0;
    float _809 = -_787;
    float _811 = _809 + 1.0;
    float _813 = sqrt(_789);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _819 = _787 * _807;
    float _821 = _647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _827 = _801 * _811;
    float _829 = fma(_817, _633, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _831 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _709);
    float _833 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[25].x, _821);
    float _835 = -_801;
    float _837 = _835 + 1.0;
    float _839 = _755 * _827;
    float _841 = _757 * _827;
    float _843 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _833);
    float _845 = _759 * _827;
    float _847 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[123].x, _839);
    float _849 = _831 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _851 = _813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _853 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].w, _843);
    float _855 = fma(_663, _819, _847);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _863 = _853 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _865 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[123].y, _841);
    float _867 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[123].z, _845);
    float _869 = _863 + _849;
    float _871 = fma(_859, _633, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _873 = fma(_665, _819, _865);
    float _875 = fma(_825, _633, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _877 = fma(_673, _819, _867);
    float _879 = fma(_719, _803, _855);
    float _881 = _665;
    float _883 = _751;
    float _885 = _753;
    float _887 = _715;
    float _889 = _717;
    float _891 = _849;
    if (!_851)
    {
        _881 = _869;
    }
    float _893 = _881;
    bool _895 = !_851;
    float _897 = _893;
    if (!_895)
    {
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _901 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _903 = _813 + _901;
        float _905 = rsqrt(_789);
        float _907 = _903 * _899;
        float _909 = _869 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _911 = _907 * 0.15915493667125701904296875;
        float _913 = _911 * 6.283185482025146484375;
        float _915 = sin(_913);
        float _917 = _911 * 6.283185482025146484375;
        float _919 = cos(_917);
        float _921 = fma(_915, _909, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _923 = _905 * _921;
        float _925 = fma(_741, _923, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _927 = _919 + (-1.0);
        float _929 = fma(_745, _923, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _933 = _925 + _931;
        float _935 = _927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _939 = _929 + _937;
        float _941 = _933 * _933;
        float _943 = fma(_869, _919, _935);
        float _945 = _939 * _939;
        _897 = _943;
        _883 = _941;
        _885 = _945;
        _887 = _925;
        _889 = _929;
    }
    float _947 = _897;
    float _949 = _883;
    float _951 = _885;
    float _953 = _887;
    float _955 = _889;
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _959 = _947 + _957;
    float _961 = fma(_733, _803, _873);
    float _963 = fma(_747, _803, _877);
    float _965 = fma(_829, _749, _879);
    float _967 = fma(_959, _959, _949);
    float _969 = fma(_871, _749, _961);
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _973 = fma(_875, _749, _963);
    float _975 = _967 + _951;
    float _977 = _603 + 0.5;
    float _979 = -_593;
    float _981 = _979 + 0.5;
    float _983 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[127].x, _965);
    float _985 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[127].y, _969);
    float _987 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[127].z, _973);
    float _989 = sqrt(_975);
    float _991 = _977 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _993 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _995 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _997 = _985 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _999 = _987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1001 = _991 * _861;
    float _1003 = _995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = _993 * _971;
    float _1007 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1001;
    out.m_58.y = _1005;
    bool _1011 = _989 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1013 = isnan(_989);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1019 = _1015 || _1017;
    out.m_60.x = _1003;
    out.m_60.y = _1007;
    out.m_60.z = _1009;
    float _1021 = _971;
    float _1023 = _999;
    if (!_1019)
    {
        _1021 = 1.0;
    }
    float _1025 = _1021;
    bool _1027 = !_1019;
    float _1029 = _1025;
    if (!_1027)
    {
        bool _1031 = _989 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1033 = isnan(_989);
        bool _1035 = _1031 || _1033;
        bool _1037 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1039 = _1035 || _1037;
        if (!_1039)
        {
            float _1041 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1043 = _989 + _1041;
            float _1045 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1047 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1045;
            float _1049 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1051 = _1049 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1053 = 1.0 / _1047;
            float _1055 = _1043 * _1053;
            float _1057 = fma(_1055, _1051, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1029 = _1057;
            _1059 = true;
        }
        else
        {
            bool _1061 = _989 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1063 = isnan(_989);
            bool _1065 = _1061 || _1063;
            bool _1067 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1069 = _1065 || _1067;
            if (!_1069)
            {
                float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1073 = _989 + _1071;
                float _1075 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1077 = _1075 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1079 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1081 = _1079 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1083 = 1.0 / _1077;
                float _1085 = _1073 * _1083;
                float _1087 = fma(_1085, _1081, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1029 = _1087;
                _1059 = true;
            }
            else
            {
                _1029 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1059 = false;
    float _1089 = _1029;
    float _1091 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1093 = _947 + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1097 = _953 + _1095;
    float _1099 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1101 = _955 + _1099;
    float _1103 = fma(_1093, _1089, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1105 = fma(_1097, _1089, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1107 = fma(_1101, _1089, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1111 = _1103 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1115 = _1105 + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1119 = _1107 + _1117;
    float _1121 = _1111 * _1111;
    float _1123 = fma(_1115, _1115, _1121);
    float _1125 = fma(_1119, _1119, _1123);
    float _1127 = rsqrt(_1125);
    float _1129 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1131 = _1115 * _1129;
    float _1133 = _1119 * _1129;
    float _1135 = _1131 * _1131;
    float _1137 = _1133 * _1133;
    float _1139 = _1135 + _1137;
    float _1141 = sqrt(_1139);
    bool _1143 = _1141 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1147 = _1141 + _1145;
    float _1149 = _1123;
    float _1151 = _1147;
    float _1153 = _1111;
    float _1155 = _1131;
    if (_1143)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1149 = _1157;
    }
    float _1159 = _1149;
    float _1161 = _1159;
    if (_1143)
    {
        float _1163 = _1147 * _1159;
        _1151 = _1163;
    }
    float _1165 = _1151;
    if (_1143)
    {
        float _1167 = rsqrt(_1139);
        _1161 = _1167;
    }
    float _1169 = _1161;
    float _1171 = _1169;
    if (_1143)
    {
        float _1173 = _1165 * 0.15915493667125701904296875;
        _1023 = _1173;
    }
    float _1175 = _1023;
    float _1177 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1179 = _1119;
    if (_1143)
    {
        float _1181 = _1175 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        _1179 = _1183;
    }
    float _1185 = _1179;
    float _1187 = precise::max(0.0, _1177);
    float _1189 = _1127;
    float _1191 = _1187;
    if (_1143)
    {
        float _1193 = _1175 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        _1189 = _1195;
    }
    float _1197 = _1189;
    float _1199 = -_1129;
    float _1201 = -_1187;
    float _1203 = fma(_1111, _1199, _1201);
    if (_1143)
    {
        float _1205 = _1203 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1153 = _1205;
    }
    float _1207 = _1153;
    float _1209 = sqrt(_1125);
    float _1211 = _1185;
    float _1213 = _1207;
    if (_1143)
    {
        float _1215 = fma(_1185, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1211 = _1215;
    }
    float _1217 = _1211;
    float _1219 = _1217;
    if (!_1143)
    {
        _1213 = _1135;
    }
    float _1221 = _1213;
    float _1223 = _1221;
    if (_1143)
    {
        float _1225 = _1169 * _1217;
        _891 = _1225;
    }
    float _1227 = _891;
    if (!_1143)
    {
        _1219 = _1203;
    }
    float _1229 = _1219;
    float _1231 = _1229;
    float _1233 = _1197;
    if (_1143)
    {
        float _1235 = _1197 + (-1.0);
        _1191 = _1235;
    }
    float _1237 = _1191;
    float _1239 = _1237;
    if (_1143)
    {
        float _1241 = _1131 * _1227;
        _1155 = _1241;
    }
    float _1243 = _1155;
    if (_1143)
    {
        float _1245 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1171 = _1245;
    }
    float _1247 = _1171;
    if (!_1143)
    {
        _1239 = _1133;
    }
    float _1249 = _1239;
    float _1251 = _1249;
    if (_1143)
    {
        float _1253 = _1133 * _1227;
        _1251 = _1253;
    }
    float _1255 = _1251;
    if (_1143)
    {
        float _1257 = _1243 * _1243;
        _1223 = _1257;
    }
    float _1259 = _1223;
    if (_1143)
    {
        float _1261 = fma(_1203, _1197, _1247);
        _1231 = _1261;
    }
    float _1263 = _1231;
    if (!_1143)
    {
        _1233 = _1137;
    }
    float _1265 = _1233;
    float _1267 = _1265;
    if (_1143)
    {
        float _1269 = _1255 * _1255;
        _1267 = _1269;
    }
    float _1271 = _1267;
    float _1273 = fma(_1263, _1263, _1259);
    float _1275 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1277 = _1273 + _1271;
    float _1279 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1283 = fma(_1209, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1281);
    float _1285 = precise::clamp(_1283, 0.0, 1.0);
    float _1287 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1275);
    float _1289 = rsqrt(_1277);
    float _1291 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1279);
    float _1293 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1295 = -_1285;
    float _1297 = _1295 + 1.0;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1301 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1291);
    float _1303 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1305 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1293);
    float _1307 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1287);
    float _1309 = abs(_1297);
    float _1311 = log2(_1309);
    float _1313 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1315 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1303);
    float _1317 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1305);
    float _1319 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1321 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1315);
    float _1323 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1325 = _1289 * _1243;
    float _1327 = -_1319;
    float _1329 = fma(_1327, _1299, 1.0);
    float _1331 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1333 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1335 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1337 = _1289 * _1263;
    float _1339 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1341 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1333);
    float _1343 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1345 = _1289 * _1255;
    float _1347 = -_1339;
    float _1349 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1347);
    float _1351 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1341);
    float _1353 = log2(_1329);
    float _1355 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1357 = -_1345;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1349);
    float _1361 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1351);
    float _1363 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1365 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1355);
    float _1367 = fma(_1359, -0.5, 0.5);
    float _1369 = fma(_1359, 0.5, 0.5);
    float _1371 = exp2(_1343);
    float _1373 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1363);
    float _1375 = _1337 + 1.0;
    float _1377 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1365);
    float _1379 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1373);
    float _1381 = fma(_1369, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1383 = 1.0 / _1361;
    float _1385 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1379);
    float _1387 = _1353 * 0.693147182464599609375;
    float _1389 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1391 = sqrt(_1367);
    float _1393 = -_1337;
    float _1395 = fma(_1371, _1375, _1393);
    float _1397 = fma(_1369, _1381, -0.212114393711090087890625);
    float _1399 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1377);
    float _1401 = fma(_1395, 0.5, 0.5);
    float _1403 = fma(_1369, _1397, 1.570728778839111328125);
    float _1405 = _1385 * _1383;
    float _1407 = _1399 * _1383;
    float _1409 = fma(_1405, 0.5, 0.5);
    float _1411 = fma(_1407, -0.5, 0.5);
    float _1413 = _1391 * 0.636619746685028076171875;
    float3 _3757 = float3(_1409, _1411, _1389);
    float _1415 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3757, float3(0.0), isnan(_3757)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3757, float3(0.0), isnan(_3757)), level(0.0)).x;
    float3 _3768 = float3(_1409, _1411, _1389);
    float4 _1418 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3768, float3(0.0), isnan(_3768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3768, float3(0.0), isnan(_3768)), level(0.0)).xyzw;
    float _1420 = _1418.x;
    float _1422 = _1418.y;
    float _1424 = _1418.z;
    float _1426 = _1418.w;
    float _1428 = -_1403;
    float _1430 = fma(_1413, _1428, 1.0);
    float2 _3790 = float2(_1430, _1401);
    float3 _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3790, float2(0.0), isnan(_3790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3790, float2(0.0), isnan(_3790)), level(0.0)).xyz;
    float _1436 = _1434.x;
    float _1438 = _1434.y;
    float _1440 = _1434.z;
    float _1442 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1444 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.x = _1105;
    out.m_62.y = _1103;
    out.m_62.z = _1107;
    float _1446 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1444);
    float _1448 = exp2(_1442);
    float _1450 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1446);
    float _1452 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1450);
    float _1454 = _1452 + _1361;
    out.gl_Position.x = _1385;
    out.gl_Position.y = _1399;
    out.gl_Position.z = _1452;
    out.gl_Position.w = _1361;
    float _1456 = _1454 * 0.5;
    float _1458 = -_1448;
    float _1460 = _1458 + 1.0;
    float _1462 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1464 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _1456;
    out.m_64.w = _1361;
    out.m_47.x = _1464;
    float _1466 = _1462 * _1415;
    float _1468 = -_1462;
    float _1470 = _1468 + 1.0;
    float _1472 = _1426 * _1466;
    float _1474 = _1440 * _1466;
    float _1476 = fma(_1436, _1472, _1420);
    float _1478 = fma(_1438, _1472, _1422);
    float _1480 = _1426 * _1470;
    float _1482 = fma(_1426, _1474, _1424);
    out.m_66.x = _1476;
    out.m_66.y = _1478;
    out.m_66.z = _1482;
    out.m_66.w = _1480;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1059 = false;
    bool _455 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1539 = as_type<float>(_101);
        out.gl_Position.z = _1539;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1608 = as_type<float>(_137);
        out.gl_Position.z = _1608;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_54.w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
    float _167 = 0.0;
    float _169 = _141;
    if (!_153)
    {
        float _171 = _141 * _141;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_139) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_139) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_153;
    float _201 = _181;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _141 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _141);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_153;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _141 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _169 = _255;
    }
    float _257 = _169;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _155, _261);
    float _269 = fma(_257, _157, _263);
    float _271 = fma(_257, _159, _265);
    float _273 = fma(_267, _143, _161);
    float _275 = fma(_269, _143, _163);
    float _277 = fma(_271, _143, _165);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_85);
        float _303 = 1.0 / _301;
        float _305 = _119 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    bool _313 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = isnan(_307);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _307 + _325;
    bool _329 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _331 = isnan(_307);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -_323;
    float _351 = _349 + 1.0;
    float _353 = 1.0 / _347;
    bool _355 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _357 = isnan(_307);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _339 * _351;
    float _369 = -_339;
    float _371 = _369 + 1.0;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _375 = _365 * _371;
    float _377 = 1.0 / _343;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = -_365;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = _327 * _353;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _397 = fma(_389, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _401 = _311 * _377;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _403;
    float _407 = in.m_54.x;
    float _409 = in.m_54.y;
    float _411 = fma(_381, _401, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _413 = fma(_405, _401, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = _411 * _375;
    float _417 = _413 * _375;
    float _419 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _421 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _415);
    float _423 = fma(_399, _367, _419);
    float _425 = fma(_397, _367, _421);
    float _427 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[145].x, _423);
    float _429 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[145].y, _425);
    float _431 = _427 * _407;
    float _433 = _429 * _409;
    bool _435 = !_373;
    float _453;
    if (!_435)
    {
        float _437 = in.m_56.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_85);
        float _459 = 1.0 / _457;
        float _461 = _119 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = in.m_56.x;
    float _467 = in.m_56.y;
    float _469 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _471 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _475 = _473 != 0;
    float _477 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _481 = _479 != 0;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _483;
    float _487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _493 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].z, _471);
    float _495 = 1.0 / _485;
    float _497 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _499 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _501 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].x, _469);
    float _503 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _505 = _497 * _499;
    float _507 = 1.0 / _491;
    float _509 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].x, _501);
    float _511 = _505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _513 = _467 > 0.5;
    float _515 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _517 = _465 > 0.5;
    float _519 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _521 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].y, _515);
    float _523 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].w, _519);
    float _525 = _477 * _487;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _527;
    float _531 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].z, _493);
    float _533 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].y, _521);
    float _535 = 1.0 / _529;
    float _537 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].w, _523);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _543 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _547 = _463 + _545;
    float _549 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _551 = 1.0 / _541;
    float _553 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _555 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _543);
    float _557 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _549);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _561 = _463 + _559;
    float _563 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _553);
    float _565 = _547 * _495;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _569 = _463 + _567;
    float _571 = _533 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _573 = -_193;
    int _575 = _517 ? as_type<int>(_573) : as_type<int>(_193);
    float _577 = _569 * _507;
    float _579 = _561 * _535;
    float _581 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _557);
    float _583 = -_197;
    int _585 = _513 ? as_type<int>(_583) : as_type<int>(_197);
    float _587 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _511);
    float _589 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _555);
    bool _591 = !_481;
    float _593 = _591 ? _197 : as_type<float>(_585);
    float _595 = sqrt(_581);
    float _597 = _509 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _599 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _563);
    bool _601 = !_475;
    float _603 = _601 ? _193 : as_type<float>(_575);
    float _605 = _531 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _607 = _505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _609 = sqrt(_589);
    float _611 = _505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _615 = _463 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _633 = _615 * _551;
    float _635 = sqrt(_599);
    float _637 = _595 * _597;
    float _639 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _607);
    float _641 = _537 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _643 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _587);
    float _645 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _639);
    float _647 = _609 * _571;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _653;
    float _657 = _645 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _659 = _647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _661 = _647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _663 = fma(_623, _577, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _665 = fma(_631, _577, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _667 = _635 * _605;
    float _669 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[24].x, _659);
    float _671 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[26].x, _661);
    float _673 = fma(_651, _577, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _675 = _643 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _677 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _669);
    float _679 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _671);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _681;
    float _685 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].w, _677);
    float _687 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].w, _679);
    bool _689 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _691 = isnan(_463);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _701;
    float _705 = _685 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _707 = _687 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _709 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _611);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _711;
    float _715 = _705 + _657;
    float _717 = _707 + _675;
    float _719 = fma(_683, _579, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    bool _721 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _723 = isnan(_463);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = fma(_703, _579, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _735 = -_699;
    float _737 = _735 + 1.0;
    float _739 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _741 = _715 + _739;
    float _743 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _745 = _717 + _743;
    float _747 = fma(_713, _579, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _749 = _731 * _737;
    float _751 = _741 * _741;
    float _753 = _745 * _745;
    float _755 = fma(_619, _565, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _757 = fma(_627, _565, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _759 = fma(_655, _565, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _761 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _763 = isnan(_463);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -_731;
    float _775 = _773 + 1.0;
    bool _777 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _779 = isnan(_463);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = _751 + _753;
    bool _791 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _793 = isnan(_463);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _771 * _775;
    float _805 = -_771;
    float _807 = _805 + 1.0;
    float _809 = -_787;
    float _811 = _809 + 1.0;
    float _813 = sqrt(_789);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _819 = _787 * _807;
    float _821 = _647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _827 = _801 * _811;
    float _829 = fma(_817, _633, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _831 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _709);
    float _833 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[25].x, _821);
    float _835 = -_801;
    float _837 = _835 + 1.0;
    float _839 = _755 * _827;
    float _841 = _757 * _827;
    float _843 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _833);
    float _845 = _759 * _827;
    float _847 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[123].x, _839);
    float _849 = _831 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _851 = _813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _853 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].w, _843);
    float _855 = fma(_663, _819, _847);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _863 = _853 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _865 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[123].y, _841);
    float _867 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[123].z, _845);
    float _869 = _863 + _849;
    float _871 = fma(_859, _633, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _873 = fma(_665, _819, _865);
    float _875 = fma(_825, _633, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _877 = fma(_673, _819, _867);
    float _879 = fma(_719, _803, _855);
    float _881 = _665;
    float _883 = _751;
    float _885 = _753;
    float _887 = _715;
    float _889 = _717;
    float _891 = _849;
    if (!_851)
    {
        _881 = _869;
    }
    float _893 = _881;
    bool _895 = !_851;
    float _897 = _893;
    if (!_895)
    {
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _901 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _903 = _813 + _901;
        float _905 = rsqrt(_789);
        float _907 = _903 * _899;
        float _909 = _869 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _911 = _907 * 0.15915493667125701904296875;
        float _913 = _911 * 6.283185482025146484375;
        float _915 = sin(_913);
        float _917 = _911 * 6.283185482025146484375;
        float _919 = cos(_917);
        float _921 = fma(_915, _909, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _923 = _905 * _921;
        float _925 = fma(_741, _923, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _927 = _919 + (-1.0);
        float _929 = fma(_745, _923, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _933 = _925 + _931;
        float _935 = _927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _939 = _929 + _937;
        float _941 = _933 * _933;
        float _943 = fma(_869, _919, _935);
        float _945 = _939 * _939;
        _897 = _943;
        _883 = _941;
        _885 = _945;
        _887 = _925;
        _889 = _929;
    }
    float _947 = _897;
    float _949 = _883;
    float _951 = _885;
    float _953 = _887;
    float _955 = _889;
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _959 = _947 + _957;
    float _961 = fma(_733, _803, _873);
    float _963 = fma(_747, _803, _877);
    float _965 = fma(_829, _749, _879);
    float _967 = fma(_959, _959, _949);
    float _969 = fma(_871, _749, _961);
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _973 = fma(_875, _749, _963);
    float _975 = _967 + _951;
    float _977 = _603 + 0.5;
    float _979 = -_593;
    float _981 = _979 + 0.5;
    float _983 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[127].x, _965);
    float _985 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[127].y, _969);
    float _987 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[127].z, _973);
    float _989 = sqrt(_975);
    float _991 = _977 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _993 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _995 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _997 = _985 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _999 = _987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1001 = _991 * _861;
    float _1003 = _995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = _993 * _971;
    float _1007 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1001;
    out.m_58.y = _1005;
    bool _1011 = _989 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1013 = isnan(_989);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1019 = _1015 || _1017;
    out.m_60.x = _1003;
    out.m_60.y = _1007;
    out.m_60.z = _1009;
    float _1021 = _971;
    float _1023 = _999;
    if (!_1019)
    {
        _1021 = 1.0;
    }
    float _1025 = _1021;
    bool _1027 = !_1019;
    float _1029 = _1025;
    if (!_1027)
    {
        bool _1031 = _989 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1033 = isnan(_989);
        bool _1035 = _1031 || _1033;
        bool _1037 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1039 = _1035 || _1037;
        if (!_1039)
        {
            float _1041 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1043 = _989 + _1041;
            float _1045 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1047 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1045;
            float _1049 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1051 = _1049 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1053 = 1.0 / _1047;
            float _1055 = _1043 * _1053;
            float _1057 = fma(_1055, _1051, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1029 = _1057;
            _1059 = true;
        }
        else
        {
            bool _1061 = _989 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1063 = isnan(_989);
            bool _1065 = _1061 || _1063;
            bool _1067 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1069 = _1065 || _1067;
            if (!_1069)
            {
                float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1073 = _989 + _1071;
                float _1075 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1077 = _1075 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1079 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1081 = _1079 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1083 = 1.0 / _1077;
                float _1085 = _1073 * _1083;
                float _1087 = fma(_1085, _1081, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1029 = _1087;
                _1059 = true;
            }
            else
            {
                _1029 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1059 = false;
    float _1089 = _1029;
    float _1091 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1093 = _947 + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1097 = _953 + _1095;
    float _1099 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1101 = _955 + _1099;
    float _1103 = fma(_1093, _1089, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1105 = fma(_1097, _1089, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1107 = fma(_1101, _1089, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1111 = _1103 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1115 = _1105 + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1119 = _1107 + _1117;
    float _1121 = _1111 * _1111;
    float _1123 = fma(_1115, _1115, _1121);
    float _1125 = fma(_1119, _1119, _1123);
    float _1127 = rsqrt(_1125);
    float _1129 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1131 = _1115 * _1129;
    float _1133 = _1119 * _1129;
    float _1135 = _1131 * _1131;
    float _1137 = _1133 * _1133;
    float _1139 = _1135 + _1137;
    float _1141 = sqrt(_1139);
    bool _1143 = _1141 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1147 = _1141 + _1145;
    float _1149 = _1123;
    float _1151 = _1147;
    float _1153 = _1111;
    float _1155 = _1131;
    if (_1143)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1149 = _1157;
    }
    float _1159 = _1149;
    float _1161 = _1159;
    if (_1143)
    {
        float _1163 = _1147 * _1159;
        _1151 = _1163;
    }
    float _1165 = _1151;
    if (_1143)
    {
        float _1167 = rsqrt(_1139);
        _1161 = _1167;
    }
    float _1169 = _1161;
    float _1171 = _1169;
    if (_1143)
    {
        float _1173 = _1165 * 0.15915493667125701904296875;
        _1023 = _1173;
    }
    float _1175 = _1023;
    float _1177 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1179 = _1119;
    if (_1143)
    {
        float _1181 = _1175 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        _1179 = _1183;
    }
    float _1185 = _1179;
    float _1187 = precise::max(0.0, _1177);
    float _1189 = _1127;
    float _1191 = _1187;
    if (_1143)
    {
        float _1193 = _1175 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        _1189 = _1195;
    }
    float _1197 = _1189;
    float _1199 = -_1129;
    float _1201 = -_1187;
    float _1203 = fma(_1111, _1199, _1201);
    if (_1143)
    {
        float _1205 = _1203 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1153 = _1205;
    }
    float _1207 = _1153;
    float _1209 = sqrt(_1125);
    float _1211 = _1185;
    float _1213 = _1207;
    if (_1143)
    {
        float _1215 = fma(_1185, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1211 = _1215;
    }
    float _1217 = _1211;
    float _1219 = _1217;
    if (!_1143)
    {
        _1213 = _1135;
    }
    float _1221 = _1213;
    float _1223 = _1221;
    if (_1143)
    {
        float _1225 = _1169 * _1217;
        _891 = _1225;
    }
    float _1227 = _891;
    if (!_1143)
    {
        _1219 = _1203;
    }
    float _1229 = _1219;
    float _1231 = _1229;
    float _1233 = _1197;
    if (_1143)
    {
        float _1235 = _1197 + (-1.0);
        _1191 = _1235;
    }
    float _1237 = _1191;
    float _1239 = _1237;
    if (_1143)
    {
        float _1241 = _1131 * _1227;
        _1155 = _1241;
    }
    float _1243 = _1155;
    if (_1143)
    {
        float _1245 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1171 = _1245;
    }
    float _1247 = _1171;
    if (!_1143)
    {
        _1239 = _1133;
    }
    float _1249 = _1239;
    float _1251 = _1249;
    if (_1143)
    {
        float _1253 = _1133 * _1227;
        _1251 = _1253;
    }
    float _1255 = _1251;
    if (_1143)
    {
        float _1257 = _1243 * _1243;
        _1223 = _1257;
    }
    float _1259 = _1223;
    if (_1143)
    {
        float _1261 = fma(_1203, _1197, _1247);
        _1231 = _1261;
    }
    float _1263 = _1231;
    if (!_1143)
    {
        _1233 = _1137;
    }
    float _1265 = _1233;
    float _1267 = _1265;
    if (_1143)
    {
        float _1269 = _1255 * _1255;
        _1267 = _1269;
    }
    float _1271 = _1267;
    float _1273 = fma(_1263, _1263, _1259);
    float _1275 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1277 = _1273 + _1271;
    float _1279 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1283 = fma(_1209, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1281);
    float _1285 = precise::clamp(_1283, 0.0, 1.0);
    float _1287 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1275);
    float _1289 = rsqrt(_1277);
    float _1291 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1279);
    float _1293 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1295 = -_1285;
    float _1297 = _1295 + 1.0;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1301 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1291);
    float _1303 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1305 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1293);
    float _1307 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1287);
    float _1309 = abs(_1297);
    float _1311 = log2(_1309);
    float _1313 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1315 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1303);
    float _1317 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1305);
    float _1319 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1321 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1315);
    float _1323 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1325 = _1289 * _1243;
    float _1327 = -_1319;
    float _1329 = fma(_1327, _1299, 1.0);
    float _1331 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1333 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1335 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1337 = _1289 * _1263;
    float _1339 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1341 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1333);
    float _1343 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1345 = _1289 * _1255;
    float _1347 = -_1339;
    float _1349 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1347);
    float _1351 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1341);
    float _1353 = log2(_1329);
    float _1355 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1357 = -_1345;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1349);
    float _1361 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1351);
    float _1363 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1365 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1355);
    float _1367 = fma(_1359, -0.5, 0.5);
    float _1369 = fma(_1359, 0.5, 0.5);
    float _1371 = exp2(_1343);
    float _1373 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1363);
    float _1375 = _1337 + 1.0;
    float _1377 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1365);
    float _1379 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1373);
    float _1381 = fma(_1369, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1383 = 1.0 / _1361;
    float _1385 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1379);
    float _1387 = _1353 * 0.693147182464599609375;
    float _1389 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1391 = sqrt(_1367);
    float _1393 = -_1337;
    float _1395 = fma(_1371, _1375, _1393);
    float _1397 = fma(_1369, _1381, -0.212114393711090087890625);
    float _1399 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1377);
    float _1401 = fma(_1395, 0.5, 0.5);
    float _1403 = fma(_1369, _1397, 1.570728778839111328125);
    float _1405 = _1385 * _1383;
    float _1407 = _1399 * _1383;
    float _1409 = fma(_1405, 0.5, 0.5);
    float _1411 = fma(_1407, -0.5, 0.5);
    float _1413 = _1391 * 0.636619746685028076171875;
    float3 _3757 = float3(_1409, _1411, _1389);
    float _1415 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3757, float3(0.0), isnan(_3757)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3757, float3(0.0), isnan(_3757)), level(0.0)).x;
    float3 _3768 = float3(_1409, _1411, _1389);
    float4 _1418 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3768, float3(0.0), isnan(_3768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3768, float3(0.0), isnan(_3768)), level(0.0)).xyzw;
    float _1420 = _1418.x;
    float _1422 = _1418.y;
    float _1424 = _1418.z;
    float _1426 = _1418.w;
    float _1428 = -_1403;
    float _1430 = fma(_1413, _1428, 1.0);
    float2 _3790 = float2(_1430, _1401);
    float3 _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3790, float2(0.0), isnan(_3790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3790, float2(0.0), isnan(_3790)), level(0.0)).xyz;
    float _1436 = _1434.x;
    float _1438 = _1434.y;
    float _1440 = _1434.z;
    float _1442 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1444 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.x = _1105;
    out.m_62.y = _1103;
    out.m_62.z = _1107;
    float _1446 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1444);
    float _1448 = exp2(_1442);
    float _1450 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1446);
    float _1452 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1450);
    float _1454 = _1452 + _1361;
    out.gl_Position.x = _1385;
    out.gl_Position.y = _1399;
    out.gl_Position.z = _1452;
    out.gl_Position.w = _1361;
    float _1456 = _1454 * 0.5;
    float _1458 = -_1448;
    float _1460 = _1458 + 1.0;
    float _1462 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1464 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _1456;
    out.m_64.w = _1361;
    out.m_47.x = _1464;
    float _1466 = _1462 * _1415;
    float _1468 = -_1462;
    float _1470 = _1468 + 1.0;
    float _1472 = _1426 * _1466;
    float _1474 = _1440 * _1466;
    float _1476 = fma(_1436, _1472, _1420);
    float _1478 = fma(_1438, _1472, _1422);
    float _1480 = _1426 * _1470;
    float _1482 = fma(_1426, _1474, _1424);
    out.m_66.x = _1476;
    out.m_66.y = _1478;
    out.m_66.z = _1482;
    out.m_66.w = _1480;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

