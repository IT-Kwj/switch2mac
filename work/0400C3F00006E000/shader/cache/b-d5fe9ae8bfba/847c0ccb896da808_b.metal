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
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1259 = false;
    bool _615 = false;
    bool _501 = false;
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
        float _1755 = as_type<float>(_101);
        out.gl_Position.z = _1755;
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
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1823 = as_type<float>(_137);
        out.gl_Position.z = _1823;
    }
    if (_131)
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
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _307 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    bool _329 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_307);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _319;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = -_339;
    float _347 = _345 + 1.0;
    float _349 = 1.0 / _323;
    float _351 = 1.0 / _327;
    float _353 = _311 * _341;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _307 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = _357 * _349;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = fma(_367, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _377 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_307);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _315 * _351;
    bool _391 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _393 = isnan(_307);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    bool _403 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _405 = isnan(_307);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = _401 * _347;
    float _421 = -_401;
    float _423 = _421 + 1.0;
    float _425 = -_413;
    float _427 = _425 + 1.0;
    float _429 = _413 * _423;
    float _431 = fma(_417, _363, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = fma(_373, _363, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _435 = _387 * _427;
    float _437 = in.m_54.x;
    float _439 = in.m_54.y;
    float _441 = -_387;
    float _443 = _441 + 1.0;
    float _445 = _369 * _435;
    float _447 = _375 * _435;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _453;
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _461 = fma(_451, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _463 = fma(_455, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _465 = fma(_431, _429, _457);
    float _467 = fma(_433, _429, _459);
    float _469 = fma(_461, _419, _465);
    float _471 = fma(_463, _419, _467);
    float _473 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].x, _469);
    float _475 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].y, _471);
    float _477 = _473 * _437;
    float _479 = _475 * _439;
    bool _481 = !_343;
    float _499;
    if (!_481)
    {
        float _483 = in.m_56.x;
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _487 = _483 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_85);
        float _505 = 1.0 / _503;
        float _507 = _119 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _513 = _509 + _511;
    bool _515 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _517 = isnan(_509);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _527;
    bool _531 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _533 = isnan(_509);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -_525;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _547;
    float _551 = 1.0 / _529;
    bool _553 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _555 = _541 * _545;
    float _557 = -_541;
    float _559 = _557 + 1.0;
    float _561 = _513 * _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _563;
    float _567 = fma(_549, _561, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _569;
    float _573 = fma(_565, _561, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _575 = _567 * _555;
    float _577 = fma(_571, _561, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _579 = _573 * _555;
    float _581 = _577 * _555;
    float _583 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[107].x, _575);
    float _585 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[107].y, _581);
    float _587 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[107].z, _579);
    float _589 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[108].x, _583);
    float _591 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[108].y, _585);
    float _593 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[108].z, _587);
    bool _595 = !_553;
    float _613;
    if (!_595)
    {
        float _597 = in.m_56.x;
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _601 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        float _617 = float(_85);
        float _619 = 1.0 / _617;
        float _621 = _119 * _619;
        _613 = _621;
    }
    _615 = false;
    float _623 = _613;
    float _625 = in.m_56.x;
    float _627 = in.m_56.y;
    float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _631 = _589 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _633 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _635 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _633);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _645 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _647 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _643);
    float _649 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _651 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _637);
    float _653 = 1.0 / _641;
    float _655 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _647);
    float _657 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _659 = _625 > 0.5;
    float _661 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].y, _657);
    bool _665 = _627 > 0.5;
    float _667 = sqrt(_655);
    float _669 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _671 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _649);
    float _673 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _675 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _677 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _671);
    float _679 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].x, _669);
    float _681 = sqrt(_651);
    float _683 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].y, _663);
    float _685 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].z, _673);
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _689 = _687 != 0;
    float _691 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].w, _675);
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _695 = _693 != 0;
    float _697 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].x, _679);
    float _699 = sqrt(_677);
    float _701 = _683 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _703 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].z, _685);
    float _705 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].w, _691);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _707;
    float _711 = _697 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _713 = _667 * _701;
    float _715 = _703 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _717 = _709 * _653;
    float _719 = _681 * _711;
    float _721 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _725 = _623 + _723;
    bool _727 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _729 = isnan(_623);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = _705 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _741 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[25].x, _721);
    float _743 = fma(_717, _725, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _745 = _699 * _715;
    float _747 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _749 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _751 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _753 = isnan(_623);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -_737;
    float _765 = _763 + 1.0;
    float _767 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[24].x, _747);
    float _769 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[26].x, _749);
    float _771 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[25].z, _741);
    float _773 = _761 * _765;
    float _775 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
    float _777 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
    float _779 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].w, _771);
    float _781 = _743 * _773;
    float _783 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].w, _775);
    float _785 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].w, _777);
    float _787 = _779 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _789 = -_193;
    int _791 = _659 ? as_type<int>(_789) : as_type<int>(_193);
    float _793 = _783 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _795 = -_761;
    float _797 = _795 + 1.0;
    float _799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _801 = _787 + _799;
    bool _803 = !_689;
    float _805 = _803 ? _193 : as_type<float>(_791);
    float _807 = _785 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _809 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _811 = _793 + _809;
    float _813 = _801 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _815 = -_197;
    int _817 = _665 ? as_type<int>(_815) : as_type<int>(_197);
    float _819 = _805 + 0.5;
    float _821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _825 = _807 + _823;
    float _827 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[28].x, _813);
    float _829 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[115].x, _781);
    bool _831 = !_695;
    float _833 = _831 ? _197 : as_type<float>(_817);
    float _835 = _819 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[28].z, _827);
    float _839 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[116].x, _829);
    float _841 = _801 * _801;
    float _843 = -_833;
    float _845 = _843 + 0.5;
    float _847 = _835 * _629;
    bool _849 = _837 >= 0.0;
    float _851 = fma(_811, _811, _841);
    float _853 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _855 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = fma(_825, _825, _851);
    float _859 = _853 * _821;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _863 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = rsqrt(_857);
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _869 = 0.0;
    int _871 = as_type<int>(_867);
    if (_849)
    {
        _869 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _873 = _869;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _877 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _839 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_849)
    {
        float _885 = _873 * 5.0;
        _871 = as_type<int>(_885);
    }
    int _887 = _871;
    out.m_58.x = _847;
    out.m_58.y = _859;
    out.m_60.x = _877;
    out.m_60.y = _879;
    out.m_60.z = _881;
    float _889 = _801 * _865;
    float _891 = _811 * _865;
    out.m_62.x = _855;
    out.m_62.y = _863;
    out.m_62.z = _661;
    out.m_62.w = _883;
    if (_849)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3111 = as_type<float>(_887);
        out.gl_Position.z = _3111;
    }
    if (_849)
    {
        out.m_47.x = 0.0;
    }
    if (_849)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _893 = -_889;
    float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    float _897 = _825 * _865;
    float _899 = -_891;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _905 = _895 + _903;
    float _907 = -_897;
    float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[18].w, _807);
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _913 = _901 + _911;
    float _915 = _905 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _919 = _909 + _917;
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[28].x, _915);
    float _923 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].z, _921);
    bool _925 = _923 >= 0.0;
    float _927 = _919;
    if (_925)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _929 = _927;
    int _931 = as_type<int>(_929);
    if (_925)
    {
        out.m_47.x = 0.0;
    }
    if (_925)
    {
        float _933 = _929 * 5.0;
        _931 = as_type<int>(_933);
    }
    int _935 = _931;
    if (_925)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3205 = as_type<float>(_935);
        out.gl_Position.z = _3205;
    }
    if (_925)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _937 = -_787;
    float _939 = _937 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _941 = -_793;
    float _943 = _941 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _945 = -_807;
    float _947 = _945 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _949 = -_889;
    float _951 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _801);
    float _953 = _939 * _939;
    float _955 = -_891;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[18].w, _811);
    float _959 = -_897;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _825);
    float _963 = _951 * _951;
    float _965 = fma(_943, _943, _953);
    float _967 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _969 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _971 = fma(_957, _957, _963);
    float _973 = fma(_947, _947, _965);
    float _975 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _977 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _979 = fma(_961, _961, _971);
    float _981 = rsqrt(_973);
    float _983 = _943 * _981;
    float _985 = _947 * _981;
    float _987 = _939 * _981;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _991 = _983 * _989;
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _995 = _985 * _993;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _999 = _987 * _997;
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1003 = -_991;
    float _1005 = fma(_985, _1001, _1003);
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1009 = -_995;
    float _1011 = fma(_987, _1007, _1009);
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1015 = -_999;
    float _1017 = fma(_983, _1013, _1015);
    float _1019 = sqrt(_979);
    float _1021 = _1005 * _1005;
    float _1023 = fma(_1011, _1011, _1021);
    float _1025 = fma(_1017, _1017, _1023);
    float _1027 = rsqrt(_1025);
    float _1029 = _865 * _1019;
    float _1031 = _1029 * _967;
    float _1033 = _1029 * _975;
    float _1035 = _969 * _1031;
    float _1037 = _977 * _1033;
    float _1039 = _1005 * _1027;
    float _1041 = _1011 * _1027;
    float _1043 = _1017 * _1027;
    float _1045 = _985 * _1039;
    float _1047 = _987 * _1041;
    float _1049 = -_1045;
    float _1051 = fma(_987, _1043, _1049);
    float _1053 = -_1047;
    float _1055 = fma(_983, _1039, _1053);
    float _1057 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1059 = _1057 * 0.5;
    float _1061 = _1035 * _1051;
    float _1063 = _1035 * _1055;
    float _1065 = fma(_1037, _1041, _1061);
    float _1067 = fma(_1037, _1043, _1063);
    float _1069 = fma(_1059, _983, _1065);
    float _1071 = fma(_1059, _985, _1067);
    float _1073 = _793 + _1069;
    float _1075 = _807 + _1071;
    float _1077 = _983 * _1043;
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1081 = _1073 + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1085 = _1075 + _1083;
    float _1087 = -_1077;
    float _1089 = fma(_985, _1041, _1087);
    float _1091 = _1081 * _1081;
    float _1093 = _1085 * _1085;
    float _1095 = _1035 * _1089;
    float _1097 = _1091 + _1093;
    float _1099 = fma(_1037, _1039, _1095);
    float _1101 = sqrt(_1097);
    float _1103 = fma(_1059, _987, _1099);
    float _1105 = _787 + _1103;
    bool _1107 = _1101 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1109 = _1041;
    float _1111 = _983;
    float _1113 = _1059;
    float _1115 = _987;
    float _1117 = _1103;
    float _1119 = _1039;
    float _1121 = _1091;
    if (!_1107)
    {
        _1109 = _1093;
    }
    float _1123 = _1109;
    float _1125 = _1123;
    if (!_1107)
    {
        _1111 = _1091;
    }
    float _1127 = _1111;
    float _1129 = _1127;
    if (!_1107)
    {
        _1113 = _1073;
    }
    float _1131 = _1113;
    float _1133 = _1131;
    if (!_1107)
    {
        _1115 = _1075;
    }
    float _1135 = _1115;
    float _1137 = _1135;
    if (!_1107)
    {
        _1117 = _1105;
    }
    float _1139 = _1117;
    bool _1141 = !_1107;
    float _1143 = _1139;
    if (!_1141)
    {
        float _1145 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1149 = _1101 + _1147;
        float _1151 = rsqrt(_1097);
        float _1153 = _1149 * _1145;
        float _1155 = _1105 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1157 = _1153 * 0.15915493667125701904296875;
        float _1159 = _1157 * 6.283185482025146484375;
        float _1161 = sin(_1159);
        float _1163 = _1157 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        float _1167 = fma(_1161, _1155, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1169 = _1151 * _1167;
        float _1171 = _1165 + (-1.0);
        float _1173 = fma(_1081, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1175 = fma(_1085, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1177 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1181 = _1173 + _1179;
        float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1185 = _1175 + _1183;
        float _1187 = fma(_1105, _1165, _1177);
        float _1189 = _1181 * _1181;
        float _1191 = _1185 * _1185;
        _1143 = _1187;
        _1129 = _1189;
        _1125 = _1191;
        _1133 = _1173;
        _1137 = _1175;
    }
    float _1193 = _1143;
    float _1195 = _1129;
    float _1197 = _1125;
    float _1199 = _1133;
    float _1201 = _1137;
    float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1205 = _1193 + _1203;
    float _1207 = fma(_1205, _1205, _1195);
    float _1209 = _1207 + _1197;
    float _1211 = sqrt(_1209);
    bool _1213 = _1211 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1215 = isnan(_1211);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1221 = _1217 || _1219;
    float _1223 = _1195;
    if (!_1221)
    {
        _1223 = 1.0;
    }
    float _1225 = _1223;
    bool _1227 = !_1221;
    float _1229 = _1225;
    if (!_1227)
    {
        bool _1231 = _1211 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1233 = isnan(_1211);
        bool _1235 = _1231 || _1233;
        bool _1237 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1239 = _1235 || _1237;
        if (!_1239)
        {
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1243 = _1211 + _1241;
            float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1247 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1245;
            float _1249 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1251 = _1249 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1253 = 1.0 / _1247;
            float _1255 = _1243 * _1253;
            float _1257 = fma(_1255, _1251, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1229 = _1257;
            _1119 = _1253;
            _1259 = true;
        }
        else
        {
            bool _1261 = _1211 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1263 = isnan(_1211);
            bool _1265 = _1261 || _1263;
            bool _1267 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1269 = _1265 || _1267;
            if (!_1269)
            {
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1273 = _1211 + _1271;
                float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1277 = _1275 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1279 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1281 = _1279 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1283 = 1.0 / _1277;
                float _1285 = _1273 * _1283;
                float _1287 = fma(_1285, _1281, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1229 = _1287;
                _1119 = _1283;
                _1259 = true;
            }
            else
            {
                _1229 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1259 = false;
    float _1289 = _1229;
    float _1291 = _1119;
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1295 = _1193 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1299 = _1199 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1303 = _1201 + _1301;
    float _1305 = fma(_1295, _1289, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = fma(_1299, _1289, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1309 = fma(_1303, _1289, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1311 = -_889;
    float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1315 = -_891;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1319 = -_897;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1313 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1317 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1321 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = fma(_1333, _1333, _1337);
    float _1341 = rsqrt(_1339);
    float _1343 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1345 = _1329 * _1343;
    float _1347 = _1333 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 + _1351;
    float _1355 = sqrt(_1353);
    bool _1357 = _1355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = _1355 + _1359;
    float _1363 = _1333;
    float _1365 = _1335;
    float _1367 = _1361;
    float _1369 = _1291;
    float _1371 = _1325;
    float _1373 = _1345;
    if (_1357)
    {
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1363 = _1375;
    }
    float _1377 = _1363;
    if (_1357)
    {
        float _1379 = rsqrt(_1353);
        _1365 = _1379;
    }
    float _1381 = _1365;
    float _1383 = _1381;
    if (_1357)
    {
        float _1385 = _1361 * _1377;
        _1367 = _1385;
    }
    float _1387 = _1367;
    if (_1357)
    {
        float _1389 = _1387 * 0.15915493667125701904296875;
        _1369 = _1389;
    }
    float _1391 = _1369;
    float _1393 = _1341;
    if (_1357)
    {
        float _1395 = _1391 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        _1393 = _1397;
    }
    float _1399 = _1393;
    float _1401 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1403 = precise::max(0.0, _1401);
    float _1405 = _1377;
    float _1407 = _1403;
    if (_1357)
    {
        float _1409 = _1391 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        _1405 = _1411;
    }
    float _1413 = _1405;
    float _1415 = -_1343;
    float _1417 = -_1403;
    float _1419 = fma(_1325, _1415, _1417);
    if (_1357)
    {
        float _1421 = _1419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1421;
    }
    float _1423 = _1371;
    float _1425 = sqrt(_1339);
    float _1427 = _1399;
    float _1429 = _1423;
    if (_1357)
    {
        float _1431 = fma(_1399, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1427 = _1431;
    }
    float _1433 = _1427;
    float _1435 = _1433;
    if (!_1357)
    {
        _1429 = _1347;
    }
    float _1437 = _1429;
    float _1439 = _1437;
    float _1441 = _1413;
    if (_1357)
    {
        float _1443 = _1413 + (-1.0);
        _1407 = _1443;
    }
    float _1445 = _1407;
    float _1447 = _1445;
    if (_1357)
    {
        float _1449 = _1381 * _1433;
        _1121 = _1449;
    }
    float _1451 = _1121;
    if (!_1357)
    {
        _1383 = _1419;
    }
    float _1453 = _1383;
    float _1455 = _1453;
    if (_1357)
    {
        float _1457 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1435 = _1457;
    }
    float _1459 = _1435;
    if (_1357)
    {
        float _1461 = _1345 * _1451;
        _1373 = _1461;
    }
    float _1463 = _1373;
    if (!_1357)
    {
        _1447 = _1349;
    }
    float _1465 = _1447;
    float _1467 = _1465;
    if (_1357)
    {
        float _1469 = _1347 * _1451;
        _1439 = _1469;
    }
    float _1471 = _1439;
    if (_1357)
    {
        float _1473 = fma(_1419, _1413, _1459);
        _1455 = _1473;
    }
    float _1475 = _1455;
    if (_1357)
    {
        float _1477 = _1463 * _1463;
        _1467 = _1477;
    }
    float _1479 = _1467;
    if (!_1357)
    {
        _1441 = _1351;
    }
    float _1481 = _1441;
    float _1483 = _1481;
    if (_1357)
    {
        float _1485 = _1471 * _1471;
        _1483 = _1485;
    }
    float _1487 = _1483;
    float _1489 = fma(_1475, _1475, _1479);
    float _1491 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1493 = _1489 + _1487;
    float _1495 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1499 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1497);
    float _1501 = precise::clamp(_1499, 0.0, 1.0);
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1505 = rsqrt(_1493);
    float _1507 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1495);
    float _1509 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1511 = -_1501;
    float _1513 = _1511 + 1.0;
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1491);
    float _1517 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    float _1519 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1521 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1509);
    float _1523 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1525 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1519);
    float _1527 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1521);
    float _1529 = abs(_1513);
    float _1531 = log2(_1529);
    float _1533 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1535 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1525);
    float _1537 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1539 = _1505 * _1463;
    float _1541 = -_1533;
    float _1543 = fma(_1541, _1503, 1.0);
    float _1545 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1515);
    float _1547 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1549 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1551 = _1505 * _1475;
    float _1553 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1555 = _1505 * _1471;
    float _1557 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1549);
    float _1559 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1561 = -_1553;
    float _1563 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1561);
    float _1565 = log2(_1543);
    float _1567 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1557);
    float _1569 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1571 = -_1555;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1563);
    float _1575 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1567);
    float _1579 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1581 = fma(_1573, -0.5, 0.5);
    float _1583 = exp2(_1569);
    float _1585 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1575);
    float _1587 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1579);
    float _1589 = fma(_1573, 0.5, 0.5);
    float _1591 = _1551 + 1.0;
    float _1593 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1585);
    float _1595 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1587);
    float _1597 = fma(_1589, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1599 = 1.0 / _1577;
    float _1601 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1593);
    float _1603 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1595);
    float _1605 = fma(_1589, _1597, -0.212114393711090087890625);
    float _1607 = _1565 * 0.693147182464599609375;
    float _1609 = fma(_1589, _1605, 1.570728778839111328125);
    float _1611 = sqrt(_1581);
    float _1613 = -_1551;
    float _1615 = fma(_1583, _1591, _1613);
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1619 = fma(_1615, 0.5, 0.5);
    float _1621 = _1601 * _1599;
    float _1623 = _1603 * _1599;
    float _1625 = fma(_1621, 0.5, 0.5);
    float _1627 = fma(_1623, -0.5, 0.5);
    float _1629 = _1611 * 0.636619746685028076171875;
    float3 _4335 = float3(_1625, _1627, _1617);
    float _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4335, float3(0.0), isnan(_4335)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4335, float3(0.0), isnan(_4335)), level(0.0)).x;
    float _1633 = -_1609;
    float _1635 = fma(_1629, _1633, 1.0);
    float3 _4351 = float3(_1625, _1627, _1617);
    float4 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4351, float3(0.0), isnan(_4351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4351, float3(0.0), isnan(_4351)), level(0.0)).xyzw;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1638.w;
    float2 _4368 = float2(_1635, _1619);
    float3 _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4368, float2(0.0), isnan(_4368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4368, float2(0.0), isnan(_4368)), level(0.0)).xyz;
    float _1652 = _1650.x;
    float _1654 = _1650.y;
    float _1656 = _1650.z;
    float _1658 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1660 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1662 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1660);
    float _1664 = exp2(_1658);
    float _1666 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1662);
    float _1668 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1666);
    float _1670 = _1668 + _1577;
    out.gl_Position.x = _1601;
    out.gl_Position.y = _1603;
    out.gl_Position.z = _1668;
    out.gl_Position.w = _1577;
    float _1672 = _1670 * 0.5;
    float _1674 = -_1664;
    float _1676 = _1674 + 1.0;
    float _1678 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1680 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1672;
    out.m_64.w = _1577;
    out.m_47.x = _1678;
    float _1682 = _1680 * _1631;
    float _1684 = -_1680;
    float _1686 = _1684 + 1.0;
    float _1688 = _1646 * _1682;
    float _1690 = _1646 * _1686;
    float _1692 = _1656 * _1682;
    float _1694 = fma(_1652, _1688, _1640);
    float _1696 = fma(_1654, _1688, _1642);
    float _1698 = fma(_1646, _1692, _1644);
    out.m_66.x = _1694;
    out.m_66.y = _1696;
    out.m_66.z = _1698;
    out.m_66.w = _1690;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1259 = false;
    bool _615 = false;
    bool _501 = false;
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
        float _1755 = as_type<float>(_101);
        out.gl_Position.z = _1755;
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
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1823 = as_type<float>(_137);
        out.gl_Position.z = _1823;
    }
    if (_131)
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
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _307 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    bool _329 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_307);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _319;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = -_339;
    float _347 = _345 + 1.0;
    float _349 = 1.0 / _323;
    float _351 = 1.0 / _327;
    float _353 = _311 * _341;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _307 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = _357 * _349;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = fma(_367, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _377 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_307);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _315 * _351;
    bool _391 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _393 = isnan(_307);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    bool _403 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _405 = isnan(_307);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = _401 * _347;
    float _421 = -_401;
    float _423 = _421 + 1.0;
    float _425 = -_413;
    float _427 = _425 + 1.0;
    float _429 = _413 * _423;
    float _431 = fma(_417, _363, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = fma(_373, _363, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _435 = _387 * _427;
    float _437 = in.m_54.x;
    float _439 = in.m_54.y;
    float _441 = -_387;
    float _443 = _441 + 1.0;
    float _445 = _369 * _435;
    float _447 = _375 * _435;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _453;
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _461 = fma(_451, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _463 = fma(_455, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _465 = fma(_431, _429, _457);
    float _467 = fma(_433, _429, _459);
    float _469 = fma(_461, _419, _465);
    float _471 = fma(_463, _419, _467);
    float _473 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].x, _469);
    float _475 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].y, _471);
    float _477 = _473 * _437;
    float _479 = _475 * _439;
    bool _481 = !_343;
    float _499;
    if (!_481)
    {
        float _483 = in.m_56.x;
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _487 = _483 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_85);
        float _505 = 1.0 / _503;
        float _507 = _119 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _513 = _509 + _511;
    bool _515 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _517 = isnan(_509);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _527;
    bool _531 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _533 = isnan(_509);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -_525;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _547;
    float _551 = 1.0 / _529;
    bool _553 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _555 = _541 * _545;
    float _557 = -_541;
    float _559 = _557 + 1.0;
    float _561 = _513 * _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _563;
    float _567 = fma(_549, _561, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _569;
    float _573 = fma(_565, _561, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _575 = _567 * _555;
    float _577 = fma(_571, _561, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _579 = _573 * _555;
    float _581 = _577 * _555;
    float _583 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[107].x, _575);
    float _585 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[107].y, _581);
    float _587 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[107].z, _579);
    float _589 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[108].x, _583);
    float _591 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[108].y, _585);
    float _593 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[108].z, _587);
    bool _595 = !_553;
    float _613;
    if (!_595)
    {
        float _597 = in.m_56.x;
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _601 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        float _617 = float(_85);
        float _619 = 1.0 / _617;
        float _621 = _119 * _619;
        _613 = _621;
    }
    _615 = false;
    float _623 = _613;
    float _625 = in.m_56.x;
    float _627 = in.m_56.y;
    float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _631 = _589 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _633 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _635 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _633);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _645 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _647 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _643);
    float _649 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _651 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _637);
    float _653 = 1.0 / _641;
    float _655 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _647);
    float _657 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _659 = _625 > 0.5;
    float _661 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].y, _657);
    bool _665 = _627 > 0.5;
    float _667 = sqrt(_655);
    float _669 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _671 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _649);
    float _673 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _675 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _677 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _671);
    float _679 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].x, _669);
    float _681 = sqrt(_651);
    float _683 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].y, _663);
    float _685 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].z, _673);
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _689 = _687 != 0;
    float _691 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].w, _675);
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _695 = _693 != 0;
    float _697 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].x, _679);
    float _699 = sqrt(_677);
    float _701 = _683 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _703 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].z, _685);
    float _705 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].w, _691);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _707;
    float _711 = _697 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _713 = _667 * _701;
    float _715 = _703 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _717 = _709 * _653;
    float _719 = _681 * _711;
    float _721 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _725 = _623 + _723;
    bool _727 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _729 = isnan(_623);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = _705 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _741 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[25].x, _721);
    float _743 = fma(_717, _725, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _745 = _699 * _715;
    float _747 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _749 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _751 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _753 = isnan(_623);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -_737;
    float _765 = _763 + 1.0;
    float _767 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[24].x, _747);
    float _769 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[26].x, _749);
    float _771 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[25].z, _741);
    float _773 = _761 * _765;
    float _775 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
    float _777 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
    float _779 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].w, _771);
    float _781 = _743 * _773;
    float _783 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].w, _775);
    float _785 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].w, _777);
    float _787 = _779 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _789 = -_193;
    int _791 = _659 ? as_type<int>(_789) : as_type<int>(_193);
    float _793 = _783 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _795 = -_761;
    float _797 = _795 + 1.0;
    float _799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _801 = _787 + _799;
    bool _803 = !_689;
    float _805 = _803 ? _193 : as_type<float>(_791);
    float _807 = _785 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _809 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _811 = _793 + _809;
    float _813 = _801 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _815 = -_197;
    int _817 = _665 ? as_type<int>(_815) : as_type<int>(_197);
    float _819 = _805 + 0.5;
    float _821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _825 = _807 + _823;
    float _827 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[28].x, _813);
    float _829 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[115].x, _781);
    bool _831 = !_695;
    float _833 = _831 ? _197 : as_type<float>(_817);
    float _835 = _819 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[28].z, _827);
    float _839 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[116].x, _829);
    float _841 = _801 * _801;
    float _843 = -_833;
    float _845 = _843 + 0.5;
    float _847 = _835 * _629;
    bool _849 = _837 >= 0.0;
    float _851 = fma(_811, _811, _841);
    float _853 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _855 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = fma(_825, _825, _851);
    float _859 = _853 * _821;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _863 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = rsqrt(_857);
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _869 = 0.0;
    int _871 = as_type<int>(_867);
    if (_849)
    {
        _869 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _873 = _869;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _877 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _839 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_849)
    {
        float _885 = _873 * 5.0;
        _871 = as_type<int>(_885);
    }
    int _887 = _871;
    out.m_58.x = _847;
    out.m_58.y = _859;
    out.m_60.x = _877;
    out.m_60.y = _879;
    out.m_60.z = _881;
    float _889 = _801 * _865;
    float _891 = _811 * _865;
    out.m_62.x = _855;
    out.m_62.y = _863;
    out.m_62.z = _661;
    out.m_62.w = _883;
    if (_849)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3111 = as_type<float>(_887);
        out.gl_Position.z = _3111;
    }
    if (_849)
    {
        out.m_47.x = 0.0;
    }
    if (_849)
    {
        return out;
    }
    float _893 = -_889;
    float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    float _897 = _825 * _865;
    float _899 = -_891;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _905 = _895 + _903;
    float _907 = -_897;
    float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[18].w, _807);
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _913 = _901 + _911;
    float _915 = _905 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _919 = _909 + _917;
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[28].x, _915);
    float _923 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].z, _921);
    bool _925 = _923 >= 0.0;
    float _927 = _919;
    if (_925)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _929 = _927;
    int _931 = as_type<int>(_929);
    if (_925)
    {
        out.m_47.x = 0.0;
    }
    if (_925)
    {
        float _933 = _929 * 5.0;
        _931 = as_type<int>(_933);
    }
    int _935 = _931;
    if (_925)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3205 = as_type<float>(_935);
        out.gl_Position.z = _3205;
    }
    if (_925)
    {
        return out;
    }
    float _937 = -_787;
    float _939 = _937 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _941 = -_793;
    float _943 = _941 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _945 = -_807;
    float _947 = _945 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _949 = -_889;
    float _951 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _801);
    float _953 = _939 * _939;
    float _955 = -_891;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[18].w, _811);
    float _959 = -_897;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _825);
    float _963 = _951 * _951;
    float _965 = fma(_943, _943, _953);
    float _967 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _969 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _971 = fma(_957, _957, _963);
    float _973 = fma(_947, _947, _965);
    float _975 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _977 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _979 = fma(_961, _961, _971);
    float _981 = rsqrt(_973);
    float _983 = _943 * _981;
    float _985 = _947 * _981;
    float _987 = _939 * _981;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _991 = _983 * _989;
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _995 = _985 * _993;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _999 = _987 * _997;
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1003 = -_991;
    float _1005 = fma(_985, _1001, _1003);
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1009 = -_995;
    float _1011 = fma(_987, _1007, _1009);
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1015 = -_999;
    float _1017 = fma(_983, _1013, _1015);
    float _1019 = sqrt(_979);
    float _1021 = _1005 * _1005;
    float _1023 = fma(_1011, _1011, _1021);
    float _1025 = fma(_1017, _1017, _1023);
    float _1027 = rsqrt(_1025);
    float _1029 = _865 * _1019;
    float _1031 = _1029 * _967;
    float _1033 = _1029 * _975;
    float _1035 = _969 * _1031;
    float _1037 = _977 * _1033;
    float _1039 = _1005 * _1027;
    float _1041 = _1011 * _1027;
    float _1043 = _1017 * _1027;
    float _1045 = _985 * _1039;
    float _1047 = _987 * _1041;
    float _1049 = -_1045;
    float _1051 = fma(_987, _1043, _1049);
    float _1053 = -_1047;
    float _1055 = fma(_983, _1039, _1053);
    float _1057 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1059 = _1057 * 0.5;
    float _1061 = _1035 * _1051;
    float _1063 = _1035 * _1055;
    float _1065 = fma(_1037, _1041, _1061);
    float _1067 = fma(_1037, _1043, _1063);
    float _1069 = fma(_1059, _983, _1065);
    float _1071 = fma(_1059, _985, _1067);
    float _1073 = _793 + _1069;
    float _1075 = _807 + _1071;
    float _1077 = _983 * _1043;
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1081 = _1073 + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1085 = _1075 + _1083;
    float _1087 = -_1077;
    float _1089 = fma(_985, _1041, _1087);
    float _1091 = _1081 * _1081;
    float _1093 = _1085 * _1085;
    float _1095 = _1035 * _1089;
    float _1097 = _1091 + _1093;
    float _1099 = fma(_1037, _1039, _1095);
    float _1101 = sqrt(_1097);
    float _1103 = fma(_1059, _987, _1099);
    float _1105 = _787 + _1103;
    bool _1107 = _1101 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1109 = _1041;
    float _1111 = _983;
    float _1113 = _1059;
    float _1115 = _987;
    float _1117 = _1103;
    float _1119 = _1039;
    float _1121 = _1091;
    if (!_1107)
    {
        _1109 = _1093;
    }
    float _1123 = _1109;
    float _1125 = _1123;
    if (!_1107)
    {
        _1111 = _1091;
    }
    float _1127 = _1111;
    float _1129 = _1127;
    if (!_1107)
    {
        _1113 = _1073;
    }
    float _1131 = _1113;
    float _1133 = _1131;
    if (!_1107)
    {
        _1115 = _1075;
    }
    float _1135 = _1115;
    float _1137 = _1135;
    if (!_1107)
    {
        _1117 = _1105;
    }
    float _1139 = _1117;
    bool _1141 = !_1107;
    float _1143 = _1139;
    if (!_1141)
    {
        float _1145 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1149 = _1101 + _1147;
        float _1151 = rsqrt(_1097);
        float _1153 = _1149 * _1145;
        float _1155 = _1105 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1157 = _1153 * 0.15915493667125701904296875;
        float _1159 = _1157 * 6.283185482025146484375;
        float _1161 = sin(_1159);
        float _1163 = _1157 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        float _1167 = fma(_1161, _1155, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1169 = _1151 * _1167;
        float _1171 = _1165 + (-1.0);
        float _1173 = fma(_1081, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1175 = fma(_1085, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1177 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1181 = _1173 + _1179;
        float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1185 = _1175 + _1183;
        float _1187 = fma(_1105, _1165, _1177);
        float _1189 = _1181 * _1181;
        float _1191 = _1185 * _1185;
        _1143 = _1187;
        _1129 = _1189;
        _1125 = _1191;
        _1133 = _1173;
        _1137 = _1175;
    }
    float _1193 = _1143;
    float _1195 = _1129;
    float _1197 = _1125;
    float _1199 = _1133;
    float _1201 = _1137;
    float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1205 = _1193 + _1203;
    float _1207 = fma(_1205, _1205, _1195);
    float _1209 = _1207 + _1197;
    float _1211 = sqrt(_1209);
    bool _1213 = _1211 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1215 = isnan(_1211);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1221 = _1217 || _1219;
    float _1223 = _1195;
    if (!_1221)
    {
        _1223 = 1.0;
    }
    float _1225 = _1223;
    bool _1227 = !_1221;
    float _1229 = _1225;
    if (!_1227)
    {
        bool _1231 = _1211 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1233 = isnan(_1211);
        bool _1235 = _1231 || _1233;
        bool _1237 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1239 = _1235 || _1237;
        if (!_1239)
        {
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1243 = _1211 + _1241;
            float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1247 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1245;
            float _1249 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1251 = _1249 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1253 = 1.0 / _1247;
            float _1255 = _1243 * _1253;
            float _1257 = fma(_1255, _1251, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1229 = _1257;
            _1119 = _1253;
            _1259 = true;
        }
        else
        {
            bool _1261 = _1211 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1263 = isnan(_1211);
            bool _1265 = _1261 || _1263;
            bool _1267 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1269 = _1265 || _1267;
            if (!_1269)
            {
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1273 = _1211 + _1271;
                float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1277 = _1275 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1279 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1281 = _1279 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1283 = 1.0 / _1277;
                float _1285 = _1273 * _1283;
                float _1287 = fma(_1285, _1281, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1229 = _1287;
                _1119 = _1283;
                _1259 = true;
            }
            else
            {
                _1229 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1259 = false;
    float _1289 = _1229;
    float _1291 = _1119;
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1295 = _1193 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1299 = _1199 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1303 = _1201 + _1301;
    float _1305 = fma(_1295, _1289, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = fma(_1299, _1289, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1309 = fma(_1303, _1289, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1311 = -_889;
    float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1315 = -_891;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1319 = -_897;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1313 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1317 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1321 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = fma(_1333, _1333, _1337);
    float _1341 = rsqrt(_1339);
    float _1343 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1345 = _1329 * _1343;
    float _1347 = _1333 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 + _1351;
    float _1355 = sqrt(_1353);
    bool _1357 = _1355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = _1355 + _1359;
    float _1363 = _1333;
    float _1365 = _1335;
    float _1367 = _1361;
    float _1369 = _1291;
    float _1371 = _1325;
    float _1373 = _1345;
    if (_1357)
    {
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1363 = _1375;
    }
    float _1377 = _1363;
    if (_1357)
    {
        float _1379 = rsqrt(_1353);
        _1365 = _1379;
    }
    float _1381 = _1365;
    float _1383 = _1381;
    if (_1357)
    {
        float _1385 = _1361 * _1377;
        _1367 = _1385;
    }
    float _1387 = _1367;
    if (_1357)
    {
        float _1389 = _1387 * 0.15915493667125701904296875;
        _1369 = _1389;
    }
    float _1391 = _1369;
    float _1393 = _1341;
    if (_1357)
    {
        float _1395 = _1391 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        _1393 = _1397;
    }
    float _1399 = _1393;
    float _1401 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1403 = precise::max(0.0, _1401);
    float _1405 = _1377;
    float _1407 = _1403;
    if (_1357)
    {
        float _1409 = _1391 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        _1405 = _1411;
    }
    float _1413 = _1405;
    float _1415 = -_1343;
    float _1417 = -_1403;
    float _1419 = fma(_1325, _1415, _1417);
    if (_1357)
    {
        float _1421 = _1419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1421;
    }
    float _1423 = _1371;
    float _1425 = sqrt(_1339);
    float _1427 = _1399;
    float _1429 = _1423;
    if (_1357)
    {
        float _1431 = fma(_1399, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1427 = _1431;
    }
    float _1433 = _1427;
    float _1435 = _1433;
    if (!_1357)
    {
        _1429 = _1347;
    }
    float _1437 = _1429;
    float _1439 = _1437;
    float _1441 = _1413;
    if (_1357)
    {
        float _1443 = _1413 + (-1.0);
        _1407 = _1443;
    }
    float _1445 = _1407;
    float _1447 = _1445;
    if (_1357)
    {
        float _1449 = _1381 * _1433;
        _1121 = _1449;
    }
    float _1451 = _1121;
    if (!_1357)
    {
        _1383 = _1419;
    }
    float _1453 = _1383;
    float _1455 = _1453;
    if (_1357)
    {
        float _1457 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1435 = _1457;
    }
    float _1459 = _1435;
    if (_1357)
    {
        float _1461 = _1345 * _1451;
        _1373 = _1461;
    }
    float _1463 = _1373;
    if (!_1357)
    {
        _1447 = _1349;
    }
    float _1465 = _1447;
    float _1467 = _1465;
    if (_1357)
    {
        float _1469 = _1347 * _1451;
        _1439 = _1469;
    }
    float _1471 = _1439;
    if (_1357)
    {
        float _1473 = fma(_1419, _1413, _1459);
        _1455 = _1473;
    }
    float _1475 = _1455;
    if (_1357)
    {
        float _1477 = _1463 * _1463;
        _1467 = _1477;
    }
    float _1479 = _1467;
    if (!_1357)
    {
        _1441 = _1351;
    }
    float _1481 = _1441;
    float _1483 = _1481;
    if (_1357)
    {
        float _1485 = _1471 * _1471;
        _1483 = _1485;
    }
    float _1487 = _1483;
    float _1489 = fma(_1475, _1475, _1479);
    float _1491 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1493 = _1489 + _1487;
    float _1495 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1499 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1497);
    float _1501 = precise::clamp(_1499, 0.0, 1.0);
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1505 = rsqrt(_1493);
    float _1507 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1495);
    float _1509 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1511 = -_1501;
    float _1513 = _1511 + 1.0;
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1491);
    float _1517 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    float _1519 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1521 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1509);
    float _1523 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1525 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1519);
    float _1527 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1521);
    float _1529 = abs(_1513);
    float _1531 = log2(_1529);
    float _1533 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1535 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1525);
    float _1537 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1539 = _1505 * _1463;
    float _1541 = -_1533;
    float _1543 = fma(_1541, _1503, 1.0);
    float _1545 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1515);
    float _1547 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1549 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1551 = _1505 * _1475;
    float _1553 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1555 = _1505 * _1471;
    float _1557 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1549);
    float _1559 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1561 = -_1553;
    float _1563 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1561);
    float _1565 = log2(_1543);
    float _1567 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1557);
    float _1569 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1571 = -_1555;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1563);
    float _1575 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1567);
    float _1579 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1581 = fma(_1573, -0.5, 0.5);
    float _1583 = exp2(_1569);
    float _1585 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1575);
    float _1587 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1579);
    float _1589 = fma(_1573, 0.5, 0.5);
    float _1591 = _1551 + 1.0;
    float _1593 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1585);
    float _1595 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1587);
    float _1597 = fma(_1589, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1599 = 1.0 / _1577;
    float _1601 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1593);
    float _1603 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1595);
    float _1605 = fma(_1589, _1597, -0.212114393711090087890625);
    float _1607 = _1565 * 0.693147182464599609375;
    float _1609 = fma(_1589, _1605, 1.570728778839111328125);
    float _1611 = sqrt(_1581);
    float _1613 = -_1551;
    float _1615 = fma(_1583, _1591, _1613);
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1619 = fma(_1615, 0.5, 0.5);
    float _1621 = _1601 * _1599;
    float _1623 = _1603 * _1599;
    float _1625 = fma(_1621, 0.5, 0.5);
    float _1627 = fma(_1623, -0.5, 0.5);
    float _1629 = _1611 * 0.636619746685028076171875;
    float3 _4335 = float3(_1625, _1627, _1617);
    float _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4335, float3(0.0), isnan(_4335)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4335, float3(0.0), isnan(_4335)), level(0.0)).x;
    float _1633 = -_1609;
    float _1635 = fma(_1629, _1633, 1.0);
    float3 _4351 = float3(_1625, _1627, _1617);
    float4 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4351, float3(0.0), isnan(_4351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4351, float3(0.0), isnan(_4351)), level(0.0)).xyzw;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1638.w;
    float2 _4368 = float2(_1635, _1619);
    float3 _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4368, float2(0.0), isnan(_4368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4368, float2(0.0), isnan(_4368)), level(0.0)).xyz;
    float _1652 = _1650.x;
    float _1654 = _1650.y;
    float _1656 = _1650.z;
    float _1658 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1660 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1662 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1660);
    float _1664 = exp2(_1658);
    float _1666 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1662);
    float _1668 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1666);
    float _1670 = _1668 + _1577;
    out.gl_Position.x = _1601;
    out.gl_Position.y = _1603;
    out.gl_Position.z = _1668;
    out.gl_Position.w = _1577;
    float _1672 = _1670 * 0.5;
    float _1674 = -_1664;
    float _1676 = _1674 + 1.0;
    float _1678 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1680 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1672;
    out.m_64.w = _1577;
    out.m_47.x = _1678;
    float _1682 = _1680 * _1631;
    float _1684 = -_1680;
    float _1686 = _1684 + 1.0;
    float _1688 = _1646 * _1682;
    float _1690 = _1646 * _1686;
    float _1692 = _1656 * _1682;
    float _1694 = fma(_1652, _1688, _1640);
    float _1696 = fma(_1654, _1688, _1642);
    float _1698 = fma(_1646, _1692, _1644);
    out.m_66.x = _1694;
    out.m_66.y = _1696;
    out.m_66.z = _1698;
    out.m_66.w = _1690;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1259 = false;
    bool _615 = false;
    bool _501 = false;
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
        float _1755 = as_type<float>(_101);
        out.gl_Position.z = _1755;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1823 = as_type<float>(_137);
        out.gl_Position.z = _1823;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _307 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    bool _329 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_307);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _319;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = -_339;
    float _347 = _345 + 1.0;
    float _349 = 1.0 / _323;
    float _351 = 1.0 / _327;
    float _353 = _311 * _341;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _307 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = _357 * _349;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = fma(_367, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _377 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_307);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _315 * _351;
    bool _391 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _393 = isnan(_307);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    bool _403 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _405 = isnan(_307);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = _401 * _347;
    float _421 = -_401;
    float _423 = _421 + 1.0;
    float _425 = -_413;
    float _427 = _425 + 1.0;
    float _429 = _413 * _423;
    float _431 = fma(_417, _363, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = fma(_373, _363, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _435 = _387 * _427;
    float _437 = in.m_54.x;
    float _439 = in.m_54.y;
    float _441 = -_387;
    float _443 = _441 + 1.0;
    float _445 = _369 * _435;
    float _447 = _375 * _435;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _453;
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _461 = fma(_451, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _463 = fma(_455, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _465 = fma(_431, _429, _457);
    float _467 = fma(_433, _429, _459);
    float _469 = fma(_461, _419, _465);
    float _471 = fma(_463, _419, _467);
    float _473 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].x, _469);
    float _475 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].y, _471);
    float _477 = _473 * _437;
    float _479 = _475 * _439;
    bool _481 = !_343;
    float _499;
    if (!_481)
    {
        float _483 = in.m_56.x;
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _487 = _483 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_85);
        float _505 = 1.0 / _503;
        float _507 = _119 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _513 = _509 + _511;
    bool _515 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _517 = isnan(_509);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _527;
    bool _531 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _533 = isnan(_509);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -_525;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _547;
    float _551 = 1.0 / _529;
    bool _553 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _555 = _541 * _545;
    float _557 = -_541;
    float _559 = _557 + 1.0;
    float _561 = _513 * _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _563;
    float _567 = fma(_549, _561, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _569;
    float _573 = fma(_565, _561, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _575 = _567 * _555;
    float _577 = fma(_571, _561, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _579 = _573 * _555;
    float _581 = _577 * _555;
    float _583 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[107].x, _575);
    float _585 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[107].y, _581);
    float _587 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[107].z, _579);
    float _589 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[108].x, _583);
    float _591 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[108].y, _585);
    float _593 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[108].z, _587);
    bool _595 = !_553;
    float _613;
    if (!_595)
    {
        float _597 = in.m_56.x;
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _601 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        float _617 = float(_85);
        float _619 = 1.0 / _617;
        float _621 = _119 * _619;
        _613 = _621;
    }
    _615 = false;
    float _623 = _613;
    float _625 = in.m_56.x;
    float _627 = in.m_56.y;
    float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _631 = _589 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _633 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _635 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _633);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _645 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _647 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _643);
    float _649 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _651 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _637);
    float _653 = 1.0 / _641;
    float _655 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _647);
    float _657 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _659 = _625 > 0.5;
    float _661 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].y, _657);
    bool _665 = _627 > 0.5;
    float _667 = sqrt(_655);
    float _669 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _671 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _649);
    float _673 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _675 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _677 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _671);
    float _679 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].x, _669);
    float _681 = sqrt(_651);
    float _683 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].y, _663);
    float _685 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].z, _673);
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _689 = _687 != 0;
    float _691 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].w, _675);
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _695 = _693 != 0;
    float _697 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].x, _679);
    float _699 = sqrt(_677);
    float _701 = _683 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _703 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].z, _685);
    float _705 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].w, _691);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _707;
    float _711 = _697 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _713 = _667 * _701;
    float _715 = _703 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _717 = _709 * _653;
    float _719 = _681 * _711;
    float _721 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _725 = _623 + _723;
    bool _727 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _729 = isnan(_623);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = _705 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _741 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[25].x, _721);
    float _743 = fma(_717, _725, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _745 = _699 * _715;
    float _747 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _749 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _751 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _753 = isnan(_623);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -_737;
    float _765 = _763 + 1.0;
    float _767 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[24].x, _747);
    float _769 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[26].x, _749);
    float _771 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[25].z, _741);
    float _773 = _761 * _765;
    float _775 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
    float _777 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
    float _779 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].w, _771);
    float _781 = _743 * _773;
    float _783 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].w, _775);
    float _785 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].w, _777);
    float _787 = _779 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _789 = -_193;
    int _791 = _659 ? as_type<int>(_789) : as_type<int>(_193);
    float _793 = _783 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _795 = -_761;
    float _797 = _795 + 1.0;
    float _799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _801 = _787 + _799;
    bool _803 = !_689;
    float _805 = _803 ? _193 : as_type<float>(_791);
    float _807 = _785 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _809 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _811 = _793 + _809;
    float _813 = _801 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _815 = -_197;
    int _817 = _665 ? as_type<int>(_815) : as_type<int>(_197);
    float _819 = _805 + 0.5;
    float _821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _825 = _807 + _823;
    float _827 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[28].x, _813);
    float _829 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[115].x, _781);
    bool _831 = !_695;
    float _833 = _831 ? _197 : as_type<float>(_817);
    float _835 = _819 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[28].z, _827);
    float _839 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[116].x, _829);
    float _841 = _801 * _801;
    float _843 = -_833;
    float _845 = _843 + 0.5;
    float _847 = _835 * _629;
    bool _849 = _837 >= 0.0;
    float _851 = fma(_811, _811, _841);
    float _853 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _855 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = fma(_825, _825, _851);
    float _859 = _853 * _821;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _863 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = rsqrt(_857);
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _869 = 0.0;
    int _871 = as_type<int>(_867);
    if (_849)
    {
        _869 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _873 = _869;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _877 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _839 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_849)
    {
        float _885 = _873 * 5.0;
        _871 = as_type<int>(_885);
    }
    int _887 = _871;
    out.m_58.x = _847;
    out.m_58.y = _859;
    out.m_60.x = _877;
    out.m_60.y = _879;
    out.m_60.z = _881;
    float _889 = _801 * _865;
    float _891 = _811 * _865;
    out.m_62.x = _855;
    out.m_62.y = _863;
    out.m_62.z = _661;
    out.m_62.w = _883;
    if (_849)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3111 = as_type<float>(_887);
        out.gl_Position.z = _3111;
    }
    if (_849)
    {
        out.m_47.x = 0.0;
    }
    if (_849)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _893 = -_889;
    float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    float _897 = _825 * _865;
    float _899 = -_891;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _905 = _895 + _903;
    float _907 = -_897;
    float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[18].w, _807);
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _913 = _901 + _911;
    float _915 = _905 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _919 = _909 + _917;
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[28].x, _915);
    float _923 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].z, _921);
    bool _925 = _923 >= 0.0;
    float _927 = _919;
    if (_925)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _929 = _927;
    int _931 = as_type<int>(_929);
    if (_925)
    {
        out.m_47.x = 0.0;
    }
    if (_925)
    {
        float _933 = _929 * 5.0;
        _931 = as_type<int>(_933);
    }
    int _935 = _931;
    if (_925)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3205 = as_type<float>(_935);
        out.gl_Position.z = _3205;
    }
    if (_925)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _937 = -_787;
    float _939 = _937 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _941 = -_793;
    float _943 = _941 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _945 = -_807;
    float _947 = _945 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _949 = -_889;
    float _951 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _801);
    float _953 = _939 * _939;
    float _955 = -_891;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[18].w, _811);
    float _959 = -_897;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _825);
    float _963 = _951 * _951;
    float _965 = fma(_943, _943, _953);
    float _967 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _969 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _971 = fma(_957, _957, _963);
    float _973 = fma(_947, _947, _965);
    float _975 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _977 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _979 = fma(_961, _961, _971);
    float _981 = rsqrt(_973);
    float _983 = _943 * _981;
    float _985 = _947 * _981;
    float _987 = _939 * _981;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _991 = _983 * _989;
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _995 = _985 * _993;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _999 = _987 * _997;
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1003 = -_991;
    float _1005 = fma(_985, _1001, _1003);
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1009 = -_995;
    float _1011 = fma(_987, _1007, _1009);
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1015 = -_999;
    float _1017 = fma(_983, _1013, _1015);
    float _1019 = sqrt(_979);
    float _1021 = _1005 * _1005;
    float _1023 = fma(_1011, _1011, _1021);
    float _1025 = fma(_1017, _1017, _1023);
    float _1027 = rsqrt(_1025);
    float _1029 = _865 * _1019;
    float _1031 = _1029 * _967;
    float _1033 = _1029 * _975;
    float _1035 = _969 * _1031;
    float _1037 = _977 * _1033;
    float _1039 = _1005 * _1027;
    float _1041 = _1011 * _1027;
    float _1043 = _1017 * _1027;
    float _1045 = _985 * _1039;
    float _1047 = _987 * _1041;
    float _1049 = -_1045;
    float _1051 = fma(_987, _1043, _1049);
    float _1053 = -_1047;
    float _1055 = fma(_983, _1039, _1053);
    float _1057 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1059 = _1057 * 0.5;
    float _1061 = _1035 * _1051;
    float _1063 = _1035 * _1055;
    float _1065 = fma(_1037, _1041, _1061);
    float _1067 = fma(_1037, _1043, _1063);
    float _1069 = fma(_1059, _983, _1065);
    float _1071 = fma(_1059, _985, _1067);
    float _1073 = _793 + _1069;
    float _1075 = _807 + _1071;
    float _1077 = _983 * _1043;
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1081 = _1073 + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1085 = _1075 + _1083;
    float _1087 = -_1077;
    float _1089 = fma(_985, _1041, _1087);
    float _1091 = _1081 * _1081;
    float _1093 = _1085 * _1085;
    float _1095 = _1035 * _1089;
    float _1097 = _1091 + _1093;
    float _1099 = fma(_1037, _1039, _1095);
    float _1101 = sqrt(_1097);
    float _1103 = fma(_1059, _987, _1099);
    float _1105 = _787 + _1103;
    bool _1107 = _1101 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1109 = _1041;
    float _1111 = _983;
    float _1113 = _1059;
    float _1115 = _987;
    float _1117 = _1103;
    float _1119 = _1039;
    float _1121 = _1091;
    if (!_1107)
    {
        _1109 = _1093;
    }
    float _1123 = _1109;
    float _1125 = _1123;
    if (!_1107)
    {
        _1111 = _1091;
    }
    float _1127 = _1111;
    float _1129 = _1127;
    if (!_1107)
    {
        _1113 = _1073;
    }
    float _1131 = _1113;
    float _1133 = _1131;
    if (!_1107)
    {
        _1115 = _1075;
    }
    float _1135 = _1115;
    float _1137 = _1135;
    if (!_1107)
    {
        _1117 = _1105;
    }
    float _1139 = _1117;
    bool _1141 = !_1107;
    float _1143 = _1139;
    if (!_1141)
    {
        float _1145 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1149 = _1101 + _1147;
        float _1151 = rsqrt(_1097);
        float _1153 = _1149 * _1145;
        float _1155 = _1105 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1157 = _1153 * 0.15915493667125701904296875;
        float _1159 = _1157 * 6.283185482025146484375;
        float _1161 = sin(_1159);
        float _1163 = _1157 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        float _1167 = fma(_1161, _1155, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1169 = _1151 * _1167;
        float _1171 = _1165 + (-1.0);
        float _1173 = fma(_1081, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1175 = fma(_1085, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1177 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1181 = _1173 + _1179;
        float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1185 = _1175 + _1183;
        float _1187 = fma(_1105, _1165, _1177);
        float _1189 = _1181 * _1181;
        float _1191 = _1185 * _1185;
        _1143 = _1187;
        _1129 = _1189;
        _1125 = _1191;
        _1133 = _1173;
        _1137 = _1175;
    }
    float _1193 = _1143;
    float _1195 = _1129;
    float _1197 = _1125;
    float _1199 = _1133;
    float _1201 = _1137;
    float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1205 = _1193 + _1203;
    float _1207 = fma(_1205, _1205, _1195);
    float _1209 = _1207 + _1197;
    float _1211 = sqrt(_1209);
    bool _1213 = _1211 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1215 = isnan(_1211);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1221 = _1217 || _1219;
    float _1223 = _1195;
    if (!_1221)
    {
        _1223 = 1.0;
    }
    float _1225 = _1223;
    bool _1227 = !_1221;
    float _1229 = _1225;
    if (!_1227)
    {
        bool _1231 = _1211 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1233 = isnan(_1211);
        bool _1235 = _1231 || _1233;
        bool _1237 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1239 = _1235 || _1237;
        if (!_1239)
        {
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1243 = _1211 + _1241;
            float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1247 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1245;
            float _1249 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1251 = _1249 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1253 = 1.0 / _1247;
            float _1255 = _1243 * _1253;
            float _1257 = fma(_1255, _1251, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1229 = _1257;
            _1119 = _1253;
            _1259 = true;
        }
        else
        {
            bool _1261 = _1211 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1263 = isnan(_1211);
            bool _1265 = _1261 || _1263;
            bool _1267 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1269 = _1265 || _1267;
            if (!_1269)
            {
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1273 = _1211 + _1271;
                float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1277 = _1275 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1279 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1281 = _1279 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1283 = 1.0 / _1277;
                float _1285 = _1273 * _1283;
                float _1287 = fma(_1285, _1281, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1229 = _1287;
                _1119 = _1283;
                _1259 = true;
            }
            else
            {
                _1229 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1259 = false;
    float _1289 = _1229;
    float _1291 = _1119;
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1295 = _1193 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1299 = _1199 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1303 = _1201 + _1301;
    float _1305 = fma(_1295, _1289, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = fma(_1299, _1289, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1309 = fma(_1303, _1289, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1311 = -_889;
    float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1315 = -_891;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1319 = -_897;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1313 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1317 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1321 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = fma(_1333, _1333, _1337);
    float _1341 = rsqrt(_1339);
    float _1343 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1345 = _1329 * _1343;
    float _1347 = _1333 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 + _1351;
    float _1355 = sqrt(_1353);
    bool _1357 = _1355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = _1355 + _1359;
    float _1363 = _1333;
    float _1365 = _1335;
    float _1367 = _1361;
    float _1369 = _1291;
    float _1371 = _1325;
    float _1373 = _1345;
    if (_1357)
    {
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1363 = _1375;
    }
    float _1377 = _1363;
    if (_1357)
    {
        float _1379 = rsqrt(_1353);
        _1365 = _1379;
    }
    float _1381 = _1365;
    float _1383 = _1381;
    if (_1357)
    {
        float _1385 = _1361 * _1377;
        _1367 = _1385;
    }
    float _1387 = _1367;
    if (_1357)
    {
        float _1389 = _1387 * 0.15915493667125701904296875;
        _1369 = _1389;
    }
    float _1391 = _1369;
    float _1393 = _1341;
    if (_1357)
    {
        float _1395 = _1391 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        _1393 = _1397;
    }
    float _1399 = _1393;
    float _1401 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1403 = precise::max(0.0, _1401);
    float _1405 = _1377;
    float _1407 = _1403;
    if (_1357)
    {
        float _1409 = _1391 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        _1405 = _1411;
    }
    float _1413 = _1405;
    float _1415 = -_1343;
    float _1417 = -_1403;
    float _1419 = fma(_1325, _1415, _1417);
    if (_1357)
    {
        float _1421 = _1419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1421;
    }
    float _1423 = _1371;
    float _1425 = sqrt(_1339);
    float _1427 = _1399;
    float _1429 = _1423;
    if (_1357)
    {
        float _1431 = fma(_1399, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1427 = _1431;
    }
    float _1433 = _1427;
    float _1435 = _1433;
    if (!_1357)
    {
        _1429 = _1347;
    }
    float _1437 = _1429;
    float _1439 = _1437;
    float _1441 = _1413;
    if (_1357)
    {
        float _1443 = _1413 + (-1.0);
        _1407 = _1443;
    }
    float _1445 = _1407;
    float _1447 = _1445;
    if (_1357)
    {
        float _1449 = _1381 * _1433;
        _1121 = _1449;
    }
    float _1451 = _1121;
    if (!_1357)
    {
        _1383 = _1419;
    }
    float _1453 = _1383;
    float _1455 = _1453;
    if (_1357)
    {
        float _1457 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1435 = _1457;
    }
    float _1459 = _1435;
    if (_1357)
    {
        float _1461 = _1345 * _1451;
        _1373 = _1461;
    }
    float _1463 = _1373;
    if (!_1357)
    {
        _1447 = _1349;
    }
    float _1465 = _1447;
    float _1467 = _1465;
    if (_1357)
    {
        float _1469 = _1347 * _1451;
        _1439 = _1469;
    }
    float _1471 = _1439;
    if (_1357)
    {
        float _1473 = fma(_1419, _1413, _1459);
        _1455 = _1473;
    }
    float _1475 = _1455;
    if (_1357)
    {
        float _1477 = _1463 * _1463;
        _1467 = _1477;
    }
    float _1479 = _1467;
    if (!_1357)
    {
        _1441 = _1351;
    }
    float _1481 = _1441;
    float _1483 = _1481;
    if (_1357)
    {
        float _1485 = _1471 * _1471;
        _1483 = _1485;
    }
    float _1487 = _1483;
    float _1489 = fma(_1475, _1475, _1479);
    float _1491 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1493 = _1489 + _1487;
    float _1495 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1499 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1497);
    float _1501 = precise::clamp(_1499, 0.0, 1.0);
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1505 = rsqrt(_1493);
    float _1507 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1495);
    float _1509 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1511 = -_1501;
    float _1513 = _1511 + 1.0;
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1491);
    float _1517 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    float _1519 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1521 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1509);
    float _1523 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1525 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1519);
    float _1527 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1521);
    float _1529 = abs(_1513);
    float _1531 = log2(_1529);
    float _1533 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1535 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1525);
    float _1537 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1539 = _1505 * _1463;
    float _1541 = -_1533;
    float _1543 = fma(_1541, _1503, 1.0);
    float _1545 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1515);
    float _1547 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1549 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1551 = _1505 * _1475;
    float _1553 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1555 = _1505 * _1471;
    float _1557 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1549);
    float _1559 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1561 = -_1553;
    float _1563 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1561);
    float _1565 = log2(_1543);
    float _1567 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1557);
    float _1569 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1571 = -_1555;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1563);
    float _1575 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1567);
    float _1579 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1581 = fma(_1573, -0.5, 0.5);
    float _1583 = exp2(_1569);
    float _1585 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1575);
    float _1587 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1579);
    float _1589 = fma(_1573, 0.5, 0.5);
    float _1591 = _1551 + 1.0;
    float _1593 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1585);
    float _1595 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1587);
    float _1597 = fma(_1589, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1599 = 1.0 / _1577;
    float _1601 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1593);
    float _1603 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1595);
    float _1605 = fma(_1589, _1597, -0.212114393711090087890625);
    float _1607 = _1565 * 0.693147182464599609375;
    float _1609 = fma(_1589, _1605, 1.570728778839111328125);
    float _1611 = sqrt(_1581);
    float _1613 = -_1551;
    float _1615 = fma(_1583, _1591, _1613);
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1619 = fma(_1615, 0.5, 0.5);
    float _1621 = _1601 * _1599;
    float _1623 = _1603 * _1599;
    float _1625 = fma(_1621, 0.5, 0.5);
    float _1627 = fma(_1623, -0.5, 0.5);
    float _1629 = _1611 * 0.636619746685028076171875;
    float3 _4335 = float3(_1625, _1627, _1617);
    float _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4335, float3(0.0), isnan(_4335)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4335, float3(0.0), isnan(_4335)), level(0.0)).x;
    float _1633 = -_1609;
    float _1635 = fma(_1629, _1633, 1.0);
    float3 _4351 = float3(_1625, _1627, _1617);
    float4 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4351, float3(0.0), isnan(_4351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4351, float3(0.0), isnan(_4351)), level(0.0)).xyzw;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1638.w;
    float2 _4368 = float2(_1635, _1619);
    float3 _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4368, float2(0.0), isnan(_4368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4368, float2(0.0), isnan(_4368)), level(0.0)).xyz;
    float _1652 = _1650.x;
    float _1654 = _1650.y;
    float _1656 = _1650.z;
    float _1658 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1660 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1662 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1660);
    float _1664 = exp2(_1658);
    float _1666 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1662);
    float _1668 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1666);
    float _1670 = _1668 + _1577;
    out.gl_Position.x = _1601;
    out.gl_Position.y = _1603;
    out.gl_Position.z = _1668;
    out.gl_Position.w = _1577;
    float _1672 = _1670 * 0.5;
    float _1674 = -_1664;
    float _1676 = _1674 + 1.0;
    float _1678 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1680 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1672;
    out.m_64.w = _1577;
    out.m_47.x = _1678;
    float _1682 = _1680 * _1631;
    float _1684 = -_1680;
    float _1686 = _1684 + 1.0;
    float _1688 = _1646 * _1682;
    float _1690 = _1646 * _1686;
    float _1692 = _1656 * _1682;
    float _1694 = fma(_1652, _1688, _1640);
    float _1696 = fma(_1654, _1688, _1642);
    float _1698 = fma(_1646, _1692, _1644);
    out.m_66.x = _1694;
    out.m_66.y = _1696;
    out.m_66.z = _1698;
    out.m_66.w = _1690;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

