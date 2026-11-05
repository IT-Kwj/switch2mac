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
    float4 m_84 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_76 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_80 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_72 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_54 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _875 = false;
    bool _771 = false;
    bool _657 = false;
    bool _553 = false;
    bool _385 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_47.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4252 = as_type<float>(_119);
        out.gl_Position.z = _4252;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_49.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4322 = as_type<float>(_157);
        out.gl_Position.z = _4322;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_54.x;
    float _163 = in.m_54.y;
    float _165 = in.m_54.z;
    int _167 = as_type<int>(_159) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_159) & 2;
    bool _173 = _171 != 0;
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _181 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _183 = !_169;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    float _191 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    bool _193 = !_173;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _199 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    bool _203 = !_175;
    float _205 = _197;
    float _207 = _199;
    float _209 = _201;
    float _227;
    if (!_203)
    {
        float _211 = in.m_56.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_103);
        float _233 = 1.0 / _231;
        float _235 = _137 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    bool _243 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_237);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _237 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -_253;
    float _269 = _267 + 1.0;
    float _271 = in.m_58.x;
    float _273 = in.m_58.y;
    bool _275 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _277 = isnan(_237);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = 1.0 / _261;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _291 = 1.0 / _265;
    float _293 = _241 * _287;
    bool _295 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_237);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = _305 * _269;
    float _317 = -_305;
    float _319 = _317 + 1.0;
    float _321 = _257 * _291;
    float _323 = fma(_309, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = fma(_313, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = _285 * _319;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = -_285;
    float _335 = _333 + 1.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = _323 * _327;
    float _343 = _325 * _327;
    float _345 = fma(_331, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _347 = fma(_339, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _353 = fma(_345, _315, _349);
    float _355 = fma(_347, _315, _351);
    float _357 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].x, _353);
    float _359 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].y, _355);
    float _361 = _357 * _271;
    float _363 = _359 * _273;
    bool _365 = !_289;
    float _383;
    if (!_365)
    {
        float _367 = in.m_56.x;
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _371 = _367 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_103);
        float _389 = 1.0 / _387;
        float _391 = _137 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _393 + _395;
    bool _399 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _413 = _393 + _411;
    bool _415 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _417 = isnan(_393);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _435 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _437 = isnan(_393);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = 1.0 / _433;
    float _453 = _445 * _449;
    float _455 = -_445;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _459;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = 1.0 / _429;
    float _467 = _425 * _457;
    float _469 = -_425;
    float _471 = _469 + 1.0;
    float _473 = _413 * _451;
    float _475 = _397 * _465;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _481;
    float _485 = fma(_461, _475, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_479, _475, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = fma(_483, _475, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _491 = _485 * _467;
    float _493 = _487 * _467;
    float _495 = _489 * _467;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _509 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _511 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].y, _493);
    float _513 = fma(_499, _473, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _515 = fma(_503, _473, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _517 = fma(_507, _473, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _519 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].z, _495);
    float _521 = fma(_513, _453, _509);
    float _523 = fma(_515, _453, _511);
    float _525 = fma(_517, _453, _519);
    float _527 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _521);
    float _529 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _525);
    bool _533 = !_463;
    float _551;
    if (!_533)
    {
        float _535 = in.m_56.x;
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _539 = _535 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_103);
        float _557 = 1.0 / _555;
        float _559 = _137 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _565 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _567 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _569 = isnan(_561);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _583 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _585 = isnan(_561);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _601 = _561 + _599;
    float _603 = -_577;
    float _605 = _603 + 1.0;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _609 = 1.0 / _581;
    float _611 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _613 = _593 * _605;
    float _615 = -_593;
    float _617 = _615 + 1.0;
    float _619 = _563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _597 * _609;
    float _627 = fma(_625, _601, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _629 = _627 * _613;
    float _631 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[115].x, _629);
    float _633 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[116].x, _631);
    float _635 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _637 = !_607;
    float _655;
    if (!_637)
    {
        float _639 = in.m_56.x;
        float _641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _643 = _639 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[11].z, _137);
        float _647 = _645 * _641;
        float _649 = floor(_647);
        float _651 = -_649;
        float _653 = _647 + _651;
        _655 = _653;
        _657 = true;
    }
    else
    {
        float _659 = float(_103);
        float _661 = 1.0 / _659;
        float _663 = _137 * _661;
        _655 = _663;
    }
    _657 = false;
    float _665 = _655;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _669 = _665 + _667;
    bool _671 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _673 = isnan(_665);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _683;
    bool _687 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _689 = isnan(_665);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_681;
    float _701 = _699 + 1.0;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _703;
    float _707 = 1.0 / _685;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _711 = _697 * _701;
    float _713 = -_697;
    float _715 = _713 + 1.0;
    float _717 = _669 * _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _719;
    float _723 = fma(_705, _717, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _725;
    float _729 = fma(_721, _717, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _731 = _723 * _711;
    float _733 = fma(_727, _717, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _735 = _729 * _711;
    float _737 = _733 * _711;
    float _739 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[123].x, _731);
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[123].y, _737);
    float _743 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[123].z, _735);
    float _745 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[124].x, _739);
    float _747 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[124].y, _741);
    float _749 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[124].z, _743);
    bool _751 = !_709;
    float _769;
    if (!_751)
    {
        float _753 = in.m_56.x;
        float _755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _757 = _753 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _761 = _759 * _755;
        float _763 = floor(_761);
        float _765 = -_763;
        float _767 = _761 + _765;
        _769 = _767;
        _771 = true;
    }
    else
    {
        float _773 = float(_103);
        float _775 = 1.0 / _773;
        float _777 = _137 * _775;
        _769 = _777;
    }
    _771 = false;
    float _779 = _769;
    float _781 = _745 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _783 = _747 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _785 = _779 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _787 = isnan(_779);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _801 = _779 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _803 = isnan(_779);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _813;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _819 = _779 + _817;
    float _821 = -_795;
    float _823 = _821 + 1.0;
    bool _825 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _827 = 1.0 / _799;
    float _829 = _749 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _831 = _811 * _823;
    float _833 = -_811;
    float _835 = _833 + 1.0;
    float _837 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _815 * _827;
    float _845 = fma(_843, _819, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _847 = _845 * _831;
    float _849 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[131].x, _847);
    float _851 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[132].x, _849);
    float _853 = _851 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _855 = !_825;
    float _873;
    if (!_855)
    {
        float _857 = in.m_56.x;
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _861 = _857 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[14].x, _137);
        float _865 = _863 * _859;
        float _867 = floor(_865);
        float _869 = -_867;
        float _871 = _865 + _869;
        _873 = _871;
        _875 = true;
    }
    else
    {
        float _877 = float(_103);
        float _879 = 1.0 / _877;
        float _881 = _137 * _879;
        _873 = _881;
    }
    _875 = false;
    float _883 = _873;
    float _885 = in.m_56.x;
    float _887 = in.m_56.y;
    float _889 = in.m_56.z;
    float _891 = in.m_56.w;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _895 = _883 + _893;
    float _897 = in.m_44.x;
    float _899 = in.m_44.y;
    float _901 = in.m_44.z;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _913 = _911 != 0;
    float _915 = 1.0 / _905;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _919 = _363 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _925 = 1.0 / _909;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _933 = _885 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _935 = _887 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _937 = 1.0 / _923;
    float _939 = -_917;
    float _941 = fma(_933, 2.0, _939);
    float _943 = fma(_935, -2.0, _931);
    float _945 = _899 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _951 = _899 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _953 = 1.0 / _929;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _959 = _899 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _961 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[4].x, _945);
    float _963 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[5].x, _951);
    float _965 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[6].x, _959);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _967;
    float _971 = 1.0 / _949;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _975 = _973 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _977 = _969 * _915;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _979;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _983;
    float _987 = 1.0 / _957;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _993 = _885 * 2.0;
    float _995 = _985 * _925;
    float _997 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[4].z, _961);
    float _999 = _991 * _937;
    float _1001 = _887 * 2.0;
    float _1003 = floor(_993);
    float _1005 = _981 * _971;
    float _1007 = _997 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1009 = -_137;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[76].x, _941);
    bool _1013 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1015 = isnan(_883);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1027 = 1.0 / _975;
    float _1029 = _889 * 2.0;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1035 = _1007 + _1033;
    bool _1037 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1039 = isnan(_883);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _943);
    float _1051 = floor(_1029);
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1057 = _1003 >= 0.0;
    bool _1059 = isnan(_1003);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    bool _1067 = _1003 > 0.0;
    float _1069 = _1055 * _953;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1075;
    float _1079 = floor(_1001);
    float _1081 = _885 + _887;
    float _1083 = _1073 * _1027;
    float _1085 = _1077 * _987;
    float _1087 = _889 + _885;
    float _1089 = _1081 + (-1.0);
    float _1091 = _889 + _887;
    float _1093 = _1087 + (-1.0);
    float _1095 = _1091 + (-1.0);
    bool _1097 = _1051 > 0.0;
    float _1099 = fma(_1069, _895, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1101 = _1051 >= 0.0;
    bool _1103 = isnan(_1051);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1113 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1115 = _1079 > 0.0;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1119 = _883 + _1117;
    int _1121 = as_type<int>(_1051);
    if (_913)
    {
        _1121 = 0;
    }
    int _1123 = _1121;
    float _1125 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[5].z, _963);
    int _1127 = _1123;
    if (!_913)
    {
        _1127 = 1;
    }
    int _1129 = _1127;
    float _1131 = fma(_995, _1119, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1133 = _1079 >= 0.0;
    bool _1135 = isnan(_1079);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(0.0);
    bool _1141 = _1137 || _1139;
    float _1143 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[6].z, _965);
    float _1145 = _1065 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1147 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1149 = _1109 ? 0 : 1;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1153 = _883 + _1151;
    bool _1155 = _1129 != 1;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1159 = _883 + _1157;
    int _1161 = _1141 ? 0 : 1;
    float _1163 = fma(_999, _1153, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _1165 = ~_1149;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    float _1171 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1173 = log2(_1171);
    int _1175 = _1169;
    float _1177 = _1145;
    float _1179 = _1159;
    if (!_1097)
    {
        int _1181 = ~_1149;
        int _1183 = _1181 + 1;
        _1175 = _1183;
    }
    int _1185 = _1175;
    float _1187 = fma(_977, _1159, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1199 = _1197 != 0;
    float _1201 = _1125 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1203 = ~_1161;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1211 = _1207;
    if (!_1115)
    {
        int _1213 = ~_1161;
        int _1215 = _1213 + 1;
        _1211 = _1215;
    }
    int _1217 = _1211;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1221 = _1201 + _1219;
    float _1223 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1225 = int(_1223);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1209 + _1227;
    bool _1231 = !_1195;
    int _1233 = _1231 ? 0 : 1;
    bool _1235 = !_1191;
    int _1237 = _1235 ? 0 : 1;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1241 = !_1199;
    int _1243 = _1241 ? 0 : 1;
    int _1245 = ~as_type<int>(_1145);
    int _1247 = _1245 + 1;
    int _1249 = _1247 + 1;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1261 = _1259 != 0;
    int _1263 = _1249;
    if (!_1067)
    {
        int _1265 = ~as_type<int>(_1145);
        int _1267 = _1265 + 1;
        _1263 = _1267;
    }
    int _1269 = _1263;
    if (!_1155)
    {
        _1177 = _889;
    }
    float _1271 = _1177;
    float _1273 = _1271;
    if (_1155)
    {
        _1273 = _887;
    }
    float _1275 = _1273;
    bool _1277 = !_1257;
    int _1279 = _1277 ? 0 : 1;
    float _1281 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1239);
    float _1283 = float(_103);
    float _1285 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1287 = int(_1285);
    bool _1289 = !_1253;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1295 = _1275;
    if (!_1155)
    {
        _1179 = _887;
    }
    float _1297 = _1179;
    float _1299 = _1297;
    if (_1155)
    {
        _1299 = _885;
    }
    float _1301 = _1299;
    int _1303 = abs(_1279);
    float _1305 = 1.0 / _1283;
    int _1307 = abs(_1291);
    float _1309 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1293);
    float _1311 = float(_1269);
    float _1313 = float(_1303);
    float _1315 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1309);
    float _1317 = float(_1225);
    float _1319 = _1301;
    if (!_1155)
    {
        _1319 = _887;
    }
    float _1321 = _1319;
    float _1323 = _1313 * _1311;
    float _1325 = float(_1307);
    float _1327 = 1.0 / _1317;
    float _1329 = float(_1185);
    float _1331 = _1173 * _137;
    float _1333 = _1321;
    if (_1155)
    {
        _1333 = _885;
    }
    float _1335 = _1333;
    float _1337 = _1323 * (-2.0);
    if (!_1155)
    {
        _1295 = _889;
    }
    float _1339 = _1295;
    float _1341 = _1325 * _1329;
    float _1343 = _1339;
    if (_1155)
    {
        _1343 = _887;
    }
    float _1345 = _1343;
    float _1347 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1349 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1351 = isnan(_883);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = exp2(_1331);
    float _1363 = float(_1287);
    float _1365 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1367 = -_1025;
    float _1369 = fma(_1347, 2.0, _1367);
    bool _1371 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1373 = isnan(_883);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = -_1359;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1365, -2.0, _1031);
    float _1389 = 1.0 / _1363;
    float _1391 = _1381 * _1385;
    float _1393 = -_1381;
    float _1395 = _1393 + 1.0;
    float _1397 = in.m_60.x;
    float _1399 = in.m_60.y;
    float _1401 = in.m_60.z;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1405 = _1327 * _137;
    float _1407 = _1221 * _1221;
    float _1409 = _1023 * _1395;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1413 = 1.0 + _1411;
    float _1415 = _1305 * _137;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1419 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1403);
    float _1421 = 1.0 / _1413;
    bool _1423 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1425 = isnan(1.0);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1431 = _1427 || _1429;
    float _1433 = fma(_1035, _1035, _1407);
    float _1435 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1417);
    float _1437 = -_1361;
    float _1439 = _1437 + 1.0;
    float _1441 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1419);
    bool _1443 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1445 = isnan(0.0);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1229, _1229, _1433);
    float _1455 = _1389 * _137;
    float _1457 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1435);
    float _1459 = _1451 ? _1439 : 0.0;
    float _1461 = sqrt(_1453);
    float _1463 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1281);
    float _1465 = -_137;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1369);
    float _1469 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1387);
    float _1471 = -_1023;
    float _1473 = _1471 + 1.0;
    if (_1431)
    {
        float _1475 = _1459 * _1421;
        _139 = _1475;
    }
    float _1477 = _139;
    float _1479 = _1341 * (-2.0);
    float _1481 = -_1047;
    float _1483 = _1481 + 1.0;
    float _1485 = _1047 * _1473;
    bool _1487 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1489 = isnan(_883);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = fma(_1147, _1479, _1147);
    float _1501 = fma(_1479, _1397, _1397);
    float _1503 = _885 + (-0.5);
    float _1505 = _361 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1507 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1509 = isnan(_883);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = _1497 * _1483;
    float _1521 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1501);
    float _1523 = -_1497;
    float _1525 = _1523 + 1.0;
    float _1527 = _1505 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1529 = _1461 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1531 = rsqrt(_1453);
    bool _1533 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1535 = isnan(_883);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = _1517 * _1525;
    float _1547 = -_1517;
    float _1549 = _1547 + 1.0;
    float _1551 = precise::min(_1527, _1529);
    float _1553 = fma(_1499, _1477, _1521);
    bool _1555 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1557 = isnan(_883);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = -_1543;
    float _1569 = _1567 + 1.0;
    bool _1571 = !_1261;
    int _1573 = _1571 ? 0 : 1;
    float _1575 = _1543 * _1549;
    float _1577 = _887 + (-0.5);
    float _1579 = _1565 * _1569;
    float _1581 = fma(_1337, _1399, _1399);
    int _1583 = abs(_1573);
    float _1585 = _1553 * 0.15915493667125701904296875;
    float _1587 = float(_1217);
    float _1589 = fma(_1113, _1337, _1113);
    float _1591 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1581);
    float _1593 = float(_1583);
    float _1595 = _1531 * _1551;
    float _1597 = _1131 * _1579;
    float _1599 = fma(_1589, _1477, _1591);
    float _1601 = _1585 * 6.283185482025146484375;
    float _1603 = sin(_1601);
    float _1605 = _1221 * _1595;
    float _1607 = _1593 * _1587;
    float _1609 = -_1565;
    float _1611 = _1609 + 1.0;
    float _1613 = _1035 * _1595;
    float _1615 = -_1605;
    float _1617 = _1221 + _1615;
    float _1619 = _1607 * (-2.0);
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1597);
    float _1623 = _1229 * _1595;
    float _1625 = _1617 * _1617;
    float _1627 = fma(_1619, _1401, _1401);
    float _1629 = _889 + (-0.5);
    float _1631 = -_1613;
    float _1633 = _1035 + _1631;
    float _1635 = fma(_1163, _1575, _1621);
    float _1637 = fma(_1111, _1619, _1111);
    float _1639 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1627);
    float _1641 = fma(_1633, _1633, _1625);
    float _1643 = -_1623;
    float _1645 = _1229 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1649 = _883 + _1647;
    float _1651 = fma(_1187, _1545, _1635);
    float _1653 = fma(_1637, _1477, _1639);
    float _1655 = fma(_1645, _1645, _1641);
    float _1657 = fma(_1005, _1649, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1659 = _1599 * 0.15915493667125701904296875;
    float _1661 = fma(_1099, _1519, _1651);
    float _1663 = _1653 * 0.15915493667125701904296875;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1667 = _883 + _1665;
    float _1669 = sqrt(_1655);
    float _1671 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1673 = fma(_1657, _1485, _1661);
    float _1675 = fma(_1083, _1667, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1679 = _883 + _1677;
    float _1681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1683 = fma(_1675, _1409, _1673);
    float _1685 = _1585 * 6.283185482025146484375;
    float _1687 = cos(_1685);
    float _1689 = fma(_1085, _1679, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1691 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1671);
    float _1693 = fma(_1689, _1391, _1683);
    float _1695 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1691);
    float _1697 = _1659 * 6.283185482025146484375;
    float _1699 = cos(_1697);
    float _1701 = _1531 * _1669;
    float _1703 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1693);
    float _1705 = _919 * _1701;
    float _1707 = _1505 * _1701;
    float _1709 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1711 = _1709 * 0.5;
    float _1713 = _1663 * 6.283185482025146484375;
    float _1715 = cos(_1713);
    float _1717 = _1705 * _1681;
    float _1719 = _1659 * 6.283185482025146484375;
    float _1721 = sin(_1719);
    float _1723 = _1603 * _1699;
    float _1725 = _1687 * _1699;
    float _1727 = _1663 * 6.283185482025146484375;
    float _1729 = sin(_1727);
    float _1731 = _1699 * _1715;
    float _1733 = _1687 * _1715;
    float _1735 = _1603 * _1715;
    float _1737 = _1735 * _1717;
    float _1739 = _1687 * _1721;
    float _1741 = _1603 * _1721;
    float _1743 = _1721 * _1715;
    float _1745 = _1733 * _1717;
    float _1747 = sqrt(_1695);
    float _1749 = -_1739;
    float _1751 = fma(_1729, _1723, _1749);
    float _1753 = -_1723;
    float _1755 = fma(_1729, _1739, _1753);
    float _1757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1759 = fma(_1729, _1725, _1741);
    float _1761 = -_1717;
    float _1763 = _1729 * _1761;
    float _1765 = fma(_1729, _1741, _1725);
    float _1767 = _1707 * _1757;
    float _1769 = fma(_1759, _1767, _1745);
    float _1771 = fma(_1731, _1767, _1763);
    float _1773 = fma(_1751, _1767, _1737);
    float _1775 = _1747 * 50.0;
    float _1777 = fma(_1755, _1711, _1769);
    float _1779 = fma(_1743, _1711, _1771);
    float _1781 = fma(_1765, _1711, _1773);
    float _1783 = _1703 * _1775;
    float _1785 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1789 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1791 = _1783 * _1783;
    float _1793 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1785);
    float _1795 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1787);
    float _1797 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1789);
    float _1799 = rsqrt(_1791);
    float _1801 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1793);
    float _1803 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1795);
    float _1805 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1797);
    float _1807 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1809 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1811 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1813 = _1807 * _1807;
    float _1815 = _1209 + _1809;
    float _1817 = _1809 * _1809;
    float _1819 = _1007 + _1807;
    float _1821 = fma(_1811, _1811, _1813);
    float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1825 = _1815 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1829 = _1819 + _1827;
    float _1831 = _1817 + _1821;
    float _1833 = _1825 * _1825;
    float _1835 = _1783 * _1799;
    float _1837 = fma(_1829, _1829, _1833);
    float _1839 = rsqrt(_1831);
    float _1841 = sqrt(_1837);
    float _1843 = sqrt(_1791);
    float _1845 = _1811 * _1839;
    float _1847 = _1835 * _1845;
    bool _1849 = _1841 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1853 = _1851 != 0;
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1857 = _1855 != 0;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1861 = _1859 != 0;
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1865 = _1863 != 0;
    float _1867 = _1847 * _1843;
    bool _1869 = !_1857;
    int _1871 = _1869 ? 0 : 1;
    bool _1873 = !_1861;
    int _1875 = _1873 ? 0 : 1;
    float _1877 = fma(_1835, _1867, _1811);
    float _1879 = _1811;
    float _1881 = _1877;
    float _1883 = _1791;
    float _1885 = _1839;
    float _1887 = _1867;
    float _1889 = _1819;
    float _1891 = _1817;
    float _1893 = _1605;
    if (!_1849)
    {
        _1879 = _1813;
    }
    float _1895 = _1879;
    bool _1897 = !_1853;
    int _1899 = _1897 ? 0 : 1;
    float _1901 = _1201 + _1877;
    float _1903 = _1895;
    if (!_1849)
    {
        _1881 = _1819;
    }
    float _1905 = _1881;
    bool _1907 = !_1865;
    int _1909 = _1907 ? 0 : 1;
    float _1911 = _1905;
    if (!_1849)
    {
        _1883 = _1809;
    }
    float _1913 = _1883;
    float _1915 = _1913;
    if (!_1849)
    {
        _1885 = _1807;
    }
    float _1917 = _1885;
    float _1919 = _1917;
    if (!_1849)
    {
        _1887 = _1815;
    }
    float _1921 = _1887;
    float _1923 = _1921;
    if (!_1849)
    {
        _1889 = _1901;
    }
    float _1925 = _1889;
    bool _1927 = !_1849;
    float _1929 = _1925;
    if (!_1927)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1935 = _1841 + _1933;
        float _1937 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1939 = rsqrt(_1837);
        float _1941 = _1935 * _1931;
        float _1943 = _1941 * 0.15915493667125701904296875;
        float _1945 = _1943 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        float _1949 = _1943 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = fma(_1947, _1937, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1955 = _1939 * _1953;
        float _1957 = _1951 + (-1.0);
        float _1959 = fma(_1829, _1955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1961 = fma(_1825, _1955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1963 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1965 = -_1007;
        float _1967 = _1965 + _1959;
        float _1969 = -_1209;
        float _1971 = _1969 + _1961;
        float _1973 = fma(_1901, _1951, _1963);
        float _1975 = _1967 * _1967;
        float _1977 = _1971 * _1971;
        _1929 = _1973;
        _1911 = _1959;
        _1903 = _1975;
        _1891 = _1977;
        _1923 = _1961;
        _1919 = _1967;
        _1915 = _1971;
    }
    float _1979 = _1929;
    float _1981 = _1911;
    float _1983 = _1903;
    float _1985 = _1891;
    float _1987 = _1923;
    float _1989 = _1919;
    float _1991 = _1915;
    float _1993 = -_1201;
    float _1995 = _1993 + _1979;
    float _1997 = -_1605;
    float _1999 = _1201 + _1997;
    float _2001 = -_1613;
    float _2003 = _1007 + _2001;
    float _2005 = -_1613;
    float _2007 = _2005 + _1981;
    float _2009 = fma(_1995, _1995, _1983);
    float _2011 = _1999 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2013 = -_1623;
    float _2015 = _1209 + _2013;
    float _2017 = -_1605;
    float _2019 = _2017 + _1979;
    float _2021 = _2009 + _1985;
    float _2023 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2011);
    float _2025 = _1999 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2027 = -_1623;
    float _2029 = _2027 + _1987;
    float _2031 = sqrt(_2021);
    float _2033 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2023);
    float _2035 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2025);
    bool _2037 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2039 = isnan(0.5);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2045 = _2041 || _2043;
    float _2047 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2049 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2035);
    bool _2051 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2053 = isnan(0.5);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2059 = _2055 || _2057;
    float _2061 = 1.0 / _2047;
    float _2063 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2065 = _2063 + _2047;
    bool _2067 = _2031 > 0.0;
    float _2069 = _2065 * _2061;
    float _2071 = _2069 * 0.5;
    float _2073 = _2031;
    float _2075 = _2033;
    float _2077 = _2019;
    float _2079 = _1989;
    float _2081 = _1981;
    if (!_2067)
    {
        _2073 = _2007;
    }
    float _2083 = _2073;
    float _2085 = _2083;
    if (!_2067)
    {
        _2075 = _2029;
    }
    float _2087 = _2075;
    bool _2089 = !_2067;
    float _2091 = _2087;
    if (!_2089)
    {
        float _2093 = _199 * _199;
        float _2095 = fma(_197, _197, _2093);
        float _2097 = fma(_201, _201, _2095);
        float _2099 = rsqrt(_2021);
        float _2101 = sqrt(_2097);
        float _2103 = _1995 * _2099;
        float _2105 = _2099 * _1989;
        float _2107 = _2099 * _1991;
        bool _2109 = _2101 > 0.0;
        float _2111 = _2101;
        float _2113 = _2099;
        _1893 = _2103;
        if (!_2109)
        {
            _2111 = _2007;
        }
        float _2115 = _2111;
        _2085 = _2115;
        if (!_2109)
        {
            _2113 = _2029;
        }
        float _2117 = _2113;
        bool _2119 = !_2109;
        _2091 = _2117;
        if (!_2119)
        {
            float _2121 = rsqrt(_2097);
            float _2123 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2125 = _199 * _2121;
            float _2127 = _197 * _2121;
            float _2129 = _2103 * _2125;
            float _2131 = _201 * _2121;
            float _2133 = fma(_2105, _2127, _2129);
            float _2135 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2137 = fma(_2107, _2131, _2133);
            float _2139 = _2137 * _2135;
            float _2141 = fma(_197, _2139, _2007);
            float _2143 = fma(_199, _2139, _2019);
            float _2145 = fma(_201, _2139, _2029);
            _2085 = _2141;
            _2077 = _2143;
            _2091 = _2145;
            _2079 = _2123;
            _1893 = _2139;
        }
    }
    float _2147 = _2085;
    float _2149 = _2077;
    float _2151 = _2091;
    float _2153 = _2079;
    float _2155 = _1893;
    float _2157 = _2153;
    float _2159 = _2155;
    if (_2059)
    {
        _2081 = 1.0;
    }
    float _2161 = _2081;
    float _2163 = _2161;
    if (_2045)
    {
        _205 = _2147;
    }
    float _2165 = _205;
    float _2167 = _2165;
    if (_2045)
    {
        _207 = _2149;
    }
    float _2169 = _207;
    float _2171 = _2169;
    if (_2045)
    {
        _209 = _2151;
    }
    float _2173 = _209;
    float _2175 = _2173;
    if (!_2045)
    {
        float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2179 = _1999 + _2177;
        float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2183 = _2003 + _2181;
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2187 = -_2003;
        float _2189 = _2187 + _2147;
        float _2191 = _2179 * _2179;
        float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2195 = _2015 + _2193;
        float _2197 = -_1999;
        float _2199 = _2197 + _2149;
        float _2201 = -_2015;
        float _2203 = _2201 + _2151;
        float _2205 = fma(_2183, _2183, _2191);
        float _2207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2209 = fma(_2195, _2195, _2205);
        float _2211 = sqrt(_2209);
        float _2213 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2215 = precise::min(_2211, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2217 = _2215 * _2207;
        float _2219 = _2213 * _2217;
        float _2221 = fma(_2189, _2219, _2003);
        float _2223 = fma(_2199, _2219, _1999);
        float _2225 = fma(_2203, _2219, _2015);
        _2157 = _2191;
        _2171 = _2223;
        _2167 = _2221;
        _2175 = _2225;
        _2159 = _2207;
    }
    float _2227 = _2157;
    float _2229 = _2171;
    float _2231 = _2167;
    float _2233 = _2175;
    float _2235 = _2159;
    float _2237 = _2235;
    float _2239 = _2227;
    if (!_2059)
    {
        float _2241 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2243 = _2241 * 0.15915493667125701904296875;
        float _2245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2247 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2249 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2247);
        float _2251 = _2243 * 6.283185482025146484375;
        float _2253 = cos(_2251);
        float _2255 = _2245 * 0.15915493667125701904296875;
        float _2257 = _2243 * 6.283185482025146484375;
        float _2259 = sin(_2257);
        float _2261 = 1.0 / _2253;
        float _2263 = _2255 * 6.283185482025146484375;
        float _2265 = cos(_2263);
        float _2267 = _2259 * _2261;
        float _2269 = _2255 * 6.283185482025146484375;
        float _2271 = sin(_2269);
        float _2273 = _2265 * _2267;
        float _2275 = 1.0 / _2249;
        float _2277 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2279 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2277;
        float _2281 = 1.0 / _2273;
        float _2283 = 1.0 / _2279;
        float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2287 = _2275 * _2285;
        float _2289 = _2271 * _2281;
        float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2293 = fma(_2289, _2287, _2291);
        float _2295 = _2293 * _2283;
        float _2297 = precise::clamp(_2295, 0.0, 1.0);
        _2237 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _2239 = _2279;
        _2163 = _2297;
    }
    float _2299 = _2237;
    float _2301 = _2239;
    float _2303 = _2163;
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2307 = _2229 + _2305;
    float _2309 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2311 = _2231 + _2309;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2315 = _2233 + _2313;
    float _2317 = _2307 * _2307;
    float _2319 = fma(_2311, _2311, _2317);
    float _2321 = fma(_2315, _2315, _2319);
    float _2323 = rsqrt(_2321);
    float _2325 = sqrt(_2321);
    float _2327 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2329 = _2311 * _2327;
    float _2331 = _2315 * _2327;
    float _2333 = _2329 * _2329;
    float _2335 = _2331 * _2331;
    float _2337 = _2333 + _2335;
    float _2339 = sqrt(_2337);
    bool _2341 = _2339 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2345 = _2339 + _2343;
    float _2347 = _2323;
    float _2349 = _2337;
    float _2351 = _2345;
    float _2353 = _2299;
    float _2355 = _2327;
    if (_2341)
    {
        float _2357 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2347 = _2357;
    }
    float _2359 = _2347;
    if (_2341)
    {
        float _2361 = rsqrt(_2337);
        _2349 = _2361;
    }
    float _2363 = _2349;
    if (_2341)
    {
        float _2365 = _2345 * _2359;
        _2351 = _2365;
    }
    float _2367 = _2351;
    if (_2341)
    {
        float _2369 = _2367 * 0.15915493667125701904296875;
        _2353 = _2369;
    }
    float _2371 = _2353;
    float _2373 = _2315;
    float _2375 = _2371;
    if (_2341)
    {
        float _2377 = _2371 * 6.283185482025146484375;
        float _2379 = sin(_2377);
        _2373 = _2379;
    }
    float _2381 = _2373;
    float _2383 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2385 = precise::max(0.0, _2383);
    float _2387 = _2301;
    float _2389 = _2385;
    float _2391 = _2383;
    if (_2341)
    {
        float _2393 = _2371 * 6.283185482025146484375;
        float _2395 = cos(_2393);
        _2387 = _2395;
    }
    float _2397 = _2387;
    float _2399 = -_2327;
    float _2401 = -_2385;
    float _2403 = fma(_2307, _2399, _2401);
    float _2405 = _2403;
    if (_2341)
    {
        float _2407 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2389 = _2407;
    }
    float _2409 = _2389;
    float _2411 = _2409;
    float _2413 = _2381;
    if (_2341)
    {
        float _2415 = fma(_2381, _2409, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2411 = _2415;
    }
    float _2417 = _2411;
    float _2419 = _2417;
    if (!_2341)
    {
        _2413 = _2329;
    }
    float _2421 = _2413;
    float _2423 = _2421;
    float _2425 = _2397;
    if (_2341)
    {
        float _2427 = _2397 + (-1.0);
        _2391 = _2427;
    }
    float _2429 = _2391;
    float _2431 = _2429;
    if (_2341)
    {
        float _2433 = _2363 * _2417;
        _2355 = _2433;
    }
    float _2435 = _2355;
    if (!_2341)
    {
        _2419 = _2333;
    }
    float _2437 = _2419;
    float _2439 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2441 = _2437;
    if (_2341)
    {
        float _2443 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2375 = _2443;
    }
    float _2445 = _2375;
    if (_2341)
    {
        float _2447 = _2329 * _2435;
        _2423 = _2447;
    }
    float _2449 = _2423;
    if (!_2341)
    {
        _2431 = _2331;
    }
    float _2451 = _2431;
    float _2453 = _2451;
    if (_2341)
    {
        float _2455 = _2331 * _2435;
        _2453 = _2455;
    }
    float _2457 = _2453;
    if (_2341)
    {
        float _2459 = fma(_2403, _2397, _2445);
        _2405 = _2459;
    }
    float _2461 = _2405;
    if (_2341)
    {
        float _2463 = _2449 * _2449;
        _2441 = _2463;
    }
    float _2465 = _2441;
    if (!_2341)
    {
        _2425 = _2335;
    }
    float _2467 = _2425;
    float _2469 = _2467;
    if (_2341)
    {
        float _2471 = _2457 * _2457;
        _2469 = _2471;
    }
    float _2473 = _2469;
    float _2475 = fma(_2461, _2461, _2465);
    float _2477 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2479 = _2475 + _2473;
    float _2481 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2439);
    float _2483 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2487 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2485);
    float _2489 = precise::clamp(_2487, 0.0, 1.0);
    float _2491 = rsqrt(_2479);
    float _2493 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2481);
    float _2495 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2483);
    float _2497 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2499 = -_2489;
    float _2501 = _2499 + 1.0;
    float _2503 = _2493 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2505 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2495);
    float _2507 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2497);
    float _2509 = abs(_2501);
    float _2511 = log2(_2509);
    float _2513 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2515 = _2505 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2517 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2519 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2507);
    float _2521 = -_2513;
    float _2523 = fma(_2521, _2477, 1.0);
    float _2525 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2527 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2517);
    float _2529 = _2491 * _2449;
    float _2531 = _2491 * _2461;
    float _2533 = _2519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2535 = _2491 * _2457;
    float _2537 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2539 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2527);
    float _2541 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2525);
    float _2543 = log2(_2523);
    float _2545 = -_2537;
    float _2547 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2545);
    float _2549 = _2539 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2551 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2541);
    float _2553 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2555 = -_2535;
    float _2557 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2547);
    float _2559 = _2531 + 1.0;
    float _2561 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2551);
    float _2563 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2565 = fma(_2557, -0.5, 0.5);
    float _2567 = exp2(_2553);
    float _2569 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2571 = fma(_2557, 0.5, 0.5);
    float _2573 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2563);
    float _2575 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2569);
    float _2577 = fma(_2571, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2579 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2573);
    float _2581 = 1.0 / _2561;
    float _2583 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2575);
    float _2585 = fma(_2571, _2577, -0.212114393711090087890625);
    float _2587 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2579);
    float _2589 = _2543 * 0.693147182464599609375;
    float _2591 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2583);
    float _2593 = fma(_2571, _2585, 1.570728778839111328125);
    float _2595 = sqrt(_2565);
    float _2597 = -_2531;
    float _2599 = fma(_2567, _2559, _2597);
    float _2601 = _2589 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2603 = fma(_2599, 0.5, 0.5);
    float _2605 = _2587 * _2581;
    float _2607 = _2591 * _2581;
    float _2609 = fma(_2605, 0.5, 0.5);
    float _2611 = fma(_2607, -0.5, 0.5);
    float _2613 = _2595 * 0.636619746685028076171875;
    float _2615 = -_2593;
    float _2617 = fma(_2613, _2615, 1.0);
    float3 _8163 = float3(_2609, _2611, _2601);
    float _2619 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8163, float3(0.0), isnan(_8163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8163, float3(0.0), isnan(_8163)), level(0.0)).x;
    float3 _8174 = float3(_2609, _2611, _2601);
    float4 _2622 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8174, float3(0.0), isnan(_8174)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8174, float3(0.0), isnan(_8174)), level(0.0)).xyzw;
    float _2624 = _2622.x;
    float _2626 = _2622.y;
    float _2628 = _2622.z;
    float _2630 = _2622.w;
    float2 _8191 = float2(_2617, _2603);
    float3 _2634 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8191, float2(0.0), isnan(_8191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8191, float2(0.0), isnan(_8191)), level(0.0)).xyz;
    float _2636 = _2634.x;
    float _2638 = _2634.y;
    float _2640 = _2634.z;
    float _2642 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2644 = int(_2642);
    int _2646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2648 = _2646 != 0;
    out.m_62.x = _619;
    out.m_62.y = _621;
    out.m_62.z = _623;
    out.m_62.w = _635;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2652 = _2650 != 0;
    float _2654 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2656 = abs(_1237);
    out.m_64.x = _837;
    out.m_64.y = _839;
    out.m_64.z = _841;
    out.m_64.w = _853;
    int _2658 = abs(_1871);
    float _2660 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2662 = int(_2660);
    int _2664 = abs(_1243);
    out.m_66.w = _1551;
    int _2666 = abs(_1875);
    float _2668 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2670 = _891 > 0.5;
    out.m_68.x = _2003;
    out.m_68.y = _1999;
    out.m_68.z = _2015;
    float _2672 = -_1315;
    float _2674 = _2672 + 1.0;
    float _2676 = float(uint(_2644));
    float _2678 = trunc(_1405);
    int _2680 = int(_2678);
    float _2682 = trunc(_1455);
    int _2684 = int(_2682);
    float _2686 = float(uint(_2662));
    float _2688 = _2601;
    if (_2648)
    {
        float _2690 = in.m_56.x;
        _2688 = _2690;
    }
    float _2692 = _2688;
    int _2694 = ~_2662;
    int _2696 = _2694 + 1;
    float _2698 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2668);
    int _2700 = ~_2644;
    int _2702 = _2700 + 1;
    float _2704 = _2692;
    if (!_2648)
    {
        float _2706 = in.m_56.y;
        _2704 = _2706;
    }
    float _2708 = _2704;
    int _2710 = ~_2662;
    int _2712 = _2710 + 1;
    float _2714 = 1.0 / _2676;
    float _2716 = float(uint(_2680));
    out.m_70.x = _2231;
    out.m_70.y = _2229;
    out.m_70.z = _2233;
    bool _2718 = _2644 == 0;
    float _2720 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2698);
    float _2722 = -_1463;
    float _2724 = _2722 + 1.0;
    out.m_72.x = _1707;
    float _2726 = 1.0 / _2686;
    float _2728 = float(uint(_2684));
    int _2730 = as_type<int>(_2714) + (-2);
    float _2732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2734 = _2714;
    if (_2648)
    {
        _2734 = 1.0;
    }
    float _2736 = _2734;
    float _2738 = _2736;
    if (!_2648)
    {
        _2738 = 7.345489978790283203125;
    }
    float _2740 = _2738;
    float _2742 = as_type<float>(_2730) * _2716;
    int _2744 = as_type<int>(_2726) + (-2);
    float _2746 = trunc(_2742);
    float _2748 = precise::max(_2746, 0.0);
    uint _2751 = uint(_2748);
    int _2753 = ~_2644;
    int _2755 = _2753 + 1;
    float _2757 = as_type<float>(_2744) * _2728;
    float _2759 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2761 = _2740 * _885;
    float _2763 = trunc(_2757);
    float _2765 = precise::max(_2763, 0.0);
    uint _2767 = uint(_2765);
    int _2769 = _2755 * int(_2751);
    int _2771 = _2769 + _2680;
    float _2773 = floor(_2761);
    float _2775 = float(uint(_2771));
    int _2777 = _2696 * int(_2767);
    int _2779 = _2777 + _2684;
    float _2781 = as_type<float>(_2730) * _2775;
    float _2783 = exp2(_2654);
    float _2785 = float(uint(_2779));
    float _2787 = as_type<float>(_2779);
    if (_2648)
    {
        _2787 = 1.0;
    }
    float _2789 = _2787;
    float _2791 = -_2773;
    float _2793 = _2761 + _2791;
    float _2795 = _2789;
    if (!_2648)
    {
        _2795 = 1.2345600128173828125;
    }
    float _2797 = _2795;
    float _2799 = as_type<float>(_2744) * _2785;
    float _2801 = trunc(_2781);
    float _2803 = precise::max(_2801, 0.0);
    uint _2805 = uint(_2803);
    float _2807 = _2708 * _2797;
    float _2809 = float(_2644);
    float _2811 = float(_2680);
    float _2813 = -_2783;
    float _2815 = _2813 + 1.0;
    float _2817 = trunc(_2799);
    float _2819 = precise::max(_2817, 0.0);
    uint _2821 = uint(_2819);
    float _2823 = float(_2684);
    bool _2825 = _2811 >= _2809;
    bool _2827 = isnan(_2811);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(_2809);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    float _2837 = floor(_2807);
    int _2839 = int(_2751) + int(_2805);
    float _2841 = float(_2662);
    int _2843 = _2702 * _2839;
    int _2845 = _2843 + _2680;
    int _2847 = int(_2767) + int(_2821);
    float _2849 = trunc(_2835);
    int _2851 = int(_2849);
    bool _2853 = _2823 >= _2841;
    bool _2855 = isnan(_2823);
    bool _2857 = _2853 || _2855;
    bool _2859 = isnan(_2841);
    bool _2861 = _2857 || _2859;
    float _2863 = float(_2861);
    bool _2865 = uint(_2845) >= uint(_2644);
    int _2867 = _2712 * _2847;
    int _2869 = _2867 + _2684;
    float _2871 = -_2837;
    float _2873 = _2807 + _2871;
    float _2875 = _2793 * _2809;
    bool _2877 = !_2865;
    int _2879 = _2877 ? 0 : (-1);
    float _2881 = trunc(_2863);
    int _2883 = int(_2881);
    bool _2885 = uint(_2869) >= uint(_2662);
    float _2887 = _2873 * _2841;
    float _2889 = _2809 * _1415;
    int _2891 = ~_2839;
    int _2893 = _2891 + _2879;
    int _2895 = _2893 + 1;
    float _2897 = _2841 * _1415;
    bool _2899 = !_2885;
    int _2901 = _2899 ? 0 : (-1);
    float _2903 = trunc(_2875);
    int _2905 = int(_2903);
    int _2907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2909 = _2907 != 0;
    int _2911 = ~_2847;
    int _2913 = _2911 + _2901;
    int _2915 = _2913 + 1;
    bool _2917 = !_2909;
    int _2919 = _2917 ? 0 : 1;
    int _2921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2923 = _2921 != 0;
    float _2925 = trunc(_2887);
    int _2927 = int(_2925);
    int _2929 = abs(_2919);
    int _2931 = _2644 * _2895;
    int _2933 = _2931 + _2680;
    bool _2935 = !_2923;
    int _2937 = _2935 ? 0 : 1;
    int _2939 = _2662 * _2915;
    int _2941 = _2939 + _2684;
    int _2943 = ~_2851;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    bool _2949 = !_2718;
    int _2951 = _2949 ? _2933 : (-1);
    float _2953 = trunc(_2889);
    int _2955 = int(_2953);
    bool _2957 = _2662 == 0;
    int _2959 = abs(_2937);
    int _2961 = _2951 * _2947;
    int _2963 = ~_2883;
    int _2965 = _2963 + 1;
    int _2967 = _2965 + 1;
    int _2969 = _2905 * _2959;
    int _2971 = _2969 + _2680;
    bool _2973 = !_2957;
    int _2975 = _2973 ? _2941 : (-1);
    int _2977 = _2927 * _2929;
    int _2979 = _2977 + _2684;
    int _2981 = abs(_1233);
    float _2983 = trunc(_2897);
    int _2985 = int(_2983);
    int _2987 = _2644 + (-1);
    int _2989 = _2975 * _2967;
    int _2991 = _2662 + (-1);
    int _2993 = _2851 * _2987;
    int _2995 = _2993 + _2961;
    int _2997 = abs(_1899);
    int _2999 = _2883 * _2991;
    int _3001 = _2999 + _2989;
    int _3003 = _2995 * _2981;
    bool _3005 = !_2652;
    int _3007 = _3005 ? 0 : 1;
    int _3009 = _3001 * _2658;
    int _3011 = _2955 * _2656;
    int _3013 = _3011 + _3003;
    int _3015 = abs(_3007);
    int _3017 = _2985 * _2997;
    int _3019 = _3017 + _3009;
    int _3021 = abs(_1909);
    int _3023 = _2971 * _2664;
    int _3025 = _3023 + _3013;
    int _3027 = ~_2662;
    int _3029 = _3027 + 1;
    int _3031 = _2979 * _2666;
    int _3033 = _3031 + _3019;
    int _3035 = _2905 * _3015;
    int _3037 = _3035 + _3025;
    int _3039 = ~_2644;
    int _3041 = _3039 + 1;
    int _3043 = _2927 * _3021;
    int _3045 = _3043 + _3033;
    int _3047 = ~_2644;
    int _3049 = _3047 + 1;
    float _3051 = float(uint(_3037));
    float _3053 = float(uint(_3045));
    float _3055 = as_type<float>(_2730) * _3051;
    float _3057 = float(uint(_2971));
    float _3059 = as_type<float>(_2744) * _3053;
    float _3061 = float(uint(_2979));
    float _3063 = trunc(_3055);
    float _3065 = precise::max(_3063, 0.0);
    uint _3067 = uint(_3065);
    float _3069 = as_type<float>(_2730) * _3057;
    float _3071 = as_type<float>(_2744) * _3061;
    float _3073 = trunc(_3059);
    float _3075 = precise::max(_3073, 0.0);
    uint _3077 = uint(_3075);
    float _3079 = trunc(_3069);
    float _3081 = precise::max(_3079, 0.0);
    uint _3083 = uint(_3081);
    int _3085 = _3041 * int(_3067);
    int _3087 = _3085 + _3037;
    float _3089 = float(uint(_3087));
    int _3091 = _3029 * int(_3077);
    int _3093 = _3091 + _3045;
    float _3095 = trunc(_3071);
    float _3097 = precise::max(_3095, 0.0);
    uint _3099 = uint(_3097);
    float _3101 = as_type<float>(_2730) * _3089;
    float _3103 = float(uint(_3093));
    int _3105 = _3049 * int(_3083);
    int _3107 = _3105 + _2971;
    float _3109 = trunc(_3101);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = as_type<float>(_2744) * _3103;
    int _3117 = ~_2644;
    int _3119 = _3117 + 1;
    float _3121 = float(uint(_3107));
    int _3123 = ~_2662;
    int _3125 = _3123 + 1;
    float _3127 = trunc(_3115);
    float _3129 = precise::max(_3127, 0.0);
    uint _3131 = uint(_3129);
    float _3133 = as_type<float>(_2730) * _3121;
    int _3135 = _3125 * int(_3099);
    int _3137 = _3135 + _2979;
    int _3139 = int(_3067) + int(_3113);
    float _3141 = trunc(_3133);
    float _3143 = precise::max(_3141, 0.0);
    uint _3145 = uint(_3143);
    float _3147 = float(uint(_3137));
    int _3149 = ~_2662;
    int _3151 = _3149 + 1;
    int _3153 = _3119 * _3139;
    int _3155 = _3153 + _3037;
    int _3157 = int(_3077) + int(_3131);
    float _3159 = as_type<float>(_2744) * _3147;
    int _3161 = ~_2644;
    int _3163 = _3161 + 1;
    bool _3165 = uint(_3155) >= uint(_2644);
    int _3167 = _3151 * _3157;
    int _3169 = _3167 + _3045;
    float _3171 = trunc(_3159);
    float _3173 = precise::max(_3171, 0.0);
    uint _3175 = uint(_3173);
    bool _3177 = !_3165;
    int _3179 = _3177 ? 0 : (-1);
    int _3181 = int(_3083) + int(_3145);
    int _3183 = ~_3139;
    int _3185 = _3183 + _3179;
    int _3187 = _3185 + 1;
    bool _3189 = uint(_3169) >= uint(_2662);
    int _3191 = _3163 * _3181;
    int _3193 = _3191 + _2971;
    int _3195 = _2644 * _3187;
    int _3197 = _3195 + _3037;
    bool _3199 = !_3189;
    int _3201 = _3199 ? 0 : (-1);
    bool _3203 = uint(_3193) >= uint(_2644);
    int _3205 = ~_2662;
    int _3207 = _3205 + 1;
    int _3209 = ~_3157;
    int _3211 = _3209 + _3201;
    int _3213 = _3211 + 1;
    bool _3215 = !_2718;
    int _3217 = _3215 ? _3197 : (-1);
    int _3219 = int(_3099) + int(_3175);
    int _3221 = _2662 * _3213;
    int _3223 = _3221 + _3045;
    int _3225 = _3217 & 3;
    bool _3227 = _3225 != 0;
    bool _3229 = !_3203;
    int _3231 = _3229 ? 0 : (-1);
    int _3233 = _3207 * _3219;
    int _3235 = _3233 + _2979;
    bool _3237 = uint(_3225) >= 2u;
    bool _3239 = !_2957;
    int _3241 = _3239 ? _3223 : (-1);
    int _3243 = _3237 ? 0 : 1;
    bool _3245 = uint(_3235) >= uint(_2662);
    int _3247 = _3241 >> 31;
    bool _3249 = uint(_3225) > 1u;
    int _3251 = _3217 >> 31;
    int _3253 = _3247 & 3;
    int _3255 = _3217 & 3;
    bool _3257 = _3255 != 0;
    int _3259 = _3251 & 3;
    int _3261 = _3241 + _3253;
    int _3263 = _3257 ? 0 : 1;
    int _3265 = _3217 + _3259;
    int _3267 = ~_3181;
    int _3269 = _3267 + _3231;
    int _3271 = _3269 + 1;
    bool _3273 = _3225 != 3;
    int _3275 = _3261 >> 2;
    int _3277 = _2644 * _3271;
    int _3279 = _3277 + _2971;
    int _3281 = ~_3263;
    int _3283 = _3281 + 1;
    int _3285 = _3283 + 1;
    int _3287 = _3265 >> 2;
    int _3289 = _3285;
    if (!_3249)
    {
        int _3291 = ~_3263;
        int _3293 = _3291 + 1;
        _3289 = _3293;
    }
    int _3295 = _3289;
    int _3297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3299 = _3297 != 0;
    float _3301 = -_195;
    int _3303 = _2670 ? as_type<int>(_3301) : as_type<int>(_195);
    int _3305 = _3275 << 4;
    int _3307 = _3305 + 512;
    int _3309 = _3241 & 3;
    bool _3311 = _3309 != 0;
    int _3313 = _3287 << 4;
    int _3315 = _3313 + 368;
    bool _3317 = !_3227;
    int _3319 = _3317 ? 0 : 1;
    int _3321 = _3241 & 3;
    bool _3323 = _3321 != 0;
    uint _3325 = uint(int(uint(_3315) >> uint(2)));
    uint _3327 = uint(int(uint(int(_3325)) >> uint(2)));
    int _3329 = int(_3325) & 3;
    float _3331 = (*spvDescriptorSet0.vp_c9)._m0[int(_3327)][_3329];
    int _3333 = int(_3325) + 1;
    uint _3335 = uint(int(uint(_3333) >> uint(2)));
    int _3337 = _3333 & 3;
    float _3339 = (*spvDescriptorSet0.vp_c9)._m0[int(_3335)][_3337];
    bool _3341 = !_3299;
    int _3343 = _3341 ? 0 : 1;
    bool _3345 = uint(_3309) > 1u;
    int _3347 = ~_3243;
    int _3349 = _3347 + 1;
    int _3351 = _3349 + 1;
    int _3353 = _3351;
    if (_3273)
    {
        int _3355 = ~_3243;
        int _3357 = _3355 + 1;
        _3353 = _3357;
    }
    int _3359 = _3353;
    uint _3361 = uint(int(uint(_3307) >> uint(2)));
    uint _3363 = uint(int(uint(int(_3361)) >> uint(2)));
    int _3365 = int(_3361) & 3;
    float _3367 = (*spvDescriptorSet0.vp_c9)._m0[int(_3363)][_3365];
    int _3369 = int(_3361) + 1;
    uint _3371 = uint(int(uint(_3369) >> uint(2)));
    int _3373 = _3369 & 3;
    float _3375 = (*spvDescriptorSet0.vp_c9)._m0[int(_3371)][_3373];
    int _3377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3379 = _3377 != 0;
    bool _3381 = !_3245;
    int _3383 = _3381 ? 0 : (-1);
    bool _3385 = !_2718;
    int _3387 = _3385 ? _3279 : (-1);
    bool _3389 = !_3379;
    int _3391 = _3389 ? 0 : 1;
    bool _3393 = !_3311;
    int _3395 = _3393 ? 0 : 1;
    int _3397 = _3323 ? 0 : 1;
    int _3399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3401 = _3399 != 0;
    int _3403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3405 = _3403 != 0;
    int _3407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3409 = _3407 != 0;
    int _3411 = ~_3219;
    int _3413 = _3411 + _3383;
    int _3415 = _3413 + 1;
    int _3417 = _3307 + 8;
    uint _3419 = uint(int(uint(_3417) >> uint(2)));
    uint _3421 = uint(int(uint(int(_3419)) >> uint(2)));
    int _3423 = int(_3419) & 3;
    float _3425 = (*spvDescriptorSet0.vp_c9)._m0[int(_3421)][_3423];
    int _3427 = int(_3419) + 1;
    uint _3429 = uint(int(uint(_3427) >> uint(2)));
    int _3431 = _3427 & 3;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[int(_3429)][_3431];
    int _3435 = ~_3397;
    int _3437 = _3435 + 1;
    int _3439 = _3437 + 1;
    bool _3441 = _3225 != 3;
    int _3443 = _3439;
    if (!_3345)
    {
        int _3445 = ~_3397;
        int _3447 = _3445 + 1;
        _3443 = _3447;
    }
    int _3449 = _3443;
    bool _3451 = _3309 != 3;
    int _3453 = _3315 + 8;
    uint _3455 = uint(int(uint(_3453) >> uint(2)));
    uint _3457 = uint(int(uint(int(_3455)) >> uint(2)));
    int _3459 = int(_3455) & 3;
    float _3461 = (*spvDescriptorSet0.vp_c9)._m0[int(_3457)][_3459];
    int _3463 = int(_3455) + 1;
    uint _3465 = uint(int(uint(_3463) >> uint(2)));
    int _3467 = _3463 & 3;
    float _3469 = (*spvDescriptorSet0.vp_c9)._m0[int(_3465)][_3467];
    bool _3471 = !_3441;
    int _3473 = _3471 ? 0 : (-1);
    bool _3475 = uint(_3309) >= 2u;
    bool _3477 = _885 > 0.5;
    int _3479 = _2662 * _3415;
    int _3481 = _3479 + _2979;
    int _3483 = _3475 ? 0 : 1;
    float _3485 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3487 = _3309 != 3;
    int _3489 = ~_3483;
    int _3491 = _3489 + 1;
    int _3493 = _3491 + 1;
    float _3495 = -_1729;
    float _3497 = fma(_3495, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3485);
    int _3499 = _3493;
    if (_3451)
    {
        int _3501 = ~_3483;
        int _3503 = _3501 + 1;
        _3499 = _3503;
    }
    int _3505 = _3499;
    bool _3507 = _887 > 0.5;
    float _3509 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3511 = int(_3509);
    bool _3513 = !_2957;
    int _3515 = _3513 ? _3481 : (-1);
    bool _3517 = _889 > 0.5;
    int _3519 = abs(_3449);
    bool _3521 = !_3487;
    int _3523 = _3521 ? 0 : (-1);
    int _3525 = abs(_3295);
    float _3527 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3529 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3531 = _3529 != 0;
    float _3533 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3535 = abs(_3395);
    int _3537 = ~_3519;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    float _3543 = -_1729;
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3527);
    int _3547 = ~_3525;
    int _3549 = _3547 + 1;
    int _3551 = _3549 + 1;
    float _3553 = -_1729;
    float _3555 = fma(_3553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3533);
    int _3557 = abs(_3319);
    int _3559 = _3541 * as_type<int>(_3375);
    int _3561 = abs(_3359);
    int _3563 = _3551 * as_type<int>(_3339);
    float _3565 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3567 = int(_3565);
    int _3569 = abs(_3505);
    int _3571 = ~_3535;
    int _3573 = _3571 + 1;
    int _3575 = _3573 + 1;
    int _3577 = ~_3557;
    int _3579 = _3577 + 1;
    int _3581 = _3579 + 1;
    int _3583 = ~_3569;
    int _3585 = _3583 + 1;
    int _3587 = _3585 + 1;
    int _3589 = _3575 * as_type<int>(_3367);
    int _3591 = _3589 + _3559;
    int _3593 = ~_3561;
    int _3595 = _3593 + 1;
    int _3597 = _3595 + 1;
    int _3599 = _3581 * as_type<int>(_3331);
    int _3601 = _3599 + _3563;
    float _3603 = float(uint(_3511));
    int _3605 = _3587 * as_type<int>(_3425);
    int _3607 = _3605 + _3591;
    int _3609 = abs(_3473);
    int _3611 = _3597 * as_type<int>(_3461);
    int _3613 = _3611 + _3601;
    int _3615 = abs(_3523);
    float _3617 = 1.0 / _3603;
    int _3619 = ~_3609;
    int _3621 = _3619 + 1;
    int _3623 = _3621 + 1;
    int _3625 = ~_3615;
    int _3627 = _3625 + 1;
    int _3629 = _3627 + 1;
    int _3631 = abs(_3343);
    int _3633 = _3623 * as_type<int>(_3469);
    int _3635 = _3633 + _3613;
    int _3637 = abs(_3511);
    int _3639 = _3629 * as_type<int>(_3433);
    int _3641 = _3639 + _3607;
    float _3643 = float(uint(_3567));
    float _3645 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3497);
    int _3647 = abs(_3391);
    float _3649 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3555);
    float _3651 = 1.0 / _3643;
    int _3653 = ~_3631;
    int _3655 = _3653 + 1;
    int _3657 = _3655 + 1;
    float _3659 = float(uint(_3637));
    int _3661 = ~_3647;
    int _3663 = _3661 + 1;
    int _3665 = _3663 + 1;
    int _3667 = _3635 * _3657;
    float _3669 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3545);
    float _3671 = 1.0 / _3659;
    int _3673 = as_type<int>(_3617) + (-2);
    int _3675 = _3641 * _3665;
    float _3677 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3679 = _3387 * _3631;
    int _3681 = _3679 + _3667;
    float _3683 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3685 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3687 = _3515 * _3647;
    int _3689 = _3687 + _3675;
    int _3691 = abs(_3567);
    float _3693 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3677);
    float _3695 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3683);
    float _3697 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3685);
    float _3699 = -_195;
    int _3701 = _3507 ? as_type<int>(_3699) : as_type<int>(_195);
    float _3703 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3705 = float(uint(_3691));
    int _3707 = as_type<int>(_3651) + (-2);
    int _3709 = abs(_3681);
    float _3711 = float(uint(_3689));
    float _3713 = 1.0 / _3705;
    bool _3715 = !_3405;
    float _3717 = _3715 ? _195 : as_type<float>(_3701);
    int _3719 = as_type<int>(_3671) + (-2);
    float _3721 = as_type<float>(_3707) * _3711;
    float _3723 = float(uint(_3709));
    float _3725 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3727 = float(uint(_3681));
    float _3729 = trunc(_3721);
    float _3731 = precise::max(_3729, 0.0);
    uint _3733 = uint(_3731);
    bool _3735 = !_3401;
    float _3737 = _3735 ? _195 : as_type<float>(_3303);
    float _3739 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3741 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3743 = as_type<float>(_3719) * _3723;
    float _3745 = as_type<float>(_3673) * _3727;
    int _3747 = ~_3511;
    int _3749 = _3747 + 1;
    float _3751 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3703);
    float _3753 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3739);
    float _3755 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3741);
    int _3757 = ~_3567;
    int _3759 = _3757 + 1;
    float _3761 = trunc(_3743);
    float _3763 = precise::max(_3761, 0.0);
    uint _3765 = uint(_3763);
    int _3767 = abs(_3689);
    float _3769 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3751);
    float _3771 = fma(_3725, _3725, 1.0);
    float _3773 = trunc(_3745);
    float _3775 = precise::max(_3773, 0.0);
    uint _3777 = uint(_3775);
    int _3779 = as_type<int>(_3713) + (-2);
    float _3781 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3753);
    float _3783 = float(uint(_3767));
    float _3785 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3755);
    int _3787 = ~_3637;
    int _3789 = _3787 + 1;
    int _3791 = _3759 * int(_3733);
    int _3793 = _3791 + _3689;
    int _3795 = ~_3691;
    int _3797 = _3795 + 1;
    float _3799 = as_type<float>(_3779) * _3783;
    float _3801 = rsqrt(_3771);
    int _3803 = _3789 * int(_3765);
    int _3805 = _3803 + _3709;
    float _3807 = float(uint(_3793));
    float _3809 = float(uint(_3805));
    int _3811 = _3749 * int(_3777);
    int _3813 = _3811 + _3681;
    float _3815 = trunc(_3799);
    float _3817 = precise::max(_3815, 0.0);
    uint _3819 = uint(_3817);
    float _3821 = -_185;
    int _3823 = _3477 ? as_type<int>(_3821) : as_type<int>(_185);
    float _3825 = as_type<float>(_3707) * _3807;
    float _3827 = as_type<float>(_3719) * _3809;
    float _3829 = float(uint(_3813));
    float _3831 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3693);
    float _3833 = -_185;
    int _3835 = _3517 ? as_type<int>(_3833) : as_type<int>(_185);
    float _3837 = _3725 * _3645;
    int _3839 = ~_3691;
    int _3841 = _3839 + 1;
    float _3843 = as_type<float>(_3673) * _3829;
    float _3845 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3695);
    float _3847 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3697);
    bool _3849 = !_3531;
    float _3851 = _3849 ? _185 : as_type<float>(_3823);
    float _3853 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3855 = !_3409;
    float _3857 = _3855 ? _185 : as_type<float>(_3835);
    float _3859 = trunc(_3825);
    float _3861 = precise::max(_3859, 0.0);
    uint _3863 = uint(_3861);
    int _3865 = _3841 * int(_3819);
    int _3867 = _3865 + _3767;
    float _3869 = _3725 * _3801;
    float _3871 = _3725 * _3669;
    float _3873 = _3725 * _3649;
    float _3875 = fma(_3853, _3831, _3837);
    float _3877 = float(uint(_3867));
    float _3879 = -_3781;
    float _3881 = _3869 * _3879;
    float _3883 = trunc(_3843);
    float _3885 = precise::max(_3883, 0.0);
    uint _3887 = uint(_3885);
    float _3889 = fma(_3853, _3845, _3871);
    float _3891 = fma(_3853, _3847, _3873);
    float _3893 = as_type<float>(_3779) * _3877;
    float _3895 = fma(_3801, _3669, _3881);
    int _3897 = ~_3567;
    int _3899 = _3897 + 1;
    out.m_74.x = _3831;
    out.m_74.y = _3845;
    out.m_74.z = _3847;
    int _3901 = ~_3511;
    int _3903 = _3901 + 1;
    float _3905 = trunc(_3827);
    float _3907 = precise::max(_3905, 0.0);
    uint _3909 = uint(_3907);
    int _3911 = int(_3733) + int(_3863);
    float _3913 = -_3769;
    float _3915 = _3869 * _3913;
    float _3917 = -_3785;
    float _3919 = _3869 * _3917;
    float _3921 = fma(_3801, _3645, _3915);
    float _3923 = _3769 + _3875;
    float _3925 = trunc(_3893);
    float _3927 = precise::max(_3925, 0.0);
    uint _3929 = uint(_3927);
    int _3931 = int(_3777) + int(_3887);
    int _3933 = _3899 * _3911;
    int _3935 = _3933 + _3689;
    int _3937 = ~_3637;
    int _3939 = _3937 + 1;
    float _3941 = fma(_3801, _3649, _3919);
    float _3943 = _3781 + _3889;
    int _3945 = _3903 * _3931;
    int _3947 = _3945 + _3681;
    float _3949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3951 = int(_3765) + int(_3909);
    out.m_76.x = _3921;
    out.m_76.y = _3895;
    out.m_76.z = _3941;
    bool _3953 = uint(_3935) >= uint(_3567);
    float _3955 = _3785 + _3891;
    bool _3957 = uint(_3947) >= uint(_3511);
    int _3959 = _3939 * _3951;
    int _3961 = _3959 + _3709;
    bool _3963 = !_3953;
    int _3965 = _3963 ? 0 : (-1);
    float _3967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3969 = int(_3819) + int(_3929);
    out.m_78.x = _3923;
    out.m_78.y = _3943;
    out.m_78.z = _3955;
    bool _3971 = !_3957;
    int _3973 = _3971 ? 0 : (-1);
    int _3975 = ~_3911;
    int _3977 = _3975 + _3965;
    int _3979 = _3977 + 1;
    int _3981 = _3797 * _3969;
    int _3983 = _3981 + _3767;
    bool _3985 = uint(_3961) >= uint(_3637);
    float _3987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3989 = ~_3931;
    int _3991 = _3989 + _3973;
    int _3993 = _3991 + 1;
    int _3995 = _3567 * _3979;
    int _3997 = _3995 + _3689;
    bool _3999 = uint(_3983) >= uint(_3691);
    float _4001 = _3949 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4003 = _3681 ^ _3511;
    int _4005 = _3511 * _3993;
    int _4007 = _4005 + _3681;
    bool _4009 = !_3999;
    int _4011 = _4009 ? 0 : (-1);
    bool _4013 = !_3985;
    int _4015 = _4013 ? 0 : (-1);
    uint _4017 = uint(int(uint(_4003) >> uint(31)));
    int _4019 = ~_4011;
    int _4021 = _3969 + _4019;
    int _4023 = _4021 + 1;
    bool _4025 = _3511 == 0;
    float _4027 = _3987 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4029 = _3689 ^ _3567;
    int _4031 = ~_4015;
    int _4033 = _3951 + _4031;
    int _4035 = _4033 + 1;
    int _4037 = ~int(_4017);
    int _4039 = _4037 + 1;
    uint _4041 = uint(int(uint(_4029) >> uint(31)));
    bool _4043 = !_4025;
    int _4045 = _4043 ? _4007 : (-1);
    int _4047 = _4035 ^ _4039;
    int _4049 = ~int(_4041);
    int _4051 = _4049 + 1;
    float _4053 = float(_4045);
    bool _4055 = _3511 == 0;
    int _4057 = ~_4039;
    int _4059 = _4057 + _4047;
    int _4061 = _4059 + 1;
    float _4063 = fma(_2759, _4053, _1011);
    bool _4065 = _3567 == 0;
    int _4067 = _4023 ^ _4051;
    bool _4069 = !_4055;
    int _4071 = _4069 ? _4061 : (-1);
    bool _4073 = _3567 == 0;
    int _4075 = ~_4051;
    int _4077 = _4075 + _4067;
    int _4079 = _4077 + 1;
    bool _4081 = !_4065;
    int _4083 = _4081 ? _3997 : (-1);
    float _4085 = float(_4071);
    bool _4087 = !_4073;
    int _4089 = _4087 ? _4079 : (-1);
    float _4091 = float(_4083);
    float _4093 = _3851 + 0.5;
    float _4095 = -_1049;
    float _4097 = fma(_4027, _4085, _4095);
    float _4099 = float(_4089);
    float _4101 = _3717 + (-0.5);
    float _4103 = _3967 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4105 = fma(_2759, _4093, _4063);
    float _4107 = fma(_4001, _4091, _1467);
    float _4109 = _3857 + 0.5;
    float _4111 = -_4027;
    float _4113 = fma(_4111, _4101, _4097);
    float _4115 = -_1469;
    float _4117 = fma(_4103, _4099, _4115);
    float _4119 = -_1441;
    float _4121 = _4119 + 1.0;
    float _4123 = _3737 + (-0.5);
    float _4125 = fma(_4001, _4109, _4107);
    float _4127 = _2815 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4129 = -_4121;
    float _4131 = fma(_3851, _4129, _4105);
    float _4133 = -_4103;
    float _4135 = fma(_4133, _4123, _4117);
    float _4137 = -_2674;
    float _4139 = fma(_3857, _4137, _4125);
    float _4141 = _2587 + _2561;
    float _4143 = _2561 * 0.5;
    float _4145 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2720);
    float _4147 = _4127 * _2619;
    bool _4149 = _2303 > 0.0;
    bool _4151 = isnan(_2303);
    bool _4153 = _4149 || _4151;
    bool _4155 = isnan(0.0);
    bool _4157 = _4153 || _4155;
    float _4159 = _4141 * 0.5;
    float _4161 = fma(_2591, -0.5, _4143);
    float _4163 = fma(_3737, _2724, _4135);
    float _4165 = -_1457;
    float _4167 = _4165 + 1.0;
    float _4169 = _4145 + _2561;
    float _4171 = _2303 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4173 = _2630 * _4147;
    float _4175 = _2640 * _4147;
    float _4177 = -_4127;
    float _4179 = _4177 + 1.0;
    float _4181 = fma(_3717, _4167, _4113);
    float _4183 = _4169 * 0.5;
    float _4185 = _4171 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4187 = fma(_2636, _4173, _2624);
    float _4189 = fma(_2638, _4173, _2626);
    float _4191 = _2630 * _4179;
    float _4193 = fma(_2630, _4175, _2628);
    out.gl_Position.x = _2587;
    out.gl_Position.y = _2591;
    out.gl_Position.z = _4145;
    out.gl_Position.w = _2561;
    out.m_80.x = _4159;
    out.m_80.y = _4161;
    out.m_80.z = _4183;
    out.m_80.w = _2561;
    out.m_82.x = _4131;
    out.m_82.y = _4181;
    out.m_82.z = _4139;
    out.m_82.w = _4163;
    out.m_47.x = _4185;
    out.m_84.x = _4187;
    out.m_84.y = _4189;
    out.m_84.z = _4193;
    out.m_84.w = _4191;
    if (_4157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4195 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4195;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _875 = false;
    bool _771 = false;
    bool _657 = false;
    bool _553 = false;
    bool _385 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_47.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4252 = as_type<float>(_119);
        out.gl_Position.z = _4252;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_49.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4322 = as_type<float>(_157);
        out.gl_Position.z = _4322;
    }
    if (_149)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_54.x;
    float _163 = in.m_54.y;
    float _165 = in.m_54.z;
    int _167 = as_type<int>(_159) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_159) & 2;
    bool _173 = _171 != 0;
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _181 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _183 = !_169;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    float _191 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    bool _193 = !_173;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _199 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    bool _203 = !_175;
    float _205 = _197;
    float _207 = _199;
    float _209 = _201;
    float _227;
    if (!_203)
    {
        float _211 = in.m_56.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_103);
        float _233 = 1.0 / _231;
        float _235 = _137 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    bool _243 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_237);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _237 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -_253;
    float _269 = _267 + 1.0;
    float _271 = in.m_58.x;
    float _273 = in.m_58.y;
    bool _275 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _277 = isnan(_237);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = 1.0 / _261;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _291 = 1.0 / _265;
    float _293 = _241 * _287;
    bool _295 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_237);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = _305 * _269;
    float _317 = -_305;
    float _319 = _317 + 1.0;
    float _321 = _257 * _291;
    float _323 = fma(_309, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = fma(_313, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = _285 * _319;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = -_285;
    float _335 = _333 + 1.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = _323 * _327;
    float _343 = _325 * _327;
    float _345 = fma(_331, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _347 = fma(_339, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _353 = fma(_345, _315, _349);
    float _355 = fma(_347, _315, _351);
    float _357 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].x, _353);
    float _359 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].y, _355);
    float _361 = _357 * _271;
    float _363 = _359 * _273;
    bool _365 = !_289;
    float _383;
    if (!_365)
    {
        float _367 = in.m_56.x;
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _371 = _367 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_103);
        float _389 = 1.0 / _387;
        float _391 = _137 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _393 + _395;
    bool _399 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _413 = _393 + _411;
    bool _415 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _417 = isnan(_393);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _435 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _437 = isnan(_393);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = 1.0 / _433;
    float _453 = _445 * _449;
    float _455 = -_445;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _459;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = 1.0 / _429;
    float _467 = _425 * _457;
    float _469 = -_425;
    float _471 = _469 + 1.0;
    float _473 = _413 * _451;
    float _475 = _397 * _465;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _481;
    float _485 = fma(_461, _475, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_479, _475, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = fma(_483, _475, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _491 = _485 * _467;
    float _493 = _487 * _467;
    float _495 = _489 * _467;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _509 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _511 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].y, _493);
    float _513 = fma(_499, _473, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _515 = fma(_503, _473, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _517 = fma(_507, _473, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _519 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].z, _495);
    float _521 = fma(_513, _453, _509);
    float _523 = fma(_515, _453, _511);
    float _525 = fma(_517, _453, _519);
    float _527 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _521);
    float _529 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _525);
    bool _533 = !_463;
    float _551;
    if (!_533)
    {
        float _535 = in.m_56.x;
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _539 = _535 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_103);
        float _557 = 1.0 / _555;
        float _559 = _137 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _565 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _567 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _569 = isnan(_561);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _583 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _585 = isnan(_561);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _601 = _561 + _599;
    float _603 = -_577;
    float _605 = _603 + 1.0;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _609 = 1.0 / _581;
    float _611 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _613 = _593 * _605;
    float _615 = -_593;
    float _617 = _615 + 1.0;
    float _619 = _563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _597 * _609;
    float _627 = fma(_625, _601, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _629 = _627 * _613;
    float _631 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[115].x, _629);
    float _633 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[116].x, _631);
    float _635 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _637 = !_607;
    float _655;
    if (!_637)
    {
        float _639 = in.m_56.x;
        float _641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _643 = _639 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[11].z, _137);
        float _647 = _645 * _641;
        float _649 = floor(_647);
        float _651 = -_649;
        float _653 = _647 + _651;
        _655 = _653;
        _657 = true;
    }
    else
    {
        float _659 = float(_103);
        float _661 = 1.0 / _659;
        float _663 = _137 * _661;
        _655 = _663;
    }
    _657 = false;
    float _665 = _655;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _669 = _665 + _667;
    bool _671 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _673 = isnan(_665);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _683;
    bool _687 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _689 = isnan(_665);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_681;
    float _701 = _699 + 1.0;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _703;
    float _707 = 1.0 / _685;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _711 = _697 * _701;
    float _713 = -_697;
    float _715 = _713 + 1.0;
    float _717 = _669 * _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _719;
    float _723 = fma(_705, _717, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _725;
    float _729 = fma(_721, _717, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _731 = _723 * _711;
    float _733 = fma(_727, _717, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _735 = _729 * _711;
    float _737 = _733 * _711;
    float _739 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[123].x, _731);
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[123].y, _737);
    float _743 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[123].z, _735);
    float _745 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[124].x, _739);
    float _747 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[124].y, _741);
    float _749 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[124].z, _743);
    bool _751 = !_709;
    float _769;
    if (!_751)
    {
        float _753 = in.m_56.x;
        float _755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _757 = _753 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _761 = _759 * _755;
        float _763 = floor(_761);
        float _765 = -_763;
        float _767 = _761 + _765;
        _769 = _767;
        _771 = true;
    }
    else
    {
        float _773 = float(_103);
        float _775 = 1.0 / _773;
        float _777 = _137 * _775;
        _769 = _777;
    }
    _771 = false;
    float _779 = _769;
    float _781 = _745 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _783 = _747 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _785 = _779 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _787 = isnan(_779);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _801 = _779 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _803 = isnan(_779);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _813;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _819 = _779 + _817;
    float _821 = -_795;
    float _823 = _821 + 1.0;
    bool _825 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _827 = 1.0 / _799;
    float _829 = _749 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _831 = _811 * _823;
    float _833 = -_811;
    float _835 = _833 + 1.0;
    float _837 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _815 * _827;
    float _845 = fma(_843, _819, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _847 = _845 * _831;
    float _849 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[131].x, _847);
    float _851 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[132].x, _849);
    float _853 = _851 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _855 = !_825;
    float _873;
    if (!_855)
    {
        float _857 = in.m_56.x;
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _861 = _857 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[14].x, _137);
        float _865 = _863 * _859;
        float _867 = floor(_865);
        float _869 = -_867;
        float _871 = _865 + _869;
        _873 = _871;
        _875 = true;
    }
    else
    {
        float _877 = float(_103);
        float _879 = 1.0 / _877;
        float _881 = _137 * _879;
        _873 = _881;
    }
    _875 = false;
    float _883 = _873;
    float _885 = in.m_56.x;
    float _887 = in.m_56.y;
    float _889 = in.m_56.z;
    float _891 = in.m_56.w;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _895 = _883 + _893;
    float _897 = in.m_44.x;
    float _899 = in.m_44.y;
    float _901 = in.m_44.z;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _913 = _911 != 0;
    float _915 = 1.0 / _905;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _919 = _363 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _925 = 1.0 / _909;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _933 = _885 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _935 = _887 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _937 = 1.0 / _923;
    float _939 = -_917;
    float _941 = fma(_933, 2.0, _939);
    float _943 = fma(_935, -2.0, _931);
    float _945 = _899 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _951 = _899 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _953 = 1.0 / _929;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _959 = _899 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _961 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[4].x, _945);
    float _963 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[5].x, _951);
    float _965 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[6].x, _959);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _967;
    float _971 = 1.0 / _949;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _975 = _973 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _977 = _969 * _915;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _979;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _983;
    float _987 = 1.0 / _957;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _993 = _885 * 2.0;
    float _995 = _985 * _925;
    float _997 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[4].z, _961);
    float _999 = _991 * _937;
    float _1001 = _887 * 2.0;
    float _1003 = floor(_993);
    float _1005 = _981 * _971;
    float _1007 = _997 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1009 = -_137;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[76].x, _941);
    bool _1013 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1015 = isnan(_883);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1027 = 1.0 / _975;
    float _1029 = _889 * 2.0;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1035 = _1007 + _1033;
    bool _1037 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1039 = isnan(_883);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _943);
    float _1051 = floor(_1029);
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1057 = _1003 >= 0.0;
    bool _1059 = isnan(_1003);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    bool _1067 = _1003 > 0.0;
    float _1069 = _1055 * _953;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1075;
    float _1079 = floor(_1001);
    float _1081 = _885 + _887;
    float _1083 = _1073 * _1027;
    float _1085 = _1077 * _987;
    float _1087 = _889 + _885;
    float _1089 = _1081 + (-1.0);
    float _1091 = _889 + _887;
    float _1093 = _1087 + (-1.0);
    float _1095 = _1091 + (-1.0);
    bool _1097 = _1051 > 0.0;
    float _1099 = fma(_1069, _895, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1101 = _1051 >= 0.0;
    bool _1103 = isnan(_1051);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1113 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1115 = _1079 > 0.0;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1119 = _883 + _1117;
    int _1121 = as_type<int>(_1051);
    if (_913)
    {
        _1121 = 0;
    }
    int _1123 = _1121;
    float _1125 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[5].z, _963);
    int _1127 = _1123;
    if (!_913)
    {
        _1127 = 1;
    }
    int _1129 = _1127;
    float _1131 = fma(_995, _1119, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1133 = _1079 >= 0.0;
    bool _1135 = isnan(_1079);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(0.0);
    bool _1141 = _1137 || _1139;
    float _1143 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[6].z, _965);
    float _1145 = _1065 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1147 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1149 = _1109 ? 0 : 1;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1153 = _883 + _1151;
    bool _1155 = _1129 != 1;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1159 = _883 + _1157;
    int _1161 = _1141 ? 0 : 1;
    float _1163 = fma(_999, _1153, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _1165 = ~_1149;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    float _1171 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1173 = log2(_1171);
    int _1175 = _1169;
    float _1177 = _1145;
    float _1179 = _1159;
    if (!_1097)
    {
        int _1181 = ~_1149;
        int _1183 = _1181 + 1;
        _1175 = _1183;
    }
    int _1185 = _1175;
    float _1187 = fma(_977, _1159, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1199 = _1197 != 0;
    float _1201 = _1125 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1203 = ~_1161;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1211 = _1207;
    if (!_1115)
    {
        int _1213 = ~_1161;
        int _1215 = _1213 + 1;
        _1211 = _1215;
    }
    int _1217 = _1211;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1221 = _1201 + _1219;
    float _1223 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1225 = int(_1223);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1209 + _1227;
    bool _1231 = !_1195;
    int _1233 = _1231 ? 0 : 1;
    bool _1235 = !_1191;
    int _1237 = _1235 ? 0 : 1;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1241 = !_1199;
    int _1243 = _1241 ? 0 : 1;
    int _1245 = ~as_type<int>(_1145);
    int _1247 = _1245 + 1;
    int _1249 = _1247 + 1;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1261 = _1259 != 0;
    int _1263 = _1249;
    if (!_1067)
    {
        int _1265 = ~as_type<int>(_1145);
        int _1267 = _1265 + 1;
        _1263 = _1267;
    }
    int _1269 = _1263;
    if (!_1155)
    {
        _1177 = _889;
    }
    float _1271 = _1177;
    float _1273 = _1271;
    if (_1155)
    {
        _1273 = _887;
    }
    float _1275 = _1273;
    bool _1277 = !_1257;
    int _1279 = _1277 ? 0 : 1;
    float _1281 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1239);
    float _1283 = float(_103);
    float _1285 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1287 = int(_1285);
    bool _1289 = !_1253;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1295 = _1275;
    if (!_1155)
    {
        _1179 = _887;
    }
    float _1297 = _1179;
    float _1299 = _1297;
    if (_1155)
    {
        _1299 = _885;
    }
    float _1301 = _1299;
    int _1303 = abs(_1279);
    float _1305 = 1.0 / _1283;
    int _1307 = abs(_1291);
    float _1309 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1293);
    float _1311 = float(_1269);
    float _1313 = float(_1303);
    float _1315 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1309);
    float _1317 = float(_1225);
    float _1319 = _1301;
    if (!_1155)
    {
        _1319 = _887;
    }
    float _1321 = _1319;
    float _1323 = _1313 * _1311;
    float _1325 = float(_1307);
    float _1327 = 1.0 / _1317;
    float _1329 = float(_1185);
    float _1331 = _1173 * _137;
    float _1333 = _1321;
    if (_1155)
    {
        _1333 = _885;
    }
    float _1335 = _1333;
    float _1337 = _1323 * (-2.0);
    if (!_1155)
    {
        _1295 = _889;
    }
    float _1339 = _1295;
    float _1341 = _1325 * _1329;
    float _1343 = _1339;
    if (_1155)
    {
        _1343 = _887;
    }
    float _1345 = _1343;
    float _1347 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1349 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1351 = isnan(_883);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = exp2(_1331);
    float _1363 = float(_1287);
    float _1365 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1367 = -_1025;
    float _1369 = fma(_1347, 2.0, _1367);
    bool _1371 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1373 = isnan(_883);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = -_1359;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1365, -2.0, _1031);
    float _1389 = 1.0 / _1363;
    float _1391 = _1381 * _1385;
    float _1393 = -_1381;
    float _1395 = _1393 + 1.0;
    float _1397 = in.m_60.x;
    float _1399 = in.m_60.y;
    float _1401 = in.m_60.z;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1405 = _1327 * _137;
    float _1407 = _1221 * _1221;
    float _1409 = _1023 * _1395;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1413 = 1.0 + _1411;
    float _1415 = _1305 * _137;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1419 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1403);
    float _1421 = 1.0 / _1413;
    bool _1423 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1425 = isnan(1.0);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1431 = _1427 || _1429;
    float _1433 = fma(_1035, _1035, _1407);
    float _1435 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1417);
    float _1437 = -_1361;
    float _1439 = _1437 + 1.0;
    float _1441 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1419);
    bool _1443 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1445 = isnan(0.0);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1229, _1229, _1433);
    float _1455 = _1389 * _137;
    float _1457 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1435);
    float _1459 = _1451 ? _1439 : 0.0;
    float _1461 = sqrt(_1453);
    float _1463 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1281);
    float _1465 = -_137;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1369);
    float _1469 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1387);
    float _1471 = -_1023;
    float _1473 = _1471 + 1.0;
    if (_1431)
    {
        float _1475 = _1459 * _1421;
        _139 = _1475;
    }
    float _1477 = _139;
    float _1479 = _1341 * (-2.0);
    float _1481 = -_1047;
    float _1483 = _1481 + 1.0;
    float _1485 = _1047 * _1473;
    bool _1487 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1489 = isnan(_883);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = fma(_1147, _1479, _1147);
    float _1501 = fma(_1479, _1397, _1397);
    float _1503 = _885 + (-0.5);
    float _1505 = _361 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1507 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1509 = isnan(_883);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = _1497 * _1483;
    float _1521 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1501);
    float _1523 = -_1497;
    float _1525 = _1523 + 1.0;
    float _1527 = _1505 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1529 = _1461 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1531 = rsqrt(_1453);
    bool _1533 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1535 = isnan(_883);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = _1517 * _1525;
    float _1547 = -_1517;
    float _1549 = _1547 + 1.0;
    float _1551 = precise::min(_1527, _1529);
    float _1553 = fma(_1499, _1477, _1521);
    bool _1555 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1557 = isnan(_883);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = -_1543;
    float _1569 = _1567 + 1.0;
    bool _1571 = !_1261;
    int _1573 = _1571 ? 0 : 1;
    float _1575 = _1543 * _1549;
    float _1577 = _887 + (-0.5);
    float _1579 = _1565 * _1569;
    float _1581 = fma(_1337, _1399, _1399);
    int _1583 = abs(_1573);
    float _1585 = _1553 * 0.15915493667125701904296875;
    float _1587 = float(_1217);
    float _1589 = fma(_1113, _1337, _1113);
    float _1591 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1581);
    float _1593 = float(_1583);
    float _1595 = _1531 * _1551;
    float _1597 = _1131 * _1579;
    float _1599 = fma(_1589, _1477, _1591);
    float _1601 = _1585 * 6.283185482025146484375;
    float _1603 = sin(_1601);
    float _1605 = _1221 * _1595;
    float _1607 = _1593 * _1587;
    float _1609 = -_1565;
    float _1611 = _1609 + 1.0;
    float _1613 = _1035 * _1595;
    float _1615 = -_1605;
    float _1617 = _1221 + _1615;
    float _1619 = _1607 * (-2.0);
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1597);
    float _1623 = _1229 * _1595;
    float _1625 = _1617 * _1617;
    float _1627 = fma(_1619, _1401, _1401);
    float _1629 = _889 + (-0.5);
    float _1631 = -_1613;
    float _1633 = _1035 + _1631;
    float _1635 = fma(_1163, _1575, _1621);
    float _1637 = fma(_1111, _1619, _1111);
    float _1639 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1627);
    float _1641 = fma(_1633, _1633, _1625);
    float _1643 = -_1623;
    float _1645 = _1229 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1649 = _883 + _1647;
    float _1651 = fma(_1187, _1545, _1635);
    float _1653 = fma(_1637, _1477, _1639);
    float _1655 = fma(_1645, _1645, _1641);
    float _1657 = fma(_1005, _1649, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1659 = _1599 * 0.15915493667125701904296875;
    float _1661 = fma(_1099, _1519, _1651);
    float _1663 = _1653 * 0.15915493667125701904296875;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1667 = _883 + _1665;
    float _1669 = sqrt(_1655);
    float _1671 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1673 = fma(_1657, _1485, _1661);
    float _1675 = fma(_1083, _1667, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1679 = _883 + _1677;
    float _1681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1683 = fma(_1675, _1409, _1673);
    float _1685 = _1585 * 6.283185482025146484375;
    float _1687 = cos(_1685);
    float _1689 = fma(_1085, _1679, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1691 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1671);
    float _1693 = fma(_1689, _1391, _1683);
    float _1695 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1691);
    float _1697 = _1659 * 6.283185482025146484375;
    float _1699 = cos(_1697);
    float _1701 = _1531 * _1669;
    float _1703 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1693);
    float _1705 = _919 * _1701;
    float _1707 = _1505 * _1701;
    float _1709 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1711 = _1709 * 0.5;
    float _1713 = _1663 * 6.283185482025146484375;
    float _1715 = cos(_1713);
    float _1717 = _1705 * _1681;
    float _1719 = _1659 * 6.283185482025146484375;
    float _1721 = sin(_1719);
    float _1723 = _1603 * _1699;
    float _1725 = _1687 * _1699;
    float _1727 = _1663 * 6.283185482025146484375;
    float _1729 = sin(_1727);
    float _1731 = _1699 * _1715;
    float _1733 = _1687 * _1715;
    float _1735 = _1603 * _1715;
    float _1737 = _1735 * _1717;
    float _1739 = _1687 * _1721;
    float _1741 = _1603 * _1721;
    float _1743 = _1721 * _1715;
    float _1745 = _1733 * _1717;
    float _1747 = sqrt(_1695);
    float _1749 = -_1739;
    float _1751 = fma(_1729, _1723, _1749);
    float _1753 = -_1723;
    float _1755 = fma(_1729, _1739, _1753);
    float _1757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1759 = fma(_1729, _1725, _1741);
    float _1761 = -_1717;
    float _1763 = _1729 * _1761;
    float _1765 = fma(_1729, _1741, _1725);
    float _1767 = _1707 * _1757;
    float _1769 = fma(_1759, _1767, _1745);
    float _1771 = fma(_1731, _1767, _1763);
    float _1773 = fma(_1751, _1767, _1737);
    float _1775 = _1747 * 50.0;
    float _1777 = fma(_1755, _1711, _1769);
    float _1779 = fma(_1743, _1711, _1771);
    float _1781 = fma(_1765, _1711, _1773);
    float _1783 = _1703 * _1775;
    float _1785 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1789 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1791 = _1783 * _1783;
    float _1793 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1785);
    float _1795 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1787);
    float _1797 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1789);
    float _1799 = rsqrt(_1791);
    float _1801 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1793);
    float _1803 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1795);
    float _1805 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1797);
    float _1807 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1809 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1811 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1813 = _1807 * _1807;
    float _1815 = _1209 + _1809;
    float _1817 = _1809 * _1809;
    float _1819 = _1007 + _1807;
    float _1821 = fma(_1811, _1811, _1813);
    float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1825 = _1815 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1829 = _1819 + _1827;
    float _1831 = _1817 + _1821;
    float _1833 = _1825 * _1825;
    float _1835 = _1783 * _1799;
    float _1837 = fma(_1829, _1829, _1833);
    float _1839 = rsqrt(_1831);
    float _1841 = sqrt(_1837);
    float _1843 = sqrt(_1791);
    float _1845 = _1811 * _1839;
    float _1847 = _1835 * _1845;
    bool _1849 = _1841 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1853 = _1851 != 0;
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1857 = _1855 != 0;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1861 = _1859 != 0;
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1865 = _1863 != 0;
    float _1867 = _1847 * _1843;
    bool _1869 = !_1857;
    int _1871 = _1869 ? 0 : 1;
    bool _1873 = !_1861;
    int _1875 = _1873 ? 0 : 1;
    float _1877 = fma(_1835, _1867, _1811);
    float _1879 = _1811;
    float _1881 = _1877;
    float _1883 = _1791;
    float _1885 = _1839;
    float _1887 = _1867;
    float _1889 = _1819;
    float _1891 = _1817;
    float _1893 = _1605;
    if (!_1849)
    {
        _1879 = _1813;
    }
    float _1895 = _1879;
    bool _1897 = !_1853;
    int _1899 = _1897 ? 0 : 1;
    float _1901 = _1201 + _1877;
    float _1903 = _1895;
    if (!_1849)
    {
        _1881 = _1819;
    }
    float _1905 = _1881;
    bool _1907 = !_1865;
    int _1909 = _1907 ? 0 : 1;
    float _1911 = _1905;
    if (!_1849)
    {
        _1883 = _1809;
    }
    float _1913 = _1883;
    float _1915 = _1913;
    if (!_1849)
    {
        _1885 = _1807;
    }
    float _1917 = _1885;
    float _1919 = _1917;
    if (!_1849)
    {
        _1887 = _1815;
    }
    float _1921 = _1887;
    float _1923 = _1921;
    if (!_1849)
    {
        _1889 = _1901;
    }
    float _1925 = _1889;
    bool _1927 = !_1849;
    float _1929 = _1925;
    if (!_1927)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1935 = _1841 + _1933;
        float _1937 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1939 = rsqrt(_1837);
        float _1941 = _1935 * _1931;
        float _1943 = _1941 * 0.15915493667125701904296875;
        float _1945 = _1943 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        float _1949 = _1943 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = fma(_1947, _1937, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1955 = _1939 * _1953;
        float _1957 = _1951 + (-1.0);
        float _1959 = fma(_1829, _1955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1961 = fma(_1825, _1955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1963 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1965 = -_1007;
        float _1967 = _1965 + _1959;
        float _1969 = -_1209;
        float _1971 = _1969 + _1961;
        float _1973 = fma(_1901, _1951, _1963);
        float _1975 = _1967 * _1967;
        float _1977 = _1971 * _1971;
        _1929 = _1973;
        _1911 = _1959;
        _1903 = _1975;
        _1891 = _1977;
        _1923 = _1961;
        _1919 = _1967;
        _1915 = _1971;
    }
    float _1979 = _1929;
    float _1981 = _1911;
    float _1983 = _1903;
    float _1985 = _1891;
    float _1987 = _1923;
    float _1989 = _1919;
    float _1991 = _1915;
    float _1993 = -_1201;
    float _1995 = _1993 + _1979;
    float _1997 = -_1605;
    float _1999 = _1201 + _1997;
    float _2001 = -_1613;
    float _2003 = _1007 + _2001;
    float _2005 = -_1613;
    float _2007 = _2005 + _1981;
    float _2009 = fma(_1995, _1995, _1983);
    float _2011 = _1999 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2013 = -_1623;
    float _2015 = _1209 + _2013;
    float _2017 = -_1605;
    float _2019 = _2017 + _1979;
    float _2021 = _2009 + _1985;
    float _2023 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2011);
    float _2025 = _1999 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2027 = -_1623;
    float _2029 = _2027 + _1987;
    float _2031 = sqrt(_2021);
    float _2033 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2023);
    float _2035 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2025);
    bool _2037 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2039 = isnan(0.5);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2045 = _2041 || _2043;
    float _2047 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2049 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2035);
    bool _2051 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2053 = isnan(0.5);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2059 = _2055 || _2057;
    float _2061 = 1.0 / _2047;
    float _2063 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2065 = _2063 + _2047;
    bool _2067 = _2031 > 0.0;
    float _2069 = _2065 * _2061;
    float _2071 = _2069 * 0.5;
    float _2073 = _2031;
    float _2075 = _2033;
    float _2077 = _2019;
    float _2079 = _1989;
    float _2081 = _1981;
    if (!_2067)
    {
        _2073 = _2007;
    }
    float _2083 = _2073;
    float _2085 = _2083;
    if (!_2067)
    {
        _2075 = _2029;
    }
    float _2087 = _2075;
    bool _2089 = !_2067;
    float _2091 = _2087;
    if (!_2089)
    {
        float _2093 = _199 * _199;
        float _2095 = fma(_197, _197, _2093);
        float _2097 = fma(_201, _201, _2095);
        float _2099 = rsqrt(_2021);
        float _2101 = sqrt(_2097);
        float _2103 = _1995 * _2099;
        float _2105 = _2099 * _1989;
        float _2107 = _2099 * _1991;
        bool _2109 = _2101 > 0.0;
        float _2111 = _2101;
        float _2113 = _2099;
        _1893 = _2103;
        if (!_2109)
        {
            _2111 = _2007;
        }
        float _2115 = _2111;
        _2085 = _2115;
        if (!_2109)
        {
            _2113 = _2029;
        }
        float _2117 = _2113;
        bool _2119 = !_2109;
        _2091 = _2117;
        if (!_2119)
        {
            float _2121 = rsqrt(_2097);
            float _2123 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2125 = _199 * _2121;
            float _2127 = _197 * _2121;
            float _2129 = _2103 * _2125;
            float _2131 = _201 * _2121;
            float _2133 = fma(_2105, _2127, _2129);
            float _2135 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2137 = fma(_2107, _2131, _2133);
            float _2139 = _2137 * _2135;
            float _2141 = fma(_197, _2139, _2007);
            float _2143 = fma(_199, _2139, _2019);
            float _2145 = fma(_201, _2139, _2029);
            _2085 = _2141;
            _2077 = _2143;
            _2091 = _2145;
            _2079 = _2123;
            _1893 = _2139;
        }
    }
    float _2147 = _2085;
    float _2149 = _2077;
    float _2151 = _2091;
    float _2153 = _2079;
    float _2155 = _1893;
    float _2157 = _2153;
    float _2159 = _2155;
    if (_2059)
    {
        _2081 = 1.0;
    }
    float _2161 = _2081;
    float _2163 = _2161;
    if (_2045)
    {
        _205 = _2147;
    }
    float _2165 = _205;
    float _2167 = _2165;
    if (_2045)
    {
        _207 = _2149;
    }
    float _2169 = _207;
    float _2171 = _2169;
    if (_2045)
    {
        _209 = _2151;
    }
    float _2173 = _209;
    float _2175 = _2173;
    if (!_2045)
    {
        float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2179 = _1999 + _2177;
        float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2183 = _2003 + _2181;
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2187 = -_2003;
        float _2189 = _2187 + _2147;
        float _2191 = _2179 * _2179;
        float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2195 = _2015 + _2193;
        float _2197 = -_1999;
        float _2199 = _2197 + _2149;
        float _2201 = -_2015;
        float _2203 = _2201 + _2151;
        float _2205 = fma(_2183, _2183, _2191);
        float _2207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2209 = fma(_2195, _2195, _2205);
        float _2211 = sqrt(_2209);
        float _2213 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2215 = precise::min(_2211, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2217 = _2215 * _2207;
        float _2219 = _2213 * _2217;
        float _2221 = fma(_2189, _2219, _2003);
        float _2223 = fma(_2199, _2219, _1999);
        float _2225 = fma(_2203, _2219, _2015);
        _2157 = _2191;
        _2171 = _2223;
        _2167 = _2221;
        _2175 = _2225;
        _2159 = _2207;
    }
    float _2227 = _2157;
    float _2229 = _2171;
    float _2231 = _2167;
    float _2233 = _2175;
    float _2235 = _2159;
    float _2237 = _2235;
    float _2239 = _2227;
    if (!_2059)
    {
        float _2241 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2243 = _2241 * 0.15915493667125701904296875;
        float _2245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2247 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2249 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2247);
        float _2251 = _2243 * 6.283185482025146484375;
        float _2253 = cos(_2251);
        float _2255 = _2245 * 0.15915493667125701904296875;
        float _2257 = _2243 * 6.283185482025146484375;
        float _2259 = sin(_2257);
        float _2261 = 1.0 / _2253;
        float _2263 = _2255 * 6.283185482025146484375;
        float _2265 = cos(_2263);
        float _2267 = _2259 * _2261;
        float _2269 = _2255 * 6.283185482025146484375;
        float _2271 = sin(_2269);
        float _2273 = _2265 * _2267;
        float _2275 = 1.0 / _2249;
        float _2277 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2279 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2277;
        float _2281 = 1.0 / _2273;
        float _2283 = 1.0 / _2279;
        float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2287 = _2275 * _2285;
        float _2289 = _2271 * _2281;
        float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2293 = fma(_2289, _2287, _2291);
        float _2295 = _2293 * _2283;
        float _2297 = precise::clamp(_2295, 0.0, 1.0);
        _2237 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _2239 = _2279;
        _2163 = _2297;
    }
    float _2299 = _2237;
    float _2301 = _2239;
    float _2303 = _2163;
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2307 = _2229 + _2305;
    float _2309 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2311 = _2231 + _2309;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2315 = _2233 + _2313;
    float _2317 = _2307 * _2307;
    float _2319 = fma(_2311, _2311, _2317);
    float _2321 = fma(_2315, _2315, _2319);
    float _2323 = rsqrt(_2321);
    float _2325 = sqrt(_2321);
    float _2327 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2329 = _2311 * _2327;
    float _2331 = _2315 * _2327;
    float _2333 = _2329 * _2329;
    float _2335 = _2331 * _2331;
    float _2337 = _2333 + _2335;
    float _2339 = sqrt(_2337);
    bool _2341 = _2339 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2345 = _2339 + _2343;
    float _2347 = _2323;
    float _2349 = _2337;
    float _2351 = _2345;
    float _2353 = _2299;
    float _2355 = _2327;
    if (_2341)
    {
        float _2357 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2347 = _2357;
    }
    float _2359 = _2347;
    if (_2341)
    {
        float _2361 = rsqrt(_2337);
        _2349 = _2361;
    }
    float _2363 = _2349;
    if (_2341)
    {
        float _2365 = _2345 * _2359;
        _2351 = _2365;
    }
    float _2367 = _2351;
    if (_2341)
    {
        float _2369 = _2367 * 0.15915493667125701904296875;
        _2353 = _2369;
    }
    float _2371 = _2353;
    float _2373 = _2315;
    float _2375 = _2371;
    if (_2341)
    {
        float _2377 = _2371 * 6.283185482025146484375;
        float _2379 = sin(_2377);
        _2373 = _2379;
    }
    float _2381 = _2373;
    float _2383 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2385 = precise::max(0.0, _2383);
    float _2387 = _2301;
    float _2389 = _2385;
    float _2391 = _2383;
    if (_2341)
    {
        float _2393 = _2371 * 6.283185482025146484375;
        float _2395 = cos(_2393);
        _2387 = _2395;
    }
    float _2397 = _2387;
    float _2399 = -_2327;
    float _2401 = -_2385;
    float _2403 = fma(_2307, _2399, _2401);
    float _2405 = _2403;
    if (_2341)
    {
        float _2407 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2389 = _2407;
    }
    float _2409 = _2389;
    float _2411 = _2409;
    float _2413 = _2381;
    if (_2341)
    {
        float _2415 = fma(_2381, _2409, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2411 = _2415;
    }
    float _2417 = _2411;
    float _2419 = _2417;
    if (!_2341)
    {
        _2413 = _2329;
    }
    float _2421 = _2413;
    float _2423 = _2421;
    float _2425 = _2397;
    if (_2341)
    {
        float _2427 = _2397 + (-1.0);
        _2391 = _2427;
    }
    float _2429 = _2391;
    float _2431 = _2429;
    if (_2341)
    {
        float _2433 = _2363 * _2417;
        _2355 = _2433;
    }
    float _2435 = _2355;
    if (!_2341)
    {
        _2419 = _2333;
    }
    float _2437 = _2419;
    float _2439 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2441 = _2437;
    if (_2341)
    {
        float _2443 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2375 = _2443;
    }
    float _2445 = _2375;
    if (_2341)
    {
        float _2447 = _2329 * _2435;
        _2423 = _2447;
    }
    float _2449 = _2423;
    if (!_2341)
    {
        _2431 = _2331;
    }
    float _2451 = _2431;
    float _2453 = _2451;
    if (_2341)
    {
        float _2455 = _2331 * _2435;
        _2453 = _2455;
    }
    float _2457 = _2453;
    if (_2341)
    {
        float _2459 = fma(_2403, _2397, _2445);
        _2405 = _2459;
    }
    float _2461 = _2405;
    if (_2341)
    {
        float _2463 = _2449 * _2449;
        _2441 = _2463;
    }
    float _2465 = _2441;
    if (!_2341)
    {
        _2425 = _2335;
    }
    float _2467 = _2425;
    float _2469 = _2467;
    if (_2341)
    {
        float _2471 = _2457 * _2457;
        _2469 = _2471;
    }
    float _2473 = _2469;
    float _2475 = fma(_2461, _2461, _2465);
    float _2477 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2479 = _2475 + _2473;
    float _2481 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2439);
    float _2483 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2487 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2485);
    float _2489 = precise::clamp(_2487, 0.0, 1.0);
    float _2491 = rsqrt(_2479);
    float _2493 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2481);
    float _2495 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2483);
    float _2497 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2499 = -_2489;
    float _2501 = _2499 + 1.0;
    float _2503 = _2493 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2505 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2495);
    float _2507 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2497);
    float _2509 = abs(_2501);
    float _2511 = log2(_2509);
    float _2513 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2515 = _2505 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2517 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2519 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2507);
    float _2521 = -_2513;
    float _2523 = fma(_2521, _2477, 1.0);
    float _2525 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2527 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2517);
    float _2529 = _2491 * _2449;
    float _2531 = _2491 * _2461;
    float _2533 = _2519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2535 = _2491 * _2457;
    float _2537 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2539 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2527);
    float _2541 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2525);
    float _2543 = log2(_2523);
    float _2545 = -_2537;
    float _2547 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2545);
    float _2549 = _2539 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2551 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2541);
    float _2553 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2555 = -_2535;
    float _2557 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2547);
    float _2559 = _2531 + 1.0;
    float _2561 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2551);
    float _2563 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2565 = fma(_2557, -0.5, 0.5);
    float _2567 = exp2(_2553);
    float _2569 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2571 = fma(_2557, 0.5, 0.5);
    float _2573 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2563);
    float _2575 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2569);
    float _2577 = fma(_2571, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2579 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2573);
    float _2581 = 1.0 / _2561;
    float _2583 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2575);
    float _2585 = fma(_2571, _2577, -0.212114393711090087890625);
    float _2587 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2579);
    float _2589 = _2543 * 0.693147182464599609375;
    float _2591 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2583);
    float _2593 = fma(_2571, _2585, 1.570728778839111328125);
    float _2595 = sqrt(_2565);
    float _2597 = -_2531;
    float _2599 = fma(_2567, _2559, _2597);
    float _2601 = _2589 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2603 = fma(_2599, 0.5, 0.5);
    float _2605 = _2587 * _2581;
    float _2607 = _2591 * _2581;
    float _2609 = fma(_2605, 0.5, 0.5);
    float _2611 = fma(_2607, -0.5, 0.5);
    float _2613 = _2595 * 0.636619746685028076171875;
    float _2615 = -_2593;
    float _2617 = fma(_2613, _2615, 1.0);
    float3 _8163 = float3(_2609, _2611, _2601);
    float _2619 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8163, float3(0.0), isnan(_8163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8163, float3(0.0), isnan(_8163)), level(0.0)).x;
    float3 _8174 = float3(_2609, _2611, _2601);
    float4 _2622 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8174, float3(0.0), isnan(_8174)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8174, float3(0.0), isnan(_8174)), level(0.0)).xyzw;
    float _2624 = _2622.x;
    float _2626 = _2622.y;
    float _2628 = _2622.z;
    float _2630 = _2622.w;
    float2 _8191 = float2(_2617, _2603);
    float3 _2634 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8191, float2(0.0), isnan(_8191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8191, float2(0.0), isnan(_8191)), level(0.0)).xyz;
    float _2636 = _2634.x;
    float _2638 = _2634.y;
    float _2640 = _2634.z;
    float _2642 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2644 = int(_2642);
    int _2646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2648 = _2646 != 0;
    out.m_62.x = _619;
    out.m_62.y = _621;
    out.m_62.z = _623;
    out.m_62.w = _635;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2652 = _2650 != 0;
    float _2654 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2656 = abs(_1237);
    out.m_64.x = _837;
    out.m_64.y = _839;
    out.m_64.z = _841;
    out.m_64.w = _853;
    int _2658 = abs(_1871);
    float _2660 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2662 = int(_2660);
    int _2664 = abs(_1243);
    out.m_66.w = _1551;
    int _2666 = abs(_1875);
    float _2668 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2670 = _891 > 0.5;
    out.m_68.x = _2003;
    out.m_68.y = _1999;
    out.m_68.z = _2015;
    float _2672 = -_1315;
    float _2674 = _2672 + 1.0;
    float _2676 = float(uint(_2644));
    float _2678 = trunc(_1405);
    int _2680 = int(_2678);
    float _2682 = trunc(_1455);
    int _2684 = int(_2682);
    float _2686 = float(uint(_2662));
    float _2688 = _2601;
    if (_2648)
    {
        float _2690 = in.m_56.x;
        _2688 = _2690;
    }
    float _2692 = _2688;
    int _2694 = ~_2662;
    int _2696 = _2694 + 1;
    float _2698 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2668);
    int _2700 = ~_2644;
    int _2702 = _2700 + 1;
    float _2704 = _2692;
    if (!_2648)
    {
        float _2706 = in.m_56.y;
        _2704 = _2706;
    }
    float _2708 = _2704;
    int _2710 = ~_2662;
    int _2712 = _2710 + 1;
    float _2714 = 1.0 / _2676;
    float _2716 = float(uint(_2680));
    out.m_70.x = _2231;
    out.m_70.y = _2229;
    out.m_70.z = _2233;
    bool _2718 = _2644 == 0;
    float _2720 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2698);
    float _2722 = -_1463;
    float _2724 = _2722 + 1.0;
    out.m_72.x = _1707;
    float _2726 = 1.0 / _2686;
    float _2728 = float(uint(_2684));
    int _2730 = as_type<int>(_2714) + (-2);
    float _2732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2734 = _2714;
    if (_2648)
    {
        _2734 = 1.0;
    }
    float _2736 = _2734;
    float _2738 = _2736;
    if (!_2648)
    {
        _2738 = 7.345489978790283203125;
    }
    float _2740 = _2738;
    float _2742 = as_type<float>(_2730) * _2716;
    int _2744 = as_type<int>(_2726) + (-2);
    float _2746 = trunc(_2742);
    float _2748 = precise::max(_2746, 0.0);
    uint _2751 = uint(_2748);
    int _2753 = ~_2644;
    int _2755 = _2753 + 1;
    float _2757 = as_type<float>(_2744) * _2728;
    float _2759 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2761 = _2740 * _885;
    float _2763 = trunc(_2757);
    float _2765 = precise::max(_2763, 0.0);
    uint _2767 = uint(_2765);
    int _2769 = _2755 * int(_2751);
    int _2771 = _2769 + _2680;
    float _2773 = floor(_2761);
    float _2775 = float(uint(_2771));
    int _2777 = _2696 * int(_2767);
    int _2779 = _2777 + _2684;
    float _2781 = as_type<float>(_2730) * _2775;
    float _2783 = exp2(_2654);
    float _2785 = float(uint(_2779));
    float _2787 = as_type<float>(_2779);
    if (_2648)
    {
        _2787 = 1.0;
    }
    float _2789 = _2787;
    float _2791 = -_2773;
    float _2793 = _2761 + _2791;
    float _2795 = _2789;
    if (!_2648)
    {
        _2795 = 1.2345600128173828125;
    }
    float _2797 = _2795;
    float _2799 = as_type<float>(_2744) * _2785;
    float _2801 = trunc(_2781);
    float _2803 = precise::max(_2801, 0.0);
    uint _2805 = uint(_2803);
    float _2807 = _2708 * _2797;
    float _2809 = float(_2644);
    float _2811 = float(_2680);
    float _2813 = -_2783;
    float _2815 = _2813 + 1.0;
    float _2817 = trunc(_2799);
    float _2819 = precise::max(_2817, 0.0);
    uint _2821 = uint(_2819);
    float _2823 = float(_2684);
    bool _2825 = _2811 >= _2809;
    bool _2827 = isnan(_2811);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(_2809);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    float _2837 = floor(_2807);
    int _2839 = int(_2751) + int(_2805);
    float _2841 = float(_2662);
    int _2843 = _2702 * _2839;
    int _2845 = _2843 + _2680;
    int _2847 = int(_2767) + int(_2821);
    float _2849 = trunc(_2835);
    int _2851 = int(_2849);
    bool _2853 = _2823 >= _2841;
    bool _2855 = isnan(_2823);
    bool _2857 = _2853 || _2855;
    bool _2859 = isnan(_2841);
    bool _2861 = _2857 || _2859;
    float _2863 = float(_2861);
    bool _2865 = uint(_2845) >= uint(_2644);
    int _2867 = _2712 * _2847;
    int _2869 = _2867 + _2684;
    float _2871 = -_2837;
    float _2873 = _2807 + _2871;
    float _2875 = _2793 * _2809;
    bool _2877 = !_2865;
    int _2879 = _2877 ? 0 : (-1);
    float _2881 = trunc(_2863);
    int _2883 = int(_2881);
    bool _2885 = uint(_2869) >= uint(_2662);
    float _2887 = _2873 * _2841;
    float _2889 = _2809 * _1415;
    int _2891 = ~_2839;
    int _2893 = _2891 + _2879;
    int _2895 = _2893 + 1;
    float _2897 = _2841 * _1415;
    bool _2899 = !_2885;
    int _2901 = _2899 ? 0 : (-1);
    float _2903 = trunc(_2875);
    int _2905 = int(_2903);
    int _2907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2909 = _2907 != 0;
    int _2911 = ~_2847;
    int _2913 = _2911 + _2901;
    int _2915 = _2913 + 1;
    bool _2917 = !_2909;
    int _2919 = _2917 ? 0 : 1;
    int _2921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2923 = _2921 != 0;
    float _2925 = trunc(_2887);
    int _2927 = int(_2925);
    int _2929 = abs(_2919);
    int _2931 = _2644 * _2895;
    int _2933 = _2931 + _2680;
    bool _2935 = !_2923;
    int _2937 = _2935 ? 0 : 1;
    int _2939 = _2662 * _2915;
    int _2941 = _2939 + _2684;
    int _2943 = ~_2851;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    bool _2949 = !_2718;
    int _2951 = _2949 ? _2933 : (-1);
    float _2953 = trunc(_2889);
    int _2955 = int(_2953);
    bool _2957 = _2662 == 0;
    int _2959 = abs(_2937);
    int _2961 = _2951 * _2947;
    int _2963 = ~_2883;
    int _2965 = _2963 + 1;
    int _2967 = _2965 + 1;
    int _2969 = _2905 * _2959;
    int _2971 = _2969 + _2680;
    bool _2973 = !_2957;
    int _2975 = _2973 ? _2941 : (-1);
    int _2977 = _2927 * _2929;
    int _2979 = _2977 + _2684;
    int _2981 = abs(_1233);
    float _2983 = trunc(_2897);
    int _2985 = int(_2983);
    int _2987 = _2644 + (-1);
    int _2989 = _2975 * _2967;
    int _2991 = _2662 + (-1);
    int _2993 = _2851 * _2987;
    int _2995 = _2993 + _2961;
    int _2997 = abs(_1899);
    int _2999 = _2883 * _2991;
    int _3001 = _2999 + _2989;
    int _3003 = _2995 * _2981;
    bool _3005 = !_2652;
    int _3007 = _3005 ? 0 : 1;
    int _3009 = _3001 * _2658;
    int _3011 = _2955 * _2656;
    int _3013 = _3011 + _3003;
    int _3015 = abs(_3007);
    int _3017 = _2985 * _2997;
    int _3019 = _3017 + _3009;
    int _3021 = abs(_1909);
    int _3023 = _2971 * _2664;
    int _3025 = _3023 + _3013;
    int _3027 = ~_2662;
    int _3029 = _3027 + 1;
    int _3031 = _2979 * _2666;
    int _3033 = _3031 + _3019;
    int _3035 = _2905 * _3015;
    int _3037 = _3035 + _3025;
    int _3039 = ~_2644;
    int _3041 = _3039 + 1;
    int _3043 = _2927 * _3021;
    int _3045 = _3043 + _3033;
    int _3047 = ~_2644;
    int _3049 = _3047 + 1;
    float _3051 = float(uint(_3037));
    float _3053 = float(uint(_3045));
    float _3055 = as_type<float>(_2730) * _3051;
    float _3057 = float(uint(_2971));
    float _3059 = as_type<float>(_2744) * _3053;
    float _3061 = float(uint(_2979));
    float _3063 = trunc(_3055);
    float _3065 = precise::max(_3063, 0.0);
    uint _3067 = uint(_3065);
    float _3069 = as_type<float>(_2730) * _3057;
    float _3071 = as_type<float>(_2744) * _3061;
    float _3073 = trunc(_3059);
    float _3075 = precise::max(_3073, 0.0);
    uint _3077 = uint(_3075);
    float _3079 = trunc(_3069);
    float _3081 = precise::max(_3079, 0.0);
    uint _3083 = uint(_3081);
    int _3085 = _3041 * int(_3067);
    int _3087 = _3085 + _3037;
    float _3089 = float(uint(_3087));
    int _3091 = _3029 * int(_3077);
    int _3093 = _3091 + _3045;
    float _3095 = trunc(_3071);
    float _3097 = precise::max(_3095, 0.0);
    uint _3099 = uint(_3097);
    float _3101 = as_type<float>(_2730) * _3089;
    float _3103 = float(uint(_3093));
    int _3105 = _3049 * int(_3083);
    int _3107 = _3105 + _2971;
    float _3109 = trunc(_3101);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = as_type<float>(_2744) * _3103;
    int _3117 = ~_2644;
    int _3119 = _3117 + 1;
    float _3121 = float(uint(_3107));
    int _3123 = ~_2662;
    int _3125 = _3123 + 1;
    float _3127 = trunc(_3115);
    float _3129 = precise::max(_3127, 0.0);
    uint _3131 = uint(_3129);
    float _3133 = as_type<float>(_2730) * _3121;
    int _3135 = _3125 * int(_3099);
    int _3137 = _3135 + _2979;
    int _3139 = int(_3067) + int(_3113);
    float _3141 = trunc(_3133);
    float _3143 = precise::max(_3141, 0.0);
    uint _3145 = uint(_3143);
    float _3147 = float(uint(_3137));
    int _3149 = ~_2662;
    int _3151 = _3149 + 1;
    int _3153 = _3119 * _3139;
    int _3155 = _3153 + _3037;
    int _3157 = int(_3077) + int(_3131);
    float _3159 = as_type<float>(_2744) * _3147;
    int _3161 = ~_2644;
    int _3163 = _3161 + 1;
    bool _3165 = uint(_3155) >= uint(_2644);
    int _3167 = _3151 * _3157;
    int _3169 = _3167 + _3045;
    float _3171 = trunc(_3159);
    float _3173 = precise::max(_3171, 0.0);
    uint _3175 = uint(_3173);
    bool _3177 = !_3165;
    int _3179 = _3177 ? 0 : (-1);
    int _3181 = int(_3083) + int(_3145);
    int _3183 = ~_3139;
    int _3185 = _3183 + _3179;
    int _3187 = _3185 + 1;
    bool _3189 = uint(_3169) >= uint(_2662);
    int _3191 = _3163 * _3181;
    int _3193 = _3191 + _2971;
    int _3195 = _2644 * _3187;
    int _3197 = _3195 + _3037;
    bool _3199 = !_3189;
    int _3201 = _3199 ? 0 : (-1);
    bool _3203 = uint(_3193) >= uint(_2644);
    int _3205 = ~_2662;
    int _3207 = _3205 + 1;
    int _3209 = ~_3157;
    int _3211 = _3209 + _3201;
    int _3213 = _3211 + 1;
    bool _3215 = !_2718;
    int _3217 = _3215 ? _3197 : (-1);
    int _3219 = int(_3099) + int(_3175);
    int _3221 = _2662 * _3213;
    int _3223 = _3221 + _3045;
    int _3225 = _3217 & 3;
    bool _3227 = _3225 != 0;
    bool _3229 = !_3203;
    int _3231 = _3229 ? 0 : (-1);
    int _3233 = _3207 * _3219;
    int _3235 = _3233 + _2979;
    bool _3237 = uint(_3225) >= 2u;
    bool _3239 = !_2957;
    int _3241 = _3239 ? _3223 : (-1);
    int _3243 = _3237 ? 0 : 1;
    bool _3245 = uint(_3235) >= uint(_2662);
    int _3247 = _3241 >> 31;
    bool _3249 = uint(_3225) > 1u;
    int _3251 = _3217 >> 31;
    int _3253 = _3247 & 3;
    int _3255 = _3217 & 3;
    bool _3257 = _3255 != 0;
    int _3259 = _3251 & 3;
    int _3261 = _3241 + _3253;
    int _3263 = _3257 ? 0 : 1;
    int _3265 = _3217 + _3259;
    int _3267 = ~_3181;
    int _3269 = _3267 + _3231;
    int _3271 = _3269 + 1;
    bool _3273 = _3225 != 3;
    int _3275 = _3261 >> 2;
    int _3277 = _2644 * _3271;
    int _3279 = _3277 + _2971;
    int _3281 = ~_3263;
    int _3283 = _3281 + 1;
    int _3285 = _3283 + 1;
    int _3287 = _3265 >> 2;
    int _3289 = _3285;
    if (!_3249)
    {
        int _3291 = ~_3263;
        int _3293 = _3291 + 1;
        _3289 = _3293;
    }
    int _3295 = _3289;
    int _3297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3299 = _3297 != 0;
    float _3301 = -_195;
    int _3303 = _2670 ? as_type<int>(_3301) : as_type<int>(_195);
    int _3305 = _3275 << 4;
    int _3307 = _3305 + 512;
    int _3309 = _3241 & 3;
    bool _3311 = _3309 != 0;
    int _3313 = _3287 << 4;
    int _3315 = _3313 + 368;
    bool _3317 = !_3227;
    int _3319 = _3317 ? 0 : 1;
    int _3321 = _3241 & 3;
    bool _3323 = _3321 != 0;
    uint _3325 = uint(int(uint(_3315) >> uint(2)));
    uint _3327 = uint(int(uint(int(_3325)) >> uint(2)));
    int _3329 = int(_3325) & 3;
    float _3331 = (*spvDescriptorSet0.vp_c9)._m0[int(_3327)][_3329];
    int _3333 = int(_3325) + 1;
    uint _3335 = uint(int(uint(_3333) >> uint(2)));
    int _3337 = _3333 & 3;
    float _3339 = (*spvDescriptorSet0.vp_c9)._m0[int(_3335)][_3337];
    bool _3341 = !_3299;
    int _3343 = _3341 ? 0 : 1;
    bool _3345 = uint(_3309) > 1u;
    int _3347 = ~_3243;
    int _3349 = _3347 + 1;
    int _3351 = _3349 + 1;
    int _3353 = _3351;
    if (_3273)
    {
        int _3355 = ~_3243;
        int _3357 = _3355 + 1;
        _3353 = _3357;
    }
    int _3359 = _3353;
    uint _3361 = uint(int(uint(_3307) >> uint(2)));
    uint _3363 = uint(int(uint(int(_3361)) >> uint(2)));
    int _3365 = int(_3361) & 3;
    float _3367 = (*spvDescriptorSet0.vp_c9)._m0[int(_3363)][_3365];
    int _3369 = int(_3361) + 1;
    uint _3371 = uint(int(uint(_3369) >> uint(2)));
    int _3373 = _3369 & 3;
    float _3375 = (*spvDescriptorSet0.vp_c9)._m0[int(_3371)][_3373];
    int _3377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3379 = _3377 != 0;
    bool _3381 = !_3245;
    int _3383 = _3381 ? 0 : (-1);
    bool _3385 = !_2718;
    int _3387 = _3385 ? _3279 : (-1);
    bool _3389 = !_3379;
    int _3391 = _3389 ? 0 : 1;
    bool _3393 = !_3311;
    int _3395 = _3393 ? 0 : 1;
    int _3397 = _3323 ? 0 : 1;
    int _3399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3401 = _3399 != 0;
    int _3403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3405 = _3403 != 0;
    int _3407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3409 = _3407 != 0;
    int _3411 = ~_3219;
    int _3413 = _3411 + _3383;
    int _3415 = _3413 + 1;
    int _3417 = _3307 + 8;
    uint _3419 = uint(int(uint(_3417) >> uint(2)));
    uint _3421 = uint(int(uint(int(_3419)) >> uint(2)));
    int _3423 = int(_3419) & 3;
    float _3425 = (*spvDescriptorSet0.vp_c9)._m0[int(_3421)][_3423];
    int _3427 = int(_3419) + 1;
    uint _3429 = uint(int(uint(_3427) >> uint(2)));
    int _3431 = _3427 & 3;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[int(_3429)][_3431];
    int _3435 = ~_3397;
    int _3437 = _3435 + 1;
    int _3439 = _3437 + 1;
    bool _3441 = _3225 != 3;
    int _3443 = _3439;
    if (!_3345)
    {
        int _3445 = ~_3397;
        int _3447 = _3445 + 1;
        _3443 = _3447;
    }
    int _3449 = _3443;
    bool _3451 = _3309 != 3;
    int _3453 = _3315 + 8;
    uint _3455 = uint(int(uint(_3453) >> uint(2)));
    uint _3457 = uint(int(uint(int(_3455)) >> uint(2)));
    int _3459 = int(_3455) & 3;
    float _3461 = (*spvDescriptorSet0.vp_c9)._m0[int(_3457)][_3459];
    int _3463 = int(_3455) + 1;
    uint _3465 = uint(int(uint(_3463) >> uint(2)));
    int _3467 = _3463 & 3;
    float _3469 = (*spvDescriptorSet0.vp_c9)._m0[int(_3465)][_3467];
    bool _3471 = !_3441;
    int _3473 = _3471 ? 0 : (-1);
    bool _3475 = uint(_3309) >= 2u;
    bool _3477 = _885 > 0.5;
    int _3479 = _2662 * _3415;
    int _3481 = _3479 + _2979;
    int _3483 = _3475 ? 0 : 1;
    float _3485 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3487 = _3309 != 3;
    int _3489 = ~_3483;
    int _3491 = _3489 + 1;
    int _3493 = _3491 + 1;
    float _3495 = -_1729;
    float _3497 = fma(_3495, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3485);
    int _3499 = _3493;
    if (_3451)
    {
        int _3501 = ~_3483;
        int _3503 = _3501 + 1;
        _3499 = _3503;
    }
    int _3505 = _3499;
    bool _3507 = _887 > 0.5;
    float _3509 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3511 = int(_3509);
    bool _3513 = !_2957;
    int _3515 = _3513 ? _3481 : (-1);
    bool _3517 = _889 > 0.5;
    int _3519 = abs(_3449);
    bool _3521 = !_3487;
    int _3523 = _3521 ? 0 : (-1);
    int _3525 = abs(_3295);
    float _3527 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3529 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3531 = _3529 != 0;
    float _3533 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3535 = abs(_3395);
    int _3537 = ~_3519;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    float _3543 = -_1729;
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3527);
    int _3547 = ~_3525;
    int _3549 = _3547 + 1;
    int _3551 = _3549 + 1;
    float _3553 = -_1729;
    float _3555 = fma(_3553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3533);
    int _3557 = abs(_3319);
    int _3559 = _3541 * as_type<int>(_3375);
    int _3561 = abs(_3359);
    int _3563 = _3551 * as_type<int>(_3339);
    float _3565 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3567 = int(_3565);
    int _3569 = abs(_3505);
    int _3571 = ~_3535;
    int _3573 = _3571 + 1;
    int _3575 = _3573 + 1;
    int _3577 = ~_3557;
    int _3579 = _3577 + 1;
    int _3581 = _3579 + 1;
    int _3583 = ~_3569;
    int _3585 = _3583 + 1;
    int _3587 = _3585 + 1;
    int _3589 = _3575 * as_type<int>(_3367);
    int _3591 = _3589 + _3559;
    int _3593 = ~_3561;
    int _3595 = _3593 + 1;
    int _3597 = _3595 + 1;
    int _3599 = _3581 * as_type<int>(_3331);
    int _3601 = _3599 + _3563;
    float _3603 = float(uint(_3511));
    int _3605 = _3587 * as_type<int>(_3425);
    int _3607 = _3605 + _3591;
    int _3609 = abs(_3473);
    int _3611 = _3597 * as_type<int>(_3461);
    int _3613 = _3611 + _3601;
    int _3615 = abs(_3523);
    float _3617 = 1.0 / _3603;
    int _3619 = ~_3609;
    int _3621 = _3619 + 1;
    int _3623 = _3621 + 1;
    int _3625 = ~_3615;
    int _3627 = _3625 + 1;
    int _3629 = _3627 + 1;
    int _3631 = abs(_3343);
    int _3633 = _3623 * as_type<int>(_3469);
    int _3635 = _3633 + _3613;
    int _3637 = abs(_3511);
    int _3639 = _3629 * as_type<int>(_3433);
    int _3641 = _3639 + _3607;
    float _3643 = float(uint(_3567));
    float _3645 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3497);
    int _3647 = abs(_3391);
    float _3649 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3555);
    float _3651 = 1.0 / _3643;
    int _3653 = ~_3631;
    int _3655 = _3653 + 1;
    int _3657 = _3655 + 1;
    float _3659 = float(uint(_3637));
    int _3661 = ~_3647;
    int _3663 = _3661 + 1;
    int _3665 = _3663 + 1;
    int _3667 = _3635 * _3657;
    float _3669 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3545);
    float _3671 = 1.0 / _3659;
    int _3673 = as_type<int>(_3617) + (-2);
    int _3675 = _3641 * _3665;
    float _3677 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3679 = _3387 * _3631;
    int _3681 = _3679 + _3667;
    float _3683 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3685 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3687 = _3515 * _3647;
    int _3689 = _3687 + _3675;
    int _3691 = abs(_3567);
    float _3693 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3677);
    float _3695 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3683);
    float _3697 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3685);
    float _3699 = -_195;
    int _3701 = _3507 ? as_type<int>(_3699) : as_type<int>(_195);
    float _3703 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3705 = float(uint(_3691));
    int _3707 = as_type<int>(_3651) + (-2);
    int _3709 = abs(_3681);
    float _3711 = float(uint(_3689));
    float _3713 = 1.0 / _3705;
    bool _3715 = !_3405;
    float _3717 = _3715 ? _195 : as_type<float>(_3701);
    int _3719 = as_type<int>(_3671) + (-2);
    float _3721 = as_type<float>(_3707) * _3711;
    float _3723 = float(uint(_3709));
    float _3725 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3727 = float(uint(_3681));
    float _3729 = trunc(_3721);
    float _3731 = precise::max(_3729, 0.0);
    uint _3733 = uint(_3731);
    bool _3735 = !_3401;
    float _3737 = _3735 ? _195 : as_type<float>(_3303);
    float _3739 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3741 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3743 = as_type<float>(_3719) * _3723;
    float _3745 = as_type<float>(_3673) * _3727;
    int _3747 = ~_3511;
    int _3749 = _3747 + 1;
    float _3751 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3703);
    float _3753 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3739);
    float _3755 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3741);
    int _3757 = ~_3567;
    int _3759 = _3757 + 1;
    float _3761 = trunc(_3743);
    float _3763 = precise::max(_3761, 0.0);
    uint _3765 = uint(_3763);
    int _3767 = abs(_3689);
    float _3769 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3751);
    float _3771 = fma(_3725, _3725, 1.0);
    float _3773 = trunc(_3745);
    float _3775 = precise::max(_3773, 0.0);
    uint _3777 = uint(_3775);
    int _3779 = as_type<int>(_3713) + (-2);
    float _3781 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3753);
    float _3783 = float(uint(_3767));
    float _3785 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3755);
    int _3787 = ~_3637;
    int _3789 = _3787 + 1;
    int _3791 = _3759 * int(_3733);
    int _3793 = _3791 + _3689;
    int _3795 = ~_3691;
    int _3797 = _3795 + 1;
    float _3799 = as_type<float>(_3779) * _3783;
    float _3801 = rsqrt(_3771);
    int _3803 = _3789 * int(_3765);
    int _3805 = _3803 + _3709;
    float _3807 = float(uint(_3793));
    float _3809 = float(uint(_3805));
    int _3811 = _3749 * int(_3777);
    int _3813 = _3811 + _3681;
    float _3815 = trunc(_3799);
    float _3817 = precise::max(_3815, 0.0);
    uint _3819 = uint(_3817);
    float _3821 = -_185;
    int _3823 = _3477 ? as_type<int>(_3821) : as_type<int>(_185);
    float _3825 = as_type<float>(_3707) * _3807;
    float _3827 = as_type<float>(_3719) * _3809;
    float _3829 = float(uint(_3813));
    float _3831 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3693);
    float _3833 = -_185;
    int _3835 = _3517 ? as_type<int>(_3833) : as_type<int>(_185);
    float _3837 = _3725 * _3645;
    int _3839 = ~_3691;
    int _3841 = _3839 + 1;
    float _3843 = as_type<float>(_3673) * _3829;
    float _3845 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3695);
    float _3847 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3697);
    bool _3849 = !_3531;
    float _3851 = _3849 ? _185 : as_type<float>(_3823);
    float _3853 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3855 = !_3409;
    float _3857 = _3855 ? _185 : as_type<float>(_3835);
    float _3859 = trunc(_3825);
    float _3861 = precise::max(_3859, 0.0);
    uint _3863 = uint(_3861);
    int _3865 = _3841 * int(_3819);
    int _3867 = _3865 + _3767;
    float _3869 = _3725 * _3801;
    float _3871 = _3725 * _3669;
    float _3873 = _3725 * _3649;
    float _3875 = fma(_3853, _3831, _3837);
    float _3877 = float(uint(_3867));
    float _3879 = -_3781;
    float _3881 = _3869 * _3879;
    float _3883 = trunc(_3843);
    float _3885 = precise::max(_3883, 0.0);
    uint _3887 = uint(_3885);
    float _3889 = fma(_3853, _3845, _3871);
    float _3891 = fma(_3853, _3847, _3873);
    float _3893 = as_type<float>(_3779) * _3877;
    float _3895 = fma(_3801, _3669, _3881);
    int _3897 = ~_3567;
    int _3899 = _3897 + 1;
    out.m_74.x = _3831;
    out.m_74.y = _3845;
    out.m_74.z = _3847;
    int _3901 = ~_3511;
    int _3903 = _3901 + 1;
    float _3905 = trunc(_3827);
    float _3907 = precise::max(_3905, 0.0);
    uint _3909 = uint(_3907);
    int _3911 = int(_3733) + int(_3863);
    float _3913 = -_3769;
    float _3915 = _3869 * _3913;
    float _3917 = -_3785;
    float _3919 = _3869 * _3917;
    float _3921 = fma(_3801, _3645, _3915);
    float _3923 = _3769 + _3875;
    float _3925 = trunc(_3893);
    float _3927 = precise::max(_3925, 0.0);
    uint _3929 = uint(_3927);
    int _3931 = int(_3777) + int(_3887);
    int _3933 = _3899 * _3911;
    int _3935 = _3933 + _3689;
    int _3937 = ~_3637;
    int _3939 = _3937 + 1;
    float _3941 = fma(_3801, _3649, _3919);
    float _3943 = _3781 + _3889;
    int _3945 = _3903 * _3931;
    int _3947 = _3945 + _3681;
    float _3949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3951 = int(_3765) + int(_3909);
    out.m_76.x = _3921;
    out.m_76.y = _3895;
    out.m_76.z = _3941;
    bool _3953 = uint(_3935) >= uint(_3567);
    float _3955 = _3785 + _3891;
    bool _3957 = uint(_3947) >= uint(_3511);
    int _3959 = _3939 * _3951;
    int _3961 = _3959 + _3709;
    bool _3963 = !_3953;
    int _3965 = _3963 ? 0 : (-1);
    float _3967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3969 = int(_3819) + int(_3929);
    out.m_78.x = _3923;
    out.m_78.y = _3943;
    out.m_78.z = _3955;
    bool _3971 = !_3957;
    int _3973 = _3971 ? 0 : (-1);
    int _3975 = ~_3911;
    int _3977 = _3975 + _3965;
    int _3979 = _3977 + 1;
    int _3981 = _3797 * _3969;
    int _3983 = _3981 + _3767;
    bool _3985 = uint(_3961) >= uint(_3637);
    float _3987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3989 = ~_3931;
    int _3991 = _3989 + _3973;
    int _3993 = _3991 + 1;
    int _3995 = _3567 * _3979;
    int _3997 = _3995 + _3689;
    bool _3999 = uint(_3983) >= uint(_3691);
    float _4001 = _3949 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4003 = _3681 ^ _3511;
    int _4005 = _3511 * _3993;
    int _4007 = _4005 + _3681;
    bool _4009 = !_3999;
    int _4011 = _4009 ? 0 : (-1);
    bool _4013 = !_3985;
    int _4015 = _4013 ? 0 : (-1);
    uint _4017 = uint(int(uint(_4003) >> uint(31)));
    int _4019 = ~_4011;
    int _4021 = _3969 + _4019;
    int _4023 = _4021 + 1;
    bool _4025 = _3511 == 0;
    float _4027 = _3987 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4029 = _3689 ^ _3567;
    int _4031 = ~_4015;
    int _4033 = _3951 + _4031;
    int _4035 = _4033 + 1;
    int _4037 = ~int(_4017);
    int _4039 = _4037 + 1;
    uint _4041 = uint(int(uint(_4029) >> uint(31)));
    bool _4043 = !_4025;
    int _4045 = _4043 ? _4007 : (-1);
    int _4047 = _4035 ^ _4039;
    int _4049 = ~int(_4041);
    int _4051 = _4049 + 1;
    float _4053 = float(_4045);
    bool _4055 = _3511 == 0;
    int _4057 = ~_4039;
    int _4059 = _4057 + _4047;
    int _4061 = _4059 + 1;
    float _4063 = fma(_2759, _4053, _1011);
    bool _4065 = _3567 == 0;
    int _4067 = _4023 ^ _4051;
    bool _4069 = !_4055;
    int _4071 = _4069 ? _4061 : (-1);
    bool _4073 = _3567 == 0;
    int _4075 = ~_4051;
    int _4077 = _4075 + _4067;
    int _4079 = _4077 + 1;
    bool _4081 = !_4065;
    int _4083 = _4081 ? _3997 : (-1);
    float _4085 = float(_4071);
    bool _4087 = !_4073;
    int _4089 = _4087 ? _4079 : (-1);
    float _4091 = float(_4083);
    float _4093 = _3851 + 0.5;
    float _4095 = -_1049;
    float _4097 = fma(_4027, _4085, _4095);
    float _4099 = float(_4089);
    float _4101 = _3717 + (-0.5);
    float _4103 = _3967 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4105 = fma(_2759, _4093, _4063);
    float _4107 = fma(_4001, _4091, _1467);
    float _4109 = _3857 + 0.5;
    float _4111 = -_4027;
    float _4113 = fma(_4111, _4101, _4097);
    float _4115 = -_1469;
    float _4117 = fma(_4103, _4099, _4115);
    float _4119 = -_1441;
    float _4121 = _4119 + 1.0;
    float _4123 = _3737 + (-0.5);
    float _4125 = fma(_4001, _4109, _4107);
    float _4127 = _2815 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4129 = -_4121;
    float _4131 = fma(_3851, _4129, _4105);
    float _4133 = -_4103;
    float _4135 = fma(_4133, _4123, _4117);
    float _4137 = -_2674;
    float _4139 = fma(_3857, _4137, _4125);
    float _4141 = _2587 + _2561;
    float _4143 = _2561 * 0.5;
    float _4145 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2720);
    float _4147 = _4127 * _2619;
    bool _4149 = _2303 > 0.0;
    bool _4151 = isnan(_2303);
    bool _4153 = _4149 || _4151;
    bool _4155 = isnan(0.0);
    bool _4157 = _4153 || _4155;
    float _4159 = _4141 * 0.5;
    float _4161 = fma(_2591, -0.5, _4143);
    float _4163 = fma(_3737, _2724, _4135);
    float _4165 = -_1457;
    float _4167 = _4165 + 1.0;
    float _4169 = _4145 + _2561;
    float _4171 = _2303 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4173 = _2630 * _4147;
    float _4175 = _2640 * _4147;
    float _4177 = -_4127;
    float _4179 = _4177 + 1.0;
    float _4181 = fma(_3717, _4167, _4113);
    float _4183 = _4169 * 0.5;
    float _4185 = _4171 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4187 = fma(_2636, _4173, _2624);
    float _4189 = fma(_2638, _4173, _2626);
    float _4191 = _2630 * _4179;
    float _4193 = fma(_2630, _4175, _2628);
    out.gl_Position.x = _2587;
    out.gl_Position.y = _2591;
    out.gl_Position.z = _4145;
    out.gl_Position.w = _2561;
    out.m_80.x = _4159;
    out.m_80.y = _4161;
    out.m_80.z = _4183;
    out.m_80.w = _2561;
    out.m_82.x = _4131;
    out.m_82.y = _4181;
    out.m_82.z = _4139;
    out.m_82.w = _4163;
    out.m_47.x = _4185;
    out.m_84.x = _4187;
    out.m_84.y = _4189;
    out.m_84.z = _4193;
    out.m_84.w = _4191;
    if (_4157)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4195 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4195;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _875 = false;
    bool _771 = false;
    bool _657 = false;
    bool _553 = false;
    bool _385 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_47.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4252 = as_type<float>(_119);
        out.gl_Position.z = _4252;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_49.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4322 = as_type<float>(_157);
        out.gl_Position.z = _4322;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_54.x;
    float _163 = in.m_54.y;
    float _165 = in.m_54.z;
    int _167 = as_type<int>(_159) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_159) & 2;
    bool _173 = _171 != 0;
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _181 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _183 = !_169;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    float _191 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    bool _193 = !_173;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _199 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    bool _203 = !_175;
    float _205 = _197;
    float _207 = _199;
    float _209 = _201;
    float _227;
    if (!_203)
    {
        float _211 = in.m_56.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_103);
        float _233 = 1.0 / _231;
        float _235 = _137 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    bool _243 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_237);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _237 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -_253;
    float _269 = _267 + 1.0;
    float _271 = in.m_58.x;
    float _273 = in.m_58.y;
    bool _275 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _277 = isnan(_237);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = 1.0 / _261;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _291 = 1.0 / _265;
    float _293 = _241 * _287;
    bool _295 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_237);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = _305 * _269;
    float _317 = -_305;
    float _319 = _317 + 1.0;
    float _321 = _257 * _291;
    float _323 = fma(_309, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = fma(_313, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = _285 * _319;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = -_285;
    float _335 = _333 + 1.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = _323 * _327;
    float _343 = _325 * _327;
    float _345 = fma(_331, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _347 = fma(_339, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _353 = fma(_345, _315, _349);
    float _355 = fma(_347, _315, _351);
    float _357 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].x, _353);
    float _359 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].y, _355);
    float _361 = _357 * _271;
    float _363 = _359 * _273;
    bool _365 = !_289;
    float _383;
    if (!_365)
    {
        float _367 = in.m_56.x;
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _371 = _367 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_103);
        float _389 = 1.0 / _387;
        float _391 = _137 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _393 + _395;
    bool _399 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _413 = _393 + _411;
    bool _415 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _417 = isnan(_393);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _435 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _437 = isnan(_393);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = 1.0 / _433;
    float _453 = _445 * _449;
    float _455 = -_445;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _459;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = 1.0 / _429;
    float _467 = _425 * _457;
    float _469 = -_425;
    float _471 = _469 + 1.0;
    float _473 = _413 * _451;
    float _475 = _397 * _465;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _481;
    float _485 = fma(_461, _475, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_479, _475, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = fma(_483, _475, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _491 = _485 * _467;
    float _493 = _487 * _467;
    float _495 = _489 * _467;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _509 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _511 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].y, _493);
    float _513 = fma(_499, _473, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _515 = fma(_503, _473, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _517 = fma(_507, _473, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _519 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].z, _495);
    float _521 = fma(_513, _453, _509);
    float _523 = fma(_515, _453, _511);
    float _525 = fma(_517, _453, _519);
    float _527 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _521);
    float _529 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _525);
    bool _533 = !_463;
    float _551;
    if (!_533)
    {
        float _535 = in.m_56.x;
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _539 = _535 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_103);
        float _557 = 1.0 / _555;
        float _559 = _137 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _565 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _567 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _569 = isnan(_561);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _583 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _585 = isnan(_561);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _601 = _561 + _599;
    float _603 = -_577;
    float _605 = _603 + 1.0;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _609 = 1.0 / _581;
    float _611 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _613 = _593 * _605;
    float _615 = -_593;
    float _617 = _615 + 1.0;
    float _619 = _563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _597 * _609;
    float _627 = fma(_625, _601, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _629 = _627 * _613;
    float _631 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[115].x, _629);
    float _633 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[116].x, _631);
    float _635 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _637 = !_607;
    float _655;
    if (!_637)
    {
        float _639 = in.m_56.x;
        float _641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _643 = _639 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[11].z, _137);
        float _647 = _645 * _641;
        float _649 = floor(_647);
        float _651 = -_649;
        float _653 = _647 + _651;
        _655 = _653;
        _657 = true;
    }
    else
    {
        float _659 = float(_103);
        float _661 = 1.0 / _659;
        float _663 = _137 * _661;
        _655 = _663;
    }
    _657 = false;
    float _665 = _655;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _669 = _665 + _667;
    bool _671 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _673 = isnan(_665);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _683;
    bool _687 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _689 = isnan(_665);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_681;
    float _701 = _699 + 1.0;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _703;
    float _707 = 1.0 / _685;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _711 = _697 * _701;
    float _713 = -_697;
    float _715 = _713 + 1.0;
    float _717 = _669 * _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _719;
    float _723 = fma(_705, _717, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _725;
    float _729 = fma(_721, _717, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _731 = _723 * _711;
    float _733 = fma(_727, _717, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _735 = _729 * _711;
    float _737 = _733 * _711;
    float _739 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[123].x, _731);
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[123].y, _737);
    float _743 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[123].z, _735);
    float _745 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[124].x, _739);
    float _747 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[124].y, _741);
    float _749 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[124].z, _743);
    bool _751 = !_709;
    float _769;
    if (!_751)
    {
        float _753 = in.m_56.x;
        float _755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _757 = _753 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _761 = _759 * _755;
        float _763 = floor(_761);
        float _765 = -_763;
        float _767 = _761 + _765;
        _769 = _767;
        _771 = true;
    }
    else
    {
        float _773 = float(_103);
        float _775 = 1.0 / _773;
        float _777 = _137 * _775;
        _769 = _777;
    }
    _771 = false;
    float _779 = _769;
    float _781 = _745 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _783 = _747 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _785 = _779 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _787 = isnan(_779);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _801 = _779 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _803 = isnan(_779);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _813;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _819 = _779 + _817;
    float _821 = -_795;
    float _823 = _821 + 1.0;
    bool _825 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _827 = 1.0 / _799;
    float _829 = _749 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _831 = _811 * _823;
    float _833 = -_811;
    float _835 = _833 + 1.0;
    float _837 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _815 * _827;
    float _845 = fma(_843, _819, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _847 = _845 * _831;
    float _849 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[131].x, _847);
    float _851 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[132].x, _849);
    float _853 = _851 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _855 = !_825;
    float _873;
    if (!_855)
    {
        float _857 = in.m_56.x;
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _861 = _857 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[14].x, _137);
        float _865 = _863 * _859;
        float _867 = floor(_865);
        float _869 = -_867;
        float _871 = _865 + _869;
        _873 = _871;
        _875 = true;
    }
    else
    {
        float _877 = float(_103);
        float _879 = 1.0 / _877;
        float _881 = _137 * _879;
        _873 = _881;
    }
    _875 = false;
    float _883 = _873;
    float _885 = in.m_56.x;
    float _887 = in.m_56.y;
    float _889 = in.m_56.z;
    float _891 = in.m_56.w;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _895 = _883 + _893;
    float _897 = in.m_44.x;
    float _899 = in.m_44.y;
    float _901 = in.m_44.z;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _913 = _911 != 0;
    float _915 = 1.0 / _905;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _919 = _363 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _925 = 1.0 / _909;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _933 = _885 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _935 = _887 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _937 = 1.0 / _923;
    float _939 = -_917;
    float _941 = fma(_933, 2.0, _939);
    float _943 = fma(_935, -2.0, _931);
    float _945 = _899 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _951 = _899 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _953 = 1.0 / _929;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _959 = _899 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _961 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[4].x, _945);
    float _963 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[5].x, _951);
    float _965 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[6].x, _959);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _967;
    float _971 = 1.0 / _949;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _975 = _973 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _977 = _969 * _915;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _979;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _983;
    float _987 = 1.0 / _957;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _993 = _885 * 2.0;
    float _995 = _985 * _925;
    float _997 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[4].z, _961);
    float _999 = _991 * _937;
    float _1001 = _887 * 2.0;
    float _1003 = floor(_993);
    float _1005 = _981 * _971;
    float _1007 = _997 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1009 = -_137;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[76].x, _941);
    bool _1013 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1015 = isnan(_883);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1027 = 1.0 / _975;
    float _1029 = _889 * 2.0;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1035 = _1007 + _1033;
    bool _1037 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1039 = isnan(_883);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _943);
    float _1051 = floor(_1029);
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1057 = _1003 >= 0.0;
    bool _1059 = isnan(_1003);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    bool _1067 = _1003 > 0.0;
    float _1069 = _1055 * _953;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1075;
    float _1079 = floor(_1001);
    float _1081 = _885 + _887;
    float _1083 = _1073 * _1027;
    float _1085 = _1077 * _987;
    float _1087 = _889 + _885;
    float _1089 = _1081 + (-1.0);
    float _1091 = _889 + _887;
    float _1093 = _1087 + (-1.0);
    float _1095 = _1091 + (-1.0);
    bool _1097 = _1051 > 0.0;
    float _1099 = fma(_1069, _895, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1101 = _1051 >= 0.0;
    bool _1103 = isnan(_1051);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1113 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1115 = _1079 > 0.0;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1119 = _883 + _1117;
    int _1121 = as_type<int>(_1051);
    if (_913)
    {
        _1121 = 0;
    }
    int _1123 = _1121;
    float _1125 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[5].z, _963);
    int _1127 = _1123;
    if (!_913)
    {
        _1127 = 1;
    }
    int _1129 = _1127;
    float _1131 = fma(_995, _1119, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1133 = _1079 >= 0.0;
    bool _1135 = isnan(_1079);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(0.0);
    bool _1141 = _1137 || _1139;
    float _1143 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[6].z, _965);
    float _1145 = _1065 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1147 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1149 = _1109 ? 0 : 1;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1153 = _883 + _1151;
    bool _1155 = _1129 != 1;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1159 = _883 + _1157;
    int _1161 = _1141 ? 0 : 1;
    float _1163 = fma(_999, _1153, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _1165 = ~_1149;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    float _1171 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1173 = log2(_1171);
    int _1175 = _1169;
    float _1177 = _1145;
    float _1179 = _1159;
    if (!_1097)
    {
        int _1181 = ~_1149;
        int _1183 = _1181 + 1;
        _1175 = _1183;
    }
    int _1185 = _1175;
    float _1187 = fma(_977, _1159, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1199 = _1197 != 0;
    float _1201 = _1125 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1203 = ~_1161;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1211 = _1207;
    if (!_1115)
    {
        int _1213 = ~_1161;
        int _1215 = _1213 + 1;
        _1211 = _1215;
    }
    int _1217 = _1211;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1221 = _1201 + _1219;
    float _1223 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1225 = int(_1223);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1209 + _1227;
    bool _1231 = !_1195;
    int _1233 = _1231 ? 0 : 1;
    bool _1235 = !_1191;
    int _1237 = _1235 ? 0 : 1;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1241 = !_1199;
    int _1243 = _1241 ? 0 : 1;
    int _1245 = ~as_type<int>(_1145);
    int _1247 = _1245 + 1;
    int _1249 = _1247 + 1;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1261 = _1259 != 0;
    int _1263 = _1249;
    if (!_1067)
    {
        int _1265 = ~as_type<int>(_1145);
        int _1267 = _1265 + 1;
        _1263 = _1267;
    }
    int _1269 = _1263;
    if (!_1155)
    {
        _1177 = _889;
    }
    float _1271 = _1177;
    float _1273 = _1271;
    if (_1155)
    {
        _1273 = _887;
    }
    float _1275 = _1273;
    bool _1277 = !_1257;
    int _1279 = _1277 ? 0 : 1;
    float _1281 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1239);
    float _1283 = float(_103);
    float _1285 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1287 = int(_1285);
    bool _1289 = !_1253;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1295 = _1275;
    if (!_1155)
    {
        _1179 = _887;
    }
    float _1297 = _1179;
    float _1299 = _1297;
    if (_1155)
    {
        _1299 = _885;
    }
    float _1301 = _1299;
    int _1303 = abs(_1279);
    float _1305 = 1.0 / _1283;
    int _1307 = abs(_1291);
    float _1309 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1293);
    float _1311 = float(_1269);
    float _1313 = float(_1303);
    float _1315 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1309);
    float _1317 = float(_1225);
    float _1319 = _1301;
    if (!_1155)
    {
        _1319 = _887;
    }
    float _1321 = _1319;
    float _1323 = _1313 * _1311;
    float _1325 = float(_1307);
    float _1327 = 1.0 / _1317;
    float _1329 = float(_1185);
    float _1331 = _1173 * _137;
    float _1333 = _1321;
    if (_1155)
    {
        _1333 = _885;
    }
    float _1335 = _1333;
    float _1337 = _1323 * (-2.0);
    if (!_1155)
    {
        _1295 = _889;
    }
    float _1339 = _1295;
    float _1341 = _1325 * _1329;
    float _1343 = _1339;
    if (_1155)
    {
        _1343 = _887;
    }
    float _1345 = _1343;
    float _1347 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1349 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1351 = isnan(_883);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = exp2(_1331);
    float _1363 = float(_1287);
    float _1365 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1367 = -_1025;
    float _1369 = fma(_1347, 2.0, _1367);
    bool _1371 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1373 = isnan(_883);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = -_1359;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1365, -2.0, _1031);
    float _1389 = 1.0 / _1363;
    float _1391 = _1381 * _1385;
    float _1393 = -_1381;
    float _1395 = _1393 + 1.0;
    float _1397 = in.m_60.x;
    float _1399 = in.m_60.y;
    float _1401 = in.m_60.z;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1405 = _1327 * _137;
    float _1407 = _1221 * _1221;
    float _1409 = _1023 * _1395;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1413 = 1.0 + _1411;
    float _1415 = _1305 * _137;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1419 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1403);
    float _1421 = 1.0 / _1413;
    bool _1423 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1425 = isnan(1.0);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1431 = _1427 || _1429;
    float _1433 = fma(_1035, _1035, _1407);
    float _1435 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1417);
    float _1437 = -_1361;
    float _1439 = _1437 + 1.0;
    float _1441 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1419);
    bool _1443 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1445 = isnan(0.0);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1229, _1229, _1433);
    float _1455 = _1389 * _137;
    float _1457 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1435);
    float _1459 = _1451 ? _1439 : 0.0;
    float _1461 = sqrt(_1453);
    float _1463 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1281);
    float _1465 = -_137;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1369);
    float _1469 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1387);
    float _1471 = -_1023;
    float _1473 = _1471 + 1.0;
    if (_1431)
    {
        float _1475 = _1459 * _1421;
        _139 = _1475;
    }
    float _1477 = _139;
    float _1479 = _1341 * (-2.0);
    float _1481 = -_1047;
    float _1483 = _1481 + 1.0;
    float _1485 = _1047 * _1473;
    bool _1487 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1489 = isnan(_883);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = fma(_1147, _1479, _1147);
    float _1501 = fma(_1479, _1397, _1397);
    float _1503 = _885 + (-0.5);
    float _1505 = _361 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1507 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1509 = isnan(_883);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = _1497 * _1483;
    float _1521 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1501);
    float _1523 = -_1497;
    float _1525 = _1523 + 1.0;
    float _1527 = _1505 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1529 = _1461 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1531 = rsqrt(_1453);
    bool _1533 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1535 = isnan(_883);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = _1517 * _1525;
    float _1547 = -_1517;
    float _1549 = _1547 + 1.0;
    float _1551 = precise::min(_1527, _1529);
    float _1553 = fma(_1499, _1477, _1521);
    bool _1555 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1557 = isnan(_883);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = -_1543;
    float _1569 = _1567 + 1.0;
    bool _1571 = !_1261;
    int _1573 = _1571 ? 0 : 1;
    float _1575 = _1543 * _1549;
    float _1577 = _887 + (-0.5);
    float _1579 = _1565 * _1569;
    float _1581 = fma(_1337, _1399, _1399);
    int _1583 = abs(_1573);
    float _1585 = _1553 * 0.15915493667125701904296875;
    float _1587 = float(_1217);
    float _1589 = fma(_1113, _1337, _1113);
    float _1591 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1581);
    float _1593 = float(_1583);
    float _1595 = _1531 * _1551;
    float _1597 = _1131 * _1579;
    float _1599 = fma(_1589, _1477, _1591);
    float _1601 = _1585 * 6.283185482025146484375;
    float _1603 = sin(_1601);
    float _1605 = _1221 * _1595;
    float _1607 = _1593 * _1587;
    float _1609 = -_1565;
    float _1611 = _1609 + 1.0;
    float _1613 = _1035 * _1595;
    float _1615 = -_1605;
    float _1617 = _1221 + _1615;
    float _1619 = _1607 * (-2.0);
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1597);
    float _1623 = _1229 * _1595;
    float _1625 = _1617 * _1617;
    float _1627 = fma(_1619, _1401, _1401);
    float _1629 = _889 + (-0.5);
    float _1631 = -_1613;
    float _1633 = _1035 + _1631;
    float _1635 = fma(_1163, _1575, _1621);
    float _1637 = fma(_1111, _1619, _1111);
    float _1639 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1627);
    float _1641 = fma(_1633, _1633, _1625);
    float _1643 = -_1623;
    float _1645 = _1229 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1649 = _883 + _1647;
    float _1651 = fma(_1187, _1545, _1635);
    float _1653 = fma(_1637, _1477, _1639);
    float _1655 = fma(_1645, _1645, _1641);
    float _1657 = fma(_1005, _1649, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1659 = _1599 * 0.15915493667125701904296875;
    float _1661 = fma(_1099, _1519, _1651);
    float _1663 = _1653 * 0.15915493667125701904296875;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1667 = _883 + _1665;
    float _1669 = sqrt(_1655);
    float _1671 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1673 = fma(_1657, _1485, _1661);
    float _1675 = fma(_1083, _1667, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1679 = _883 + _1677;
    float _1681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1683 = fma(_1675, _1409, _1673);
    float _1685 = _1585 * 6.283185482025146484375;
    float _1687 = cos(_1685);
    float _1689 = fma(_1085, _1679, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1691 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1671);
    float _1693 = fma(_1689, _1391, _1683);
    float _1695 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1691);
    float _1697 = _1659 * 6.283185482025146484375;
    float _1699 = cos(_1697);
    float _1701 = _1531 * _1669;
    float _1703 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1693);
    float _1705 = _919 * _1701;
    float _1707 = _1505 * _1701;
    float _1709 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1711 = _1709 * 0.5;
    float _1713 = _1663 * 6.283185482025146484375;
    float _1715 = cos(_1713);
    float _1717 = _1705 * _1681;
    float _1719 = _1659 * 6.283185482025146484375;
    float _1721 = sin(_1719);
    float _1723 = _1603 * _1699;
    float _1725 = _1687 * _1699;
    float _1727 = _1663 * 6.283185482025146484375;
    float _1729 = sin(_1727);
    float _1731 = _1699 * _1715;
    float _1733 = _1687 * _1715;
    float _1735 = _1603 * _1715;
    float _1737 = _1735 * _1717;
    float _1739 = _1687 * _1721;
    float _1741 = _1603 * _1721;
    float _1743 = _1721 * _1715;
    float _1745 = _1733 * _1717;
    float _1747 = sqrt(_1695);
    float _1749 = -_1739;
    float _1751 = fma(_1729, _1723, _1749);
    float _1753 = -_1723;
    float _1755 = fma(_1729, _1739, _1753);
    float _1757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1759 = fma(_1729, _1725, _1741);
    float _1761 = -_1717;
    float _1763 = _1729 * _1761;
    float _1765 = fma(_1729, _1741, _1725);
    float _1767 = _1707 * _1757;
    float _1769 = fma(_1759, _1767, _1745);
    float _1771 = fma(_1731, _1767, _1763);
    float _1773 = fma(_1751, _1767, _1737);
    float _1775 = _1747 * 50.0;
    float _1777 = fma(_1755, _1711, _1769);
    float _1779 = fma(_1743, _1711, _1771);
    float _1781 = fma(_1765, _1711, _1773);
    float _1783 = _1703 * _1775;
    float _1785 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1789 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1791 = _1783 * _1783;
    float _1793 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1785);
    float _1795 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1787);
    float _1797 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1789);
    float _1799 = rsqrt(_1791);
    float _1801 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1793);
    float _1803 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1795);
    float _1805 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1797);
    float _1807 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1809 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1811 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1813 = _1807 * _1807;
    float _1815 = _1209 + _1809;
    float _1817 = _1809 * _1809;
    float _1819 = _1007 + _1807;
    float _1821 = fma(_1811, _1811, _1813);
    float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1825 = _1815 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1829 = _1819 + _1827;
    float _1831 = _1817 + _1821;
    float _1833 = _1825 * _1825;
    float _1835 = _1783 * _1799;
    float _1837 = fma(_1829, _1829, _1833);
    float _1839 = rsqrt(_1831);
    float _1841 = sqrt(_1837);
    float _1843 = sqrt(_1791);
    float _1845 = _1811 * _1839;
    float _1847 = _1835 * _1845;
    bool _1849 = _1841 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1853 = _1851 != 0;
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1857 = _1855 != 0;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1861 = _1859 != 0;
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1865 = _1863 != 0;
    float _1867 = _1847 * _1843;
    bool _1869 = !_1857;
    int _1871 = _1869 ? 0 : 1;
    bool _1873 = !_1861;
    int _1875 = _1873 ? 0 : 1;
    float _1877 = fma(_1835, _1867, _1811);
    float _1879 = _1811;
    float _1881 = _1877;
    float _1883 = _1791;
    float _1885 = _1839;
    float _1887 = _1867;
    float _1889 = _1819;
    float _1891 = _1817;
    float _1893 = _1605;
    if (!_1849)
    {
        _1879 = _1813;
    }
    float _1895 = _1879;
    bool _1897 = !_1853;
    int _1899 = _1897 ? 0 : 1;
    float _1901 = _1201 + _1877;
    float _1903 = _1895;
    if (!_1849)
    {
        _1881 = _1819;
    }
    float _1905 = _1881;
    bool _1907 = !_1865;
    int _1909 = _1907 ? 0 : 1;
    float _1911 = _1905;
    if (!_1849)
    {
        _1883 = _1809;
    }
    float _1913 = _1883;
    float _1915 = _1913;
    if (!_1849)
    {
        _1885 = _1807;
    }
    float _1917 = _1885;
    float _1919 = _1917;
    if (!_1849)
    {
        _1887 = _1815;
    }
    float _1921 = _1887;
    float _1923 = _1921;
    if (!_1849)
    {
        _1889 = _1901;
    }
    float _1925 = _1889;
    bool _1927 = !_1849;
    float _1929 = _1925;
    if (!_1927)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1935 = _1841 + _1933;
        float _1937 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1939 = rsqrt(_1837);
        float _1941 = _1935 * _1931;
        float _1943 = _1941 * 0.15915493667125701904296875;
        float _1945 = _1943 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        float _1949 = _1943 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = fma(_1947, _1937, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1955 = _1939 * _1953;
        float _1957 = _1951 + (-1.0);
        float _1959 = fma(_1829, _1955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1961 = fma(_1825, _1955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1963 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1965 = -_1007;
        float _1967 = _1965 + _1959;
        float _1969 = -_1209;
        float _1971 = _1969 + _1961;
        float _1973 = fma(_1901, _1951, _1963);
        float _1975 = _1967 * _1967;
        float _1977 = _1971 * _1971;
        _1929 = _1973;
        _1911 = _1959;
        _1903 = _1975;
        _1891 = _1977;
        _1923 = _1961;
        _1919 = _1967;
        _1915 = _1971;
    }
    float _1979 = _1929;
    float _1981 = _1911;
    float _1983 = _1903;
    float _1985 = _1891;
    float _1987 = _1923;
    float _1989 = _1919;
    float _1991 = _1915;
    float _1993 = -_1201;
    float _1995 = _1993 + _1979;
    float _1997 = -_1605;
    float _1999 = _1201 + _1997;
    float _2001 = -_1613;
    float _2003 = _1007 + _2001;
    float _2005 = -_1613;
    float _2007 = _2005 + _1981;
    float _2009 = fma(_1995, _1995, _1983);
    float _2011 = _1999 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2013 = -_1623;
    float _2015 = _1209 + _2013;
    float _2017 = -_1605;
    float _2019 = _2017 + _1979;
    float _2021 = _2009 + _1985;
    float _2023 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2011);
    float _2025 = _1999 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2027 = -_1623;
    float _2029 = _2027 + _1987;
    float _2031 = sqrt(_2021);
    float _2033 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2023);
    float _2035 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2025);
    bool _2037 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2039 = isnan(0.5);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2045 = _2041 || _2043;
    float _2047 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2049 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2035);
    bool _2051 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2053 = isnan(0.5);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2059 = _2055 || _2057;
    float _2061 = 1.0 / _2047;
    float _2063 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2065 = _2063 + _2047;
    bool _2067 = _2031 > 0.0;
    float _2069 = _2065 * _2061;
    float _2071 = _2069 * 0.5;
    float _2073 = _2031;
    float _2075 = _2033;
    float _2077 = _2019;
    float _2079 = _1989;
    float _2081 = _1981;
    if (!_2067)
    {
        _2073 = _2007;
    }
    float _2083 = _2073;
    float _2085 = _2083;
    if (!_2067)
    {
        _2075 = _2029;
    }
    float _2087 = _2075;
    bool _2089 = !_2067;
    float _2091 = _2087;
    if (!_2089)
    {
        float _2093 = _199 * _199;
        float _2095 = fma(_197, _197, _2093);
        float _2097 = fma(_201, _201, _2095);
        float _2099 = rsqrt(_2021);
        float _2101 = sqrt(_2097);
        float _2103 = _1995 * _2099;
        float _2105 = _2099 * _1989;
        float _2107 = _2099 * _1991;
        bool _2109 = _2101 > 0.0;
        float _2111 = _2101;
        float _2113 = _2099;
        _1893 = _2103;
        if (!_2109)
        {
            _2111 = _2007;
        }
        float _2115 = _2111;
        _2085 = _2115;
        if (!_2109)
        {
            _2113 = _2029;
        }
        float _2117 = _2113;
        bool _2119 = !_2109;
        _2091 = _2117;
        if (!_2119)
        {
            float _2121 = rsqrt(_2097);
            float _2123 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2125 = _199 * _2121;
            float _2127 = _197 * _2121;
            float _2129 = _2103 * _2125;
            float _2131 = _201 * _2121;
            float _2133 = fma(_2105, _2127, _2129);
            float _2135 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2137 = fma(_2107, _2131, _2133);
            float _2139 = _2137 * _2135;
            float _2141 = fma(_197, _2139, _2007);
            float _2143 = fma(_199, _2139, _2019);
            float _2145 = fma(_201, _2139, _2029);
            _2085 = _2141;
            _2077 = _2143;
            _2091 = _2145;
            _2079 = _2123;
            _1893 = _2139;
        }
    }
    float _2147 = _2085;
    float _2149 = _2077;
    float _2151 = _2091;
    float _2153 = _2079;
    float _2155 = _1893;
    float _2157 = _2153;
    float _2159 = _2155;
    if (_2059)
    {
        _2081 = 1.0;
    }
    float _2161 = _2081;
    float _2163 = _2161;
    if (_2045)
    {
        _205 = _2147;
    }
    float _2165 = _205;
    float _2167 = _2165;
    if (_2045)
    {
        _207 = _2149;
    }
    float _2169 = _207;
    float _2171 = _2169;
    if (_2045)
    {
        _209 = _2151;
    }
    float _2173 = _209;
    float _2175 = _2173;
    if (!_2045)
    {
        float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2179 = _1999 + _2177;
        float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2183 = _2003 + _2181;
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2187 = -_2003;
        float _2189 = _2187 + _2147;
        float _2191 = _2179 * _2179;
        float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2195 = _2015 + _2193;
        float _2197 = -_1999;
        float _2199 = _2197 + _2149;
        float _2201 = -_2015;
        float _2203 = _2201 + _2151;
        float _2205 = fma(_2183, _2183, _2191);
        float _2207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2209 = fma(_2195, _2195, _2205);
        float _2211 = sqrt(_2209);
        float _2213 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2215 = precise::min(_2211, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2217 = _2215 * _2207;
        float _2219 = _2213 * _2217;
        float _2221 = fma(_2189, _2219, _2003);
        float _2223 = fma(_2199, _2219, _1999);
        float _2225 = fma(_2203, _2219, _2015);
        _2157 = _2191;
        _2171 = _2223;
        _2167 = _2221;
        _2175 = _2225;
        _2159 = _2207;
    }
    float _2227 = _2157;
    float _2229 = _2171;
    float _2231 = _2167;
    float _2233 = _2175;
    float _2235 = _2159;
    float _2237 = _2235;
    float _2239 = _2227;
    if (!_2059)
    {
        float _2241 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2243 = _2241 * 0.15915493667125701904296875;
        float _2245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2247 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2249 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2247);
        float _2251 = _2243 * 6.283185482025146484375;
        float _2253 = cos(_2251);
        float _2255 = _2245 * 0.15915493667125701904296875;
        float _2257 = _2243 * 6.283185482025146484375;
        float _2259 = sin(_2257);
        float _2261 = 1.0 / _2253;
        float _2263 = _2255 * 6.283185482025146484375;
        float _2265 = cos(_2263);
        float _2267 = _2259 * _2261;
        float _2269 = _2255 * 6.283185482025146484375;
        float _2271 = sin(_2269);
        float _2273 = _2265 * _2267;
        float _2275 = 1.0 / _2249;
        float _2277 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2279 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2277;
        float _2281 = 1.0 / _2273;
        float _2283 = 1.0 / _2279;
        float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2287 = _2275 * _2285;
        float _2289 = _2271 * _2281;
        float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2293 = fma(_2289, _2287, _2291);
        float _2295 = _2293 * _2283;
        float _2297 = precise::clamp(_2295, 0.0, 1.0);
        _2237 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _2239 = _2279;
        _2163 = _2297;
    }
    float _2299 = _2237;
    float _2301 = _2239;
    float _2303 = _2163;
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2307 = _2229 + _2305;
    float _2309 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2311 = _2231 + _2309;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2315 = _2233 + _2313;
    float _2317 = _2307 * _2307;
    float _2319 = fma(_2311, _2311, _2317);
    float _2321 = fma(_2315, _2315, _2319);
    float _2323 = rsqrt(_2321);
    float _2325 = sqrt(_2321);
    float _2327 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2329 = _2311 * _2327;
    float _2331 = _2315 * _2327;
    float _2333 = _2329 * _2329;
    float _2335 = _2331 * _2331;
    float _2337 = _2333 + _2335;
    float _2339 = sqrt(_2337);
    bool _2341 = _2339 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2345 = _2339 + _2343;
    float _2347 = _2323;
    float _2349 = _2337;
    float _2351 = _2345;
    float _2353 = _2299;
    float _2355 = _2327;
    if (_2341)
    {
        float _2357 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2347 = _2357;
    }
    float _2359 = _2347;
    if (_2341)
    {
        float _2361 = rsqrt(_2337);
        _2349 = _2361;
    }
    float _2363 = _2349;
    if (_2341)
    {
        float _2365 = _2345 * _2359;
        _2351 = _2365;
    }
    float _2367 = _2351;
    if (_2341)
    {
        float _2369 = _2367 * 0.15915493667125701904296875;
        _2353 = _2369;
    }
    float _2371 = _2353;
    float _2373 = _2315;
    float _2375 = _2371;
    if (_2341)
    {
        float _2377 = _2371 * 6.283185482025146484375;
        float _2379 = sin(_2377);
        _2373 = _2379;
    }
    float _2381 = _2373;
    float _2383 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2385 = precise::max(0.0, _2383);
    float _2387 = _2301;
    float _2389 = _2385;
    float _2391 = _2383;
    if (_2341)
    {
        float _2393 = _2371 * 6.283185482025146484375;
        float _2395 = cos(_2393);
        _2387 = _2395;
    }
    float _2397 = _2387;
    float _2399 = -_2327;
    float _2401 = -_2385;
    float _2403 = fma(_2307, _2399, _2401);
    float _2405 = _2403;
    if (_2341)
    {
        float _2407 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2389 = _2407;
    }
    float _2409 = _2389;
    float _2411 = _2409;
    float _2413 = _2381;
    if (_2341)
    {
        float _2415 = fma(_2381, _2409, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2411 = _2415;
    }
    float _2417 = _2411;
    float _2419 = _2417;
    if (!_2341)
    {
        _2413 = _2329;
    }
    float _2421 = _2413;
    float _2423 = _2421;
    float _2425 = _2397;
    if (_2341)
    {
        float _2427 = _2397 + (-1.0);
        _2391 = _2427;
    }
    float _2429 = _2391;
    float _2431 = _2429;
    if (_2341)
    {
        float _2433 = _2363 * _2417;
        _2355 = _2433;
    }
    float _2435 = _2355;
    if (!_2341)
    {
        _2419 = _2333;
    }
    float _2437 = _2419;
    float _2439 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2441 = _2437;
    if (_2341)
    {
        float _2443 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2375 = _2443;
    }
    float _2445 = _2375;
    if (_2341)
    {
        float _2447 = _2329 * _2435;
        _2423 = _2447;
    }
    float _2449 = _2423;
    if (!_2341)
    {
        _2431 = _2331;
    }
    float _2451 = _2431;
    float _2453 = _2451;
    if (_2341)
    {
        float _2455 = _2331 * _2435;
        _2453 = _2455;
    }
    float _2457 = _2453;
    if (_2341)
    {
        float _2459 = fma(_2403, _2397, _2445);
        _2405 = _2459;
    }
    float _2461 = _2405;
    if (_2341)
    {
        float _2463 = _2449 * _2449;
        _2441 = _2463;
    }
    float _2465 = _2441;
    if (!_2341)
    {
        _2425 = _2335;
    }
    float _2467 = _2425;
    float _2469 = _2467;
    if (_2341)
    {
        float _2471 = _2457 * _2457;
        _2469 = _2471;
    }
    float _2473 = _2469;
    float _2475 = fma(_2461, _2461, _2465);
    float _2477 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2479 = _2475 + _2473;
    float _2481 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2439);
    float _2483 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2487 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2485);
    float _2489 = precise::clamp(_2487, 0.0, 1.0);
    float _2491 = rsqrt(_2479);
    float _2493 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2481);
    float _2495 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2483);
    float _2497 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2499 = -_2489;
    float _2501 = _2499 + 1.0;
    float _2503 = _2493 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2505 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2495);
    float _2507 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2497);
    float _2509 = abs(_2501);
    float _2511 = log2(_2509);
    float _2513 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2515 = _2505 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2517 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2519 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2507);
    float _2521 = -_2513;
    float _2523 = fma(_2521, _2477, 1.0);
    float _2525 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2527 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2517);
    float _2529 = _2491 * _2449;
    float _2531 = _2491 * _2461;
    float _2533 = _2519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2535 = _2491 * _2457;
    float _2537 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2539 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2527);
    float _2541 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2525);
    float _2543 = log2(_2523);
    float _2545 = -_2537;
    float _2547 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2545);
    float _2549 = _2539 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2551 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2541);
    float _2553 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2555 = -_2535;
    float _2557 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2547);
    float _2559 = _2531 + 1.0;
    float _2561 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2551);
    float _2563 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2565 = fma(_2557, -0.5, 0.5);
    float _2567 = exp2(_2553);
    float _2569 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2571 = fma(_2557, 0.5, 0.5);
    float _2573 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2563);
    float _2575 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2569);
    float _2577 = fma(_2571, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2579 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2573);
    float _2581 = 1.0 / _2561;
    float _2583 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2575);
    float _2585 = fma(_2571, _2577, -0.212114393711090087890625);
    float _2587 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2579);
    float _2589 = _2543 * 0.693147182464599609375;
    float _2591 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2583);
    float _2593 = fma(_2571, _2585, 1.570728778839111328125);
    float _2595 = sqrt(_2565);
    float _2597 = -_2531;
    float _2599 = fma(_2567, _2559, _2597);
    float _2601 = _2589 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2603 = fma(_2599, 0.5, 0.5);
    float _2605 = _2587 * _2581;
    float _2607 = _2591 * _2581;
    float _2609 = fma(_2605, 0.5, 0.5);
    float _2611 = fma(_2607, -0.5, 0.5);
    float _2613 = _2595 * 0.636619746685028076171875;
    float _2615 = -_2593;
    float _2617 = fma(_2613, _2615, 1.0);
    float3 _8163 = float3(_2609, _2611, _2601);
    float _2619 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8163, float3(0.0), isnan(_8163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8163, float3(0.0), isnan(_8163)), level(0.0)).x;
    float3 _8174 = float3(_2609, _2611, _2601);
    float4 _2622 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8174, float3(0.0), isnan(_8174)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8174, float3(0.0), isnan(_8174)), level(0.0)).xyzw;
    float _2624 = _2622.x;
    float _2626 = _2622.y;
    float _2628 = _2622.z;
    float _2630 = _2622.w;
    float2 _8191 = float2(_2617, _2603);
    float3 _2634 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8191, float2(0.0), isnan(_8191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8191, float2(0.0), isnan(_8191)), level(0.0)).xyz;
    float _2636 = _2634.x;
    float _2638 = _2634.y;
    float _2640 = _2634.z;
    float _2642 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2644 = int(_2642);
    int _2646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2648 = _2646 != 0;
    out.m_62.x = _619;
    out.m_62.y = _621;
    out.m_62.z = _623;
    out.m_62.w = _635;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2652 = _2650 != 0;
    float _2654 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2656 = abs(_1237);
    out.m_64.x = _837;
    out.m_64.y = _839;
    out.m_64.z = _841;
    out.m_64.w = _853;
    int _2658 = abs(_1871);
    float _2660 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2662 = int(_2660);
    int _2664 = abs(_1243);
    out.m_66.w = _1551;
    int _2666 = abs(_1875);
    float _2668 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2670 = _891 > 0.5;
    out.m_68.x = _2003;
    out.m_68.y = _1999;
    out.m_68.z = _2015;
    float _2672 = -_1315;
    float _2674 = _2672 + 1.0;
    float _2676 = float(uint(_2644));
    float _2678 = trunc(_1405);
    int _2680 = int(_2678);
    float _2682 = trunc(_1455);
    int _2684 = int(_2682);
    float _2686 = float(uint(_2662));
    float _2688 = _2601;
    if (_2648)
    {
        float _2690 = in.m_56.x;
        _2688 = _2690;
    }
    float _2692 = _2688;
    int _2694 = ~_2662;
    int _2696 = _2694 + 1;
    float _2698 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2668);
    int _2700 = ~_2644;
    int _2702 = _2700 + 1;
    float _2704 = _2692;
    if (!_2648)
    {
        float _2706 = in.m_56.y;
        _2704 = _2706;
    }
    float _2708 = _2704;
    int _2710 = ~_2662;
    int _2712 = _2710 + 1;
    float _2714 = 1.0 / _2676;
    float _2716 = float(uint(_2680));
    out.m_70.x = _2231;
    out.m_70.y = _2229;
    out.m_70.z = _2233;
    bool _2718 = _2644 == 0;
    float _2720 = fma(_2503, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2698);
    float _2722 = -_1463;
    float _2724 = _2722 + 1.0;
    out.m_72.x = _1707;
    float _2726 = 1.0 / _2686;
    float _2728 = float(uint(_2684));
    int _2730 = as_type<int>(_2714) + (-2);
    float _2732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2734 = _2714;
    if (_2648)
    {
        _2734 = 1.0;
    }
    float _2736 = _2734;
    float _2738 = _2736;
    if (!_2648)
    {
        _2738 = 7.345489978790283203125;
    }
    float _2740 = _2738;
    float _2742 = as_type<float>(_2730) * _2716;
    int _2744 = as_type<int>(_2726) + (-2);
    float _2746 = trunc(_2742);
    float _2748 = precise::max(_2746, 0.0);
    uint _2751 = uint(_2748);
    int _2753 = ~_2644;
    int _2755 = _2753 + 1;
    float _2757 = as_type<float>(_2744) * _2728;
    float _2759 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2761 = _2740 * _885;
    float _2763 = trunc(_2757);
    float _2765 = precise::max(_2763, 0.0);
    uint _2767 = uint(_2765);
    int _2769 = _2755 * int(_2751);
    int _2771 = _2769 + _2680;
    float _2773 = floor(_2761);
    float _2775 = float(uint(_2771));
    int _2777 = _2696 * int(_2767);
    int _2779 = _2777 + _2684;
    float _2781 = as_type<float>(_2730) * _2775;
    float _2783 = exp2(_2654);
    float _2785 = float(uint(_2779));
    float _2787 = as_type<float>(_2779);
    if (_2648)
    {
        _2787 = 1.0;
    }
    float _2789 = _2787;
    float _2791 = -_2773;
    float _2793 = _2761 + _2791;
    float _2795 = _2789;
    if (!_2648)
    {
        _2795 = 1.2345600128173828125;
    }
    float _2797 = _2795;
    float _2799 = as_type<float>(_2744) * _2785;
    float _2801 = trunc(_2781);
    float _2803 = precise::max(_2801, 0.0);
    uint _2805 = uint(_2803);
    float _2807 = _2708 * _2797;
    float _2809 = float(_2644);
    float _2811 = float(_2680);
    float _2813 = -_2783;
    float _2815 = _2813 + 1.0;
    float _2817 = trunc(_2799);
    float _2819 = precise::max(_2817, 0.0);
    uint _2821 = uint(_2819);
    float _2823 = float(_2684);
    bool _2825 = _2811 >= _2809;
    bool _2827 = isnan(_2811);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(_2809);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    float _2837 = floor(_2807);
    int _2839 = int(_2751) + int(_2805);
    float _2841 = float(_2662);
    int _2843 = _2702 * _2839;
    int _2845 = _2843 + _2680;
    int _2847 = int(_2767) + int(_2821);
    float _2849 = trunc(_2835);
    int _2851 = int(_2849);
    bool _2853 = _2823 >= _2841;
    bool _2855 = isnan(_2823);
    bool _2857 = _2853 || _2855;
    bool _2859 = isnan(_2841);
    bool _2861 = _2857 || _2859;
    float _2863 = float(_2861);
    bool _2865 = uint(_2845) >= uint(_2644);
    int _2867 = _2712 * _2847;
    int _2869 = _2867 + _2684;
    float _2871 = -_2837;
    float _2873 = _2807 + _2871;
    float _2875 = _2793 * _2809;
    bool _2877 = !_2865;
    int _2879 = _2877 ? 0 : (-1);
    float _2881 = trunc(_2863);
    int _2883 = int(_2881);
    bool _2885 = uint(_2869) >= uint(_2662);
    float _2887 = _2873 * _2841;
    float _2889 = _2809 * _1415;
    int _2891 = ~_2839;
    int _2893 = _2891 + _2879;
    int _2895 = _2893 + 1;
    float _2897 = _2841 * _1415;
    bool _2899 = !_2885;
    int _2901 = _2899 ? 0 : (-1);
    float _2903 = trunc(_2875);
    int _2905 = int(_2903);
    int _2907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2909 = _2907 != 0;
    int _2911 = ~_2847;
    int _2913 = _2911 + _2901;
    int _2915 = _2913 + 1;
    bool _2917 = !_2909;
    int _2919 = _2917 ? 0 : 1;
    int _2921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2923 = _2921 != 0;
    float _2925 = trunc(_2887);
    int _2927 = int(_2925);
    int _2929 = abs(_2919);
    int _2931 = _2644 * _2895;
    int _2933 = _2931 + _2680;
    bool _2935 = !_2923;
    int _2937 = _2935 ? 0 : 1;
    int _2939 = _2662 * _2915;
    int _2941 = _2939 + _2684;
    int _2943 = ~_2851;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    bool _2949 = !_2718;
    int _2951 = _2949 ? _2933 : (-1);
    float _2953 = trunc(_2889);
    int _2955 = int(_2953);
    bool _2957 = _2662 == 0;
    int _2959 = abs(_2937);
    int _2961 = _2951 * _2947;
    int _2963 = ~_2883;
    int _2965 = _2963 + 1;
    int _2967 = _2965 + 1;
    int _2969 = _2905 * _2959;
    int _2971 = _2969 + _2680;
    bool _2973 = !_2957;
    int _2975 = _2973 ? _2941 : (-1);
    int _2977 = _2927 * _2929;
    int _2979 = _2977 + _2684;
    int _2981 = abs(_1233);
    float _2983 = trunc(_2897);
    int _2985 = int(_2983);
    int _2987 = _2644 + (-1);
    int _2989 = _2975 * _2967;
    int _2991 = _2662 + (-1);
    int _2993 = _2851 * _2987;
    int _2995 = _2993 + _2961;
    int _2997 = abs(_1899);
    int _2999 = _2883 * _2991;
    int _3001 = _2999 + _2989;
    int _3003 = _2995 * _2981;
    bool _3005 = !_2652;
    int _3007 = _3005 ? 0 : 1;
    int _3009 = _3001 * _2658;
    int _3011 = _2955 * _2656;
    int _3013 = _3011 + _3003;
    int _3015 = abs(_3007);
    int _3017 = _2985 * _2997;
    int _3019 = _3017 + _3009;
    int _3021 = abs(_1909);
    int _3023 = _2971 * _2664;
    int _3025 = _3023 + _3013;
    int _3027 = ~_2662;
    int _3029 = _3027 + 1;
    int _3031 = _2979 * _2666;
    int _3033 = _3031 + _3019;
    int _3035 = _2905 * _3015;
    int _3037 = _3035 + _3025;
    int _3039 = ~_2644;
    int _3041 = _3039 + 1;
    int _3043 = _2927 * _3021;
    int _3045 = _3043 + _3033;
    int _3047 = ~_2644;
    int _3049 = _3047 + 1;
    float _3051 = float(uint(_3037));
    float _3053 = float(uint(_3045));
    float _3055 = as_type<float>(_2730) * _3051;
    float _3057 = float(uint(_2971));
    float _3059 = as_type<float>(_2744) * _3053;
    float _3061 = float(uint(_2979));
    float _3063 = trunc(_3055);
    float _3065 = precise::max(_3063, 0.0);
    uint _3067 = uint(_3065);
    float _3069 = as_type<float>(_2730) * _3057;
    float _3071 = as_type<float>(_2744) * _3061;
    float _3073 = trunc(_3059);
    float _3075 = precise::max(_3073, 0.0);
    uint _3077 = uint(_3075);
    float _3079 = trunc(_3069);
    float _3081 = precise::max(_3079, 0.0);
    uint _3083 = uint(_3081);
    int _3085 = _3041 * int(_3067);
    int _3087 = _3085 + _3037;
    float _3089 = float(uint(_3087));
    int _3091 = _3029 * int(_3077);
    int _3093 = _3091 + _3045;
    float _3095 = trunc(_3071);
    float _3097 = precise::max(_3095, 0.0);
    uint _3099 = uint(_3097);
    float _3101 = as_type<float>(_2730) * _3089;
    float _3103 = float(uint(_3093));
    int _3105 = _3049 * int(_3083);
    int _3107 = _3105 + _2971;
    float _3109 = trunc(_3101);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = as_type<float>(_2744) * _3103;
    int _3117 = ~_2644;
    int _3119 = _3117 + 1;
    float _3121 = float(uint(_3107));
    int _3123 = ~_2662;
    int _3125 = _3123 + 1;
    float _3127 = trunc(_3115);
    float _3129 = precise::max(_3127, 0.0);
    uint _3131 = uint(_3129);
    float _3133 = as_type<float>(_2730) * _3121;
    int _3135 = _3125 * int(_3099);
    int _3137 = _3135 + _2979;
    int _3139 = int(_3067) + int(_3113);
    float _3141 = trunc(_3133);
    float _3143 = precise::max(_3141, 0.0);
    uint _3145 = uint(_3143);
    float _3147 = float(uint(_3137));
    int _3149 = ~_2662;
    int _3151 = _3149 + 1;
    int _3153 = _3119 * _3139;
    int _3155 = _3153 + _3037;
    int _3157 = int(_3077) + int(_3131);
    float _3159 = as_type<float>(_2744) * _3147;
    int _3161 = ~_2644;
    int _3163 = _3161 + 1;
    bool _3165 = uint(_3155) >= uint(_2644);
    int _3167 = _3151 * _3157;
    int _3169 = _3167 + _3045;
    float _3171 = trunc(_3159);
    float _3173 = precise::max(_3171, 0.0);
    uint _3175 = uint(_3173);
    bool _3177 = !_3165;
    int _3179 = _3177 ? 0 : (-1);
    int _3181 = int(_3083) + int(_3145);
    int _3183 = ~_3139;
    int _3185 = _3183 + _3179;
    int _3187 = _3185 + 1;
    bool _3189 = uint(_3169) >= uint(_2662);
    int _3191 = _3163 * _3181;
    int _3193 = _3191 + _2971;
    int _3195 = _2644 * _3187;
    int _3197 = _3195 + _3037;
    bool _3199 = !_3189;
    int _3201 = _3199 ? 0 : (-1);
    bool _3203 = uint(_3193) >= uint(_2644);
    int _3205 = ~_2662;
    int _3207 = _3205 + 1;
    int _3209 = ~_3157;
    int _3211 = _3209 + _3201;
    int _3213 = _3211 + 1;
    bool _3215 = !_2718;
    int _3217 = _3215 ? _3197 : (-1);
    int _3219 = int(_3099) + int(_3175);
    int _3221 = _2662 * _3213;
    int _3223 = _3221 + _3045;
    int _3225 = _3217 & 3;
    bool _3227 = _3225 != 0;
    bool _3229 = !_3203;
    int _3231 = _3229 ? 0 : (-1);
    int _3233 = _3207 * _3219;
    int _3235 = _3233 + _2979;
    bool _3237 = uint(_3225) >= 2u;
    bool _3239 = !_2957;
    int _3241 = _3239 ? _3223 : (-1);
    int _3243 = _3237 ? 0 : 1;
    bool _3245 = uint(_3235) >= uint(_2662);
    int _3247 = _3241 >> 31;
    bool _3249 = uint(_3225) > 1u;
    int _3251 = _3217 >> 31;
    int _3253 = _3247 & 3;
    int _3255 = _3217 & 3;
    bool _3257 = _3255 != 0;
    int _3259 = _3251 & 3;
    int _3261 = _3241 + _3253;
    int _3263 = _3257 ? 0 : 1;
    int _3265 = _3217 + _3259;
    int _3267 = ~_3181;
    int _3269 = _3267 + _3231;
    int _3271 = _3269 + 1;
    bool _3273 = _3225 != 3;
    int _3275 = _3261 >> 2;
    int _3277 = _2644 * _3271;
    int _3279 = _3277 + _2971;
    int _3281 = ~_3263;
    int _3283 = _3281 + 1;
    int _3285 = _3283 + 1;
    int _3287 = _3265 >> 2;
    int _3289 = _3285;
    if (!_3249)
    {
        int _3291 = ~_3263;
        int _3293 = _3291 + 1;
        _3289 = _3293;
    }
    int _3295 = _3289;
    int _3297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3299 = _3297 != 0;
    float _3301 = -_195;
    int _3303 = _2670 ? as_type<int>(_3301) : as_type<int>(_195);
    int _3305 = _3275 << 4;
    int _3307 = _3305 + 512;
    int _3309 = _3241 & 3;
    bool _3311 = _3309 != 0;
    int _3313 = _3287 << 4;
    int _3315 = _3313 + 368;
    bool _3317 = !_3227;
    int _3319 = _3317 ? 0 : 1;
    int _3321 = _3241 & 3;
    bool _3323 = _3321 != 0;
    uint _3325 = uint(int(uint(_3315) >> uint(2)));
    uint _3327 = uint(int(uint(int(_3325)) >> uint(2)));
    int _3329 = int(_3325) & 3;
    float _3331 = (*spvDescriptorSet0.vp_c9)._m0[int(_3327)][_3329];
    int _3333 = int(_3325) + 1;
    uint _3335 = uint(int(uint(_3333) >> uint(2)));
    int _3337 = _3333 & 3;
    float _3339 = (*spvDescriptorSet0.vp_c9)._m0[int(_3335)][_3337];
    bool _3341 = !_3299;
    int _3343 = _3341 ? 0 : 1;
    bool _3345 = uint(_3309) > 1u;
    int _3347 = ~_3243;
    int _3349 = _3347 + 1;
    int _3351 = _3349 + 1;
    int _3353 = _3351;
    if (_3273)
    {
        int _3355 = ~_3243;
        int _3357 = _3355 + 1;
        _3353 = _3357;
    }
    int _3359 = _3353;
    uint _3361 = uint(int(uint(_3307) >> uint(2)));
    uint _3363 = uint(int(uint(int(_3361)) >> uint(2)));
    int _3365 = int(_3361) & 3;
    float _3367 = (*spvDescriptorSet0.vp_c9)._m0[int(_3363)][_3365];
    int _3369 = int(_3361) + 1;
    uint _3371 = uint(int(uint(_3369) >> uint(2)));
    int _3373 = _3369 & 3;
    float _3375 = (*spvDescriptorSet0.vp_c9)._m0[int(_3371)][_3373];
    int _3377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3379 = _3377 != 0;
    bool _3381 = !_3245;
    int _3383 = _3381 ? 0 : (-1);
    bool _3385 = !_2718;
    int _3387 = _3385 ? _3279 : (-1);
    bool _3389 = !_3379;
    int _3391 = _3389 ? 0 : 1;
    bool _3393 = !_3311;
    int _3395 = _3393 ? 0 : 1;
    int _3397 = _3323 ? 0 : 1;
    int _3399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3401 = _3399 != 0;
    int _3403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3405 = _3403 != 0;
    int _3407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3409 = _3407 != 0;
    int _3411 = ~_3219;
    int _3413 = _3411 + _3383;
    int _3415 = _3413 + 1;
    int _3417 = _3307 + 8;
    uint _3419 = uint(int(uint(_3417) >> uint(2)));
    uint _3421 = uint(int(uint(int(_3419)) >> uint(2)));
    int _3423 = int(_3419) & 3;
    float _3425 = (*spvDescriptorSet0.vp_c9)._m0[int(_3421)][_3423];
    int _3427 = int(_3419) + 1;
    uint _3429 = uint(int(uint(_3427) >> uint(2)));
    int _3431 = _3427 & 3;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[int(_3429)][_3431];
    int _3435 = ~_3397;
    int _3437 = _3435 + 1;
    int _3439 = _3437 + 1;
    bool _3441 = _3225 != 3;
    int _3443 = _3439;
    if (!_3345)
    {
        int _3445 = ~_3397;
        int _3447 = _3445 + 1;
        _3443 = _3447;
    }
    int _3449 = _3443;
    bool _3451 = _3309 != 3;
    int _3453 = _3315 + 8;
    uint _3455 = uint(int(uint(_3453) >> uint(2)));
    uint _3457 = uint(int(uint(int(_3455)) >> uint(2)));
    int _3459 = int(_3455) & 3;
    float _3461 = (*spvDescriptorSet0.vp_c9)._m0[int(_3457)][_3459];
    int _3463 = int(_3455) + 1;
    uint _3465 = uint(int(uint(_3463) >> uint(2)));
    int _3467 = _3463 & 3;
    float _3469 = (*spvDescriptorSet0.vp_c9)._m0[int(_3465)][_3467];
    bool _3471 = !_3441;
    int _3473 = _3471 ? 0 : (-1);
    bool _3475 = uint(_3309) >= 2u;
    bool _3477 = _885 > 0.5;
    int _3479 = _2662 * _3415;
    int _3481 = _3479 + _2979;
    int _3483 = _3475 ? 0 : 1;
    float _3485 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3487 = _3309 != 3;
    int _3489 = ~_3483;
    int _3491 = _3489 + 1;
    int _3493 = _3491 + 1;
    float _3495 = -_1729;
    float _3497 = fma(_3495, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3485);
    int _3499 = _3493;
    if (_3451)
    {
        int _3501 = ~_3483;
        int _3503 = _3501 + 1;
        _3499 = _3503;
    }
    int _3505 = _3499;
    bool _3507 = _887 > 0.5;
    float _3509 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3511 = int(_3509);
    bool _3513 = !_2957;
    int _3515 = _3513 ? _3481 : (-1);
    bool _3517 = _889 > 0.5;
    int _3519 = abs(_3449);
    bool _3521 = !_3487;
    int _3523 = _3521 ? 0 : (-1);
    int _3525 = abs(_3295);
    float _3527 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3529 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3531 = _3529 != 0;
    float _3533 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3535 = abs(_3395);
    int _3537 = ~_3519;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    float _3543 = -_1729;
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3527);
    int _3547 = ~_3525;
    int _3549 = _3547 + 1;
    int _3551 = _3549 + 1;
    float _3553 = -_1729;
    float _3555 = fma(_3553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3533);
    int _3557 = abs(_3319);
    int _3559 = _3541 * as_type<int>(_3375);
    int _3561 = abs(_3359);
    int _3563 = _3551 * as_type<int>(_3339);
    float _3565 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3567 = int(_3565);
    int _3569 = abs(_3505);
    int _3571 = ~_3535;
    int _3573 = _3571 + 1;
    int _3575 = _3573 + 1;
    int _3577 = ~_3557;
    int _3579 = _3577 + 1;
    int _3581 = _3579 + 1;
    int _3583 = ~_3569;
    int _3585 = _3583 + 1;
    int _3587 = _3585 + 1;
    int _3589 = _3575 * as_type<int>(_3367);
    int _3591 = _3589 + _3559;
    int _3593 = ~_3561;
    int _3595 = _3593 + 1;
    int _3597 = _3595 + 1;
    int _3599 = _3581 * as_type<int>(_3331);
    int _3601 = _3599 + _3563;
    float _3603 = float(uint(_3511));
    int _3605 = _3587 * as_type<int>(_3425);
    int _3607 = _3605 + _3591;
    int _3609 = abs(_3473);
    int _3611 = _3597 * as_type<int>(_3461);
    int _3613 = _3611 + _3601;
    int _3615 = abs(_3523);
    float _3617 = 1.0 / _3603;
    int _3619 = ~_3609;
    int _3621 = _3619 + 1;
    int _3623 = _3621 + 1;
    int _3625 = ~_3615;
    int _3627 = _3625 + 1;
    int _3629 = _3627 + 1;
    int _3631 = abs(_3343);
    int _3633 = _3623 * as_type<int>(_3469);
    int _3635 = _3633 + _3613;
    int _3637 = abs(_3511);
    int _3639 = _3629 * as_type<int>(_3433);
    int _3641 = _3639 + _3607;
    float _3643 = float(uint(_3567));
    float _3645 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3497);
    int _3647 = abs(_3391);
    float _3649 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3555);
    float _3651 = 1.0 / _3643;
    int _3653 = ~_3631;
    int _3655 = _3653 + 1;
    int _3657 = _3655 + 1;
    float _3659 = float(uint(_3637));
    int _3661 = ~_3647;
    int _3663 = _3661 + 1;
    int _3665 = _3663 + 1;
    int _3667 = _3635 * _3657;
    float _3669 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3545);
    float _3671 = 1.0 / _3659;
    int _3673 = as_type<int>(_3617) + (-2);
    int _3675 = _3641 * _3665;
    float _3677 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3679 = _3387 * _3631;
    int _3681 = _3679 + _3667;
    float _3683 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3685 = _1759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3687 = _3515 * _3647;
    int _3689 = _3687 + _3675;
    int _3691 = abs(_3567);
    float _3693 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3677);
    float _3695 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3683);
    float _3697 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3685);
    float _3699 = -_195;
    int _3701 = _3507 ? as_type<int>(_3699) : as_type<int>(_195);
    float _3703 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3705 = float(uint(_3691));
    int _3707 = as_type<int>(_3651) + (-2);
    int _3709 = abs(_3681);
    float _3711 = float(uint(_3689));
    float _3713 = 1.0 / _3705;
    bool _3715 = !_3405;
    float _3717 = _3715 ? _195 : as_type<float>(_3701);
    int _3719 = as_type<int>(_3671) + (-2);
    float _3721 = as_type<float>(_3707) * _3711;
    float _3723 = float(uint(_3709));
    float _3725 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3727 = float(uint(_3681));
    float _3729 = trunc(_3721);
    float _3731 = precise::max(_3729, 0.0);
    uint _3733 = uint(_3731);
    bool _3735 = !_3401;
    float _3737 = _3735 ? _195 : as_type<float>(_3303);
    float _3739 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3741 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3743 = as_type<float>(_3719) * _3723;
    float _3745 = as_type<float>(_3673) * _3727;
    int _3747 = ~_3511;
    int _3749 = _3747 + 1;
    float _3751 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3703);
    float _3753 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3739);
    float _3755 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3741);
    int _3757 = ~_3567;
    int _3759 = _3757 + 1;
    float _3761 = trunc(_3743);
    float _3763 = precise::max(_3761, 0.0);
    uint _3765 = uint(_3763);
    int _3767 = abs(_3689);
    float _3769 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3751);
    float _3771 = fma(_3725, _3725, 1.0);
    float _3773 = trunc(_3745);
    float _3775 = precise::max(_3773, 0.0);
    uint _3777 = uint(_3775);
    int _3779 = as_type<int>(_3713) + (-2);
    float _3781 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3753);
    float _3783 = float(uint(_3767));
    float _3785 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3755);
    int _3787 = ~_3637;
    int _3789 = _3787 + 1;
    int _3791 = _3759 * int(_3733);
    int _3793 = _3791 + _3689;
    int _3795 = ~_3691;
    int _3797 = _3795 + 1;
    float _3799 = as_type<float>(_3779) * _3783;
    float _3801 = rsqrt(_3771);
    int _3803 = _3789 * int(_3765);
    int _3805 = _3803 + _3709;
    float _3807 = float(uint(_3793));
    float _3809 = float(uint(_3805));
    int _3811 = _3749 * int(_3777);
    int _3813 = _3811 + _3681;
    float _3815 = trunc(_3799);
    float _3817 = precise::max(_3815, 0.0);
    uint _3819 = uint(_3817);
    float _3821 = -_185;
    int _3823 = _3477 ? as_type<int>(_3821) : as_type<int>(_185);
    float _3825 = as_type<float>(_3707) * _3807;
    float _3827 = as_type<float>(_3719) * _3809;
    float _3829 = float(uint(_3813));
    float _3831 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3693);
    float _3833 = -_185;
    int _3835 = _3517 ? as_type<int>(_3833) : as_type<int>(_185);
    float _3837 = _3725 * _3645;
    int _3839 = ~_3691;
    int _3841 = _3839 + 1;
    float _3843 = as_type<float>(_3673) * _3829;
    float _3845 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3695);
    float _3847 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3697);
    bool _3849 = !_3531;
    float _3851 = _3849 ? _185 : as_type<float>(_3823);
    float _3853 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3855 = !_3409;
    float _3857 = _3855 ? _185 : as_type<float>(_3835);
    float _3859 = trunc(_3825);
    float _3861 = precise::max(_3859, 0.0);
    uint _3863 = uint(_3861);
    int _3865 = _3841 * int(_3819);
    int _3867 = _3865 + _3767;
    float _3869 = _3725 * _3801;
    float _3871 = _3725 * _3669;
    float _3873 = _3725 * _3649;
    float _3875 = fma(_3853, _3831, _3837);
    float _3877 = float(uint(_3867));
    float _3879 = -_3781;
    float _3881 = _3869 * _3879;
    float _3883 = trunc(_3843);
    float _3885 = precise::max(_3883, 0.0);
    uint _3887 = uint(_3885);
    float _3889 = fma(_3853, _3845, _3871);
    float _3891 = fma(_3853, _3847, _3873);
    float _3893 = as_type<float>(_3779) * _3877;
    float _3895 = fma(_3801, _3669, _3881);
    int _3897 = ~_3567;
    int _3899 = _3897 + 1;
    out.m_74.x = _3831;
    out.m_74.y = _3845;
    out.m_74.z = _3847;
    int _3901 = ~_3511;
    int _3903 = _3901 + 1;
    float _3905 = trunc(_3827);
    float _3907 = precise::max(_3905, 0.0);
    uint _3909 = uint(_3907);
    int _3911 = int(_3733) + int(_3863);
    float _3913 = -_3769;
    float _3915 = _3869 * _3913;
    float _3917 = -_3785;
    float _3919 = _3869 * _3917;
    float _3921 = fma(_3801, _3645, _3915);
    float _3923 = _3769 + _3875;
    float _3925 = trunc(_3893);
    float _3927 = precise::max(_3925, 0.0);
    uint _3929 = uint(_3927);
    int _3931 = int(_3777) + int(_3887);
    int _3933 = _3899 * _3911;
    int _3935 = _3933 + _3689;
    int _3937 = ~_3637;
    int _3939 = _3937 + 1;
    float _3941 = fma(_3801, _3649, _3919);
    float _3943 = _3781 + _3889;
    int _3945 = _3903 * _3931;
    int _3947 = _3945 + _3681;
    float _3949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3951 = int(_3765) + int(_3909);
    out.m_76.x = _3921;
    out.m_76.y = _3895;
    out.m_76.z = _3941;
    bool _3953 = uint(_3935) >= uint(_3567);
    float _3955 = _3785 + _3891;
    bool _3957 = uint(_3947) >= uint(_3511);
    int _3959 = _3939 * _3951;
    int _3961 = _3959 + _3709;
    bool _3963 = !_3953;
    int _3965 = _3963 ? 0 : (-1);
    float _3967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3969 = int(_3819) + int(_3929);
    out.m_78.x = _3923;
    out.m_78.y = _3943;
    out.m_78.z = _3955;
    bool _3971 = !_3957;
    int _3973 = _3971 ? 0 : (-1);
    int _3975 = ~_3911;
    int _3977 = _3975 + _3965;
    int _3979 = _3977 + 1;
    int _3981 = _3797 * _3969;
    int _3983 = _3981 + _3767;
    bool _3985 = uint(_3961) >= uint(_3637);
    float _3987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3989 = ~_3931;
    int _3991 = _3989 + _3973;
    int _3993 = _3991 + 1;
    int _3995 = _3567 * _3979;
    int _3997 = _3995 + _3689;
    bool _3999 = uint(_3983) >= uint(_3691);
    float _4001 = _3949 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4003 = _3681 ^ _3511;
    int _4005 = _3511 * _3993;
    int _4007 = _4005 + _3681;
    bool _4009 = !_3999;
    int _4011 = _4009 ? 0 : (-1);
    bool _4013 = !_3985;
    int _4015 = _4013 ? 0 : (-1);
    uint _4017 = uint(int(uint(_4003) >> uint(31)));
    int _4019 = ~_4011;
    int _4021 = _3969 + _4019;
    int _4023 = _4021 + 1;
    bool _4025 = _3511 == 0;
    float _4027 = _3987 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4029 = _3689 ^ _3567;
    int _4031 = ~_4015;
    int _4033 = _3951 + _4031;
    int _4035 = _4033 + 1;
    int _4037 = ~int(_4017);
    int _4039 = _4037 + 1;
    uint _4041 = uint(int(uint(_4029) >> uint(31)));
    bool _4043 = !_4025;
    int _4045 = _4043 ? _4007 : (-1);
    int _4047 = _4035 ^ _4039;
    int _4049 = ~int(_4041);
    int _4051 = _4049 + 1;
    float _4053 = float(_4045);
    bool _4055 = _3511 == 0;
    int _4057 = ~_4039;
    int _4059 = _4057 + _4047;
    int _4061 = _4059 + 1;
    float _4063 = fma(_2759, _4053, _1011);
    bool _4065 = _3567 == 0;
    int _4067 = _4023 ^ _4051;
    bool _4069 = !_4055;
    int _4071 = _4069 ? _4061 : (-1);
    bool _4073 = _3567 == 0;
    int _4075 = ~_4051;
    int _4077 = _4075 + _4067;
    int _4079 = _4077 + 1;
    bool _4081 = !_4065;
    int _4083 = _4081 ? _3997 : (-1);
    float _4085 = float(_4071);
    bool _4087 = !_4073;
    int _4089 = _4087 ? _4079 : (-1);
    float _4091 = float(_4083);
    float _4093 = _3851 + 0.5;
    float _4095 = -_1049;
    float _4097 = fma(_4027, _4085, _4095);
    float _4099 = float(_4089);
    float _4101 = _3717 + (-0.5);
    float _4103 = _3967 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4105 = fma(_2759, _4093, _4063);
    float _4107 = fma(_4001, _4091, _1467);
    float _4109 = _3857 + 0.5;
    float _4111 = -_4027;
    float _4113 = fma(_4111, _4101, _4097);
    float _4115 = -_1469;
    float _4117 = fma(_4103, _4099, _4115);
    float _4119 = -_1441;
    float _4121 = _4119 + 1.0;
    float _4123 = _3737 + (-0.5);
    float _4125 = fma(_4001, _4109, _4107);
    float _4127 = _2815 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4129 = -_4121;
    float _4131 = fma(_3851, _4129, _4105);
    float _4133 = -_4103;
    float _4135 = fma(_4133, _4123, _4117);
    float _4137 = -_2674;
    float _4139 = fma(_3857, _4137, _4125);
    float _4141 = _2587 + _2561;
    float _4143 = _2561 * 0.5;
    float _4145 = fma(_2549, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2720);
    float _4147 = _4127 * _2619;
    bool _4149 = _2303 > 0.0;
    bool _4151 = isnan(_2303);
    bool _4153 = _4149 || _4151;
    bool _4155 = isnan(0.0);
    bool _4157 = _4153 || _4155;
    float _4159 = _4141 * 0.5;
    float _4161 = fma(_2591, -0.5, _4143);
    float _4163 = fma(_3737, _2724, _4135);
    float _4165 = -_1457;
    float _4167 = _4165 + 1.0;
    float _4169 = _4145 + _2561;
    float _4171 = _2303 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4173 = _2630 * _4147;
    float _4175 = _2640 * _4147;
    float _4177 = -_4127;
    float _4179 = _4177 + 1.0;
    float _4181 = fma(_3717, _4167, _4113);
    float _4183 = _4169 * 0.5;
    float _4185 = _4171 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4187 = fma(_2636, _4173, _2624);
    float _4189 = fma(_2638, _4173, _2626);
    float _4191 = _2630 * _4179;
    float _4193 = fma(_2630, _4175, _2628);
    out.gl_Position.x = _2587;
    out.gl_Position.y = _2591;
    out.gl_Position.z = _4145;
    out.gl_Position.w = _2561;
    out.m_80.x = _4159;
    out.m_80.y = _4161;
    out.m_80.z = _4183;
    out.m_80.w = _2561;
    out.m_82.x = _4131;
    out.m_82.y = _4181;
    out.m_82.z = _4139;
    out.m_82.w = _4163;
    out.m_47.x = _4185;
    out.m_84.x = _4187;
    out.m_84.y = _4189;
    out.m_84.z = _4193;
    out.m_84.w = _4191;
    if (_4157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4195 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4195;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

