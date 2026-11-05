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
    float4 m_62 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _975 = false;
    bool _819 = false;
    bool _567 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2189 = as_type<float>(_99);
        out.gl_Position.z = _2189;
    }
    if (!_87)
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
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2258 = as_type<float>(_135);
        out.gl_Position.z = _2258;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_47.x;
    float _143 = in.m_47.y;
    float _145 = in.m_47.z;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _159 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _157);
    float _161 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _163 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _159);
    float _165 = _159;
    float _167 = _139;
    float _169 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    if (!_155)
    {
        float _171 = _139 * _139;
        float _173 = _171 * 0.5;
        _165 = _173;
    }
    float _175 = _165;
    float _177 = _175;
    if (!_155)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_137) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_137) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _195);
    bool _203 = !_155;
    float _205 = _181;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _139 * _209;
        float _219 = exp2(_217);
        float _221 = _215 * 0.693147182464599609375;
        float _223 = 1.0 / _221;
        float _225 = 1.0 / _213;
        float _227 = _219 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _223, _139);
        float _233 = _231 * _225;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_155;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _139 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _167 = _259;
    }
    float _261 = _167;
    float _263 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = _263;
    float _271 = _267;
    if (!_155)
    {
        float _273 = _117 * _117;
        float _275 = _273 * 0.5;
        _169 = _275;
    }
    float _277 = _169;
    float _279 = fma(_261, _141, _263);
    float _281 = fma(_261, _143, _265);
    float _283 = fma(_261, _145, _267);
    if (!_155)
    {
        float _285 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _285;
    }
    float _287 = _269;
    bool _289 = !_155;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _117 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _117);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
        _271 = _309;
    }
    float _323 = _291;
    float _325 = _271;
    float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _329 = _325;
    if (!_155)
    {
        _329 = _117;
    }
    float _331 = _329;
    bool _333 = !_155;
    float _335 = _331;
    if (!_333)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _117 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _335 = _355;
    }
    float _357 = _335;
    float _359 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = fma(_357, _143, _327);
    float _363 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = sqrt(_201);
    float _367 = fma(_357, _141, _359);
    float _369 = -_361;
    float _371 = _281 + _369;
    float _373 = fma(_357, _145, _363);
    float _375 = -_367;
    float _377 = _279 + _375;
    float _379 = _371 * _371;
    float _381 = -_373;
    float _383 = _283 + _381;
    float _385 = sqrt(_163);
    float _387 = fma(_377, _377, _379);
    float _389 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _391 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _393 = fma(_383, _383, _387);
    float _395 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _389);
    float _397 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _399 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].y, _391);
    float _401 = sqrt(_393);
    float _403 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _395);
    float _405 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _407 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _409 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].x, _397);
    float _411 = in.m_52.w;
    float _413 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].z, _405);
    float _415 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].w, _407);
    float _417 = sqrt(_403);
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].y, _399);
    float _421 = in.m_42.x;
    float _423 = in.m_42.y;
    float _425 = in.m_42.z;
    float _427 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].x, _409);
    float _429 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].z, _413);
    float _431 = _365 * _419;
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].w, _415);
    float _435 = _385 * _427;
    bool _437 = _401 >= 9.9999999747524270787835121154785e-07;
    bool _439 = isnan(_401);
    bool _441 = _437 || _439;
    bool _443 = isnan(9.9999999747524270787835121154785e-07);
    bool _445 = _441 || _443;
    float _447 = _431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _449 = _431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _451 = _431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].x, _447);
    float _455 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].x, _449);
    float _457 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].x, _451);
    float _459 = _417 * _429;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[24].z, _453);
    float _463 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[25].z, _455);
    float _465 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[26].z, _457);
    float _467 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].w, _461);
    float _469 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].w, _463);
    float _471 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].w, _465);
    float _473 = fma(_279, _411, _421);
    float _475 = fma(_281, _411, _423);
    float _477 = fma(_283, _411, _425);
    float _479 = _465;
    float _481 = _433;
    float _483 = _471;
    if (_445)
    {
        _479 = _467;
    }
    float _485 = _479;
    float _487 = _485;
    if (_445)
    {
        _481 = _469;
    }
    float _489 = _481;
    float _491 = _489;
    if (!_445)
    {
        bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _495 = !_493;
        if (!_495)
        {
            float _497 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _499 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _503 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _497);
            float _505 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _499);
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _505);
            float _513 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _507);
            float _517 = _365 * _509;
            float _519 = _385 * _511;
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _513);
            float _523 = _417 * _515;
            float _525 = _517 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _527 = _517 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _529 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _521);
            float _531 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].x, _525);
            float _533 = _517 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _535 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].x, _527);
            float _537 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _531);
            float _539 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].x, _533);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _535);
            float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].w, _537);
            float _545 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
            float _547 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].w, _541);
            float _549 = _543 * _543;
            float _551 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].w, _545);
            float _553 = fma(_547, _547, _549);
            float _555 = fma(_551, _551, _553);
            float _557 = rsqrt(_555);
            float _559 = _557 * 9.9999999747524270787835121154785e-07;
            float _561 = _547 * _559;
            float _563 = _543 * _559;
            float _565 = _551 * _559;
            _491 = _563;
            _487 = _561;
            _483 = _565;
            _567 = true;
        }
        else
        {
            float _569 = _143 * _143;
            float _571 = fma(_141, _141, _569);
            float _573 = fma(_145, _145, _571);
            float _575 = sqrt(_573);
            bool _577 = _575 >= 9.9999999747524270787835121154785e-07;
            bool _579 = isnan(_575);
            bool _581 = _577 || _579;
            bool _583 = isnan(9.9999999747524270787835121154785e-07);
            bool _585 = _581 || _583;
            if (!_585)
            {
                float _587 = _423 * _423;
                float _589 = fma(_421, _421, _587);
                float _591 = fma(_425, _425, _589);
                float _593 = sqrt(_591);
                bool _595 = _593 >= 9.9999999747524270787835121154785e-07;
                bool _597 = isnan(_593);
                bool _599 = _595 || _597;
                bool _601 = isnan(9.9999999747524270787835121154785e-07);
                bool _603 = _599 || _601;
                if (!_603)
                {
                    float _605 = _365 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _607 = _385 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _609 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _611 = _605 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _613 = _605 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _615 = _605 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _617 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _611);
                    float _619 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
                    float _621 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[26].x, _615);
                    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _617);
                    float _625 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _619);
                    float _627 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _621);
                    float _629 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _623);
                    float _631 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _627);
                    float _635 = _629 * _629;
                    float _637 = fma(_631, _631, _635);
                    float _639 = fma(_633, _633, _637);
                    float _641 = rsqrt(_639);
                    float _643 = _641 * 9.9999999747524270787835121154785e-07;
                    float _645 = _631 * _643;
                    float _647 = _629 * _643;
                    float _649 = _633 * _643;
                    _491 = _647;
                    _487 = _645;
                    _483 = _649;
                    _567 = true;
                }
                else
                {
                    float _651 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _653 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _655 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _657 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _659 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].y, _651);
                    float _661 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].x, _653);
                    float _663 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].z, _655);
                    float _665 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].w, _657);
                    float _667 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].y, _659);
                    float _669 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].x, _661);
                    float _671 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].z, _663);
                    float _673 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].w, _665);
                    float _675 = _365 * _667;
                    float _677 = _385 * _669;
                    float _679 = _417 * _671;
                    float _681 = _675 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _683 = _675 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _685 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[25].x, _681);
                    float _687 = _675 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _689 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[24].x, _683);
                    float _691 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].z, _685);
                    float _693 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[26].x, _687);
                    float _695 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].z, _689);
                    float _697 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[25].w, _691);
                    float _699 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].z, _693);
                    float _701 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[24].w, _695);
                    float _703 = _697 * _697;
                    float _705 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[26].w, _699);
                    float _707 = fma(_701, _701, _703);
                    float _709 = fma(_705, _705, _707);
                    float _711 = rsqrt(_709);
                    float _713 = _711 * 9.9999999747524270787835121154785e-07;
                    float _715 = _701 * _713;
                    float _717 = _697 * _713;
                    float _719 = _705 * _713;
                    _491 = _717;
                    _487 = _715;
                    _483 = _719;
                    _567 = true;
                }
            }
            else
            {
                float _721 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _723 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _725 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _727 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _729 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].y, _721);
                float _731 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].x, _723);
                float _733 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].z, _725);
                float _735 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].w, _727);
                float _737 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].y, _729);
                float _739 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].x, _731);
                float _741 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].z, _733);
                float _743 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].w, _735);
                float _745 = _365 * _737;
                float _747 = _385 * _739;
                float _749 = _417 * _741;
                float _751 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _753 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _757 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
                float _759 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _753);
                float _761 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _755);
                float _763 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].z, _757);
                float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].z, _759);
                float _767 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].z, _761);
                float _769 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].w, _763);
                float _771 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].w, _765);
                float _773 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].w, _767);
                float _775 = _769 * _769;
                float _777 = fma(_771, _771, _775);
                float _779 = fma(_773, _773, _777);
                float _781 = rsqrt(_779);
                float _783 = _781 * 9.9999999747524270787835121154785e-07;
                float _785 = _771 * _783;
                float _787 = _769 * _783;
                float _789 = _773 * _783;
                _491 = _787;
                _487 = _785;
                _483 = _789;
            }
        }
    }
    _567 = false;
    float _791 = _491;
    float _793 = _487;
    float _795 = _483;
    bool _797 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _799 = !_797;
    float _817;
    if (!_799)
    {
        float _801 = in.m_54.x;
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _805 = _801 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _809 = _807 * _803;
        float _811 = floor(_809);
        float _813 = -_811;
        float _815 = _809 + _813;
        _817 = _815;
        _819 = true;
    }
    else
    {
        float _821 = float(_83);
        float _823 = 1.0 / _821;
        float _825 = _117 * _823;
        _817 = _825;
    }
    _819 = false;
    float _827 = _817;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _831 = _827 + _829;
    bool _833 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _835 = isnan(_827);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _847 = _827 + _845;
    bool _849 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _851 = isnan(_827);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _869 = -_843;
    float _871 = _869 + 1.0;
    float _873 = 1.0 / _867;
    bool _875 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _877 = isnan(_827);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = _859 * _871;
    float _889 = -_859;
    float _891 = _889 + 1.0;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _899 = _885 * _891;
    float _901 = 1.0 / _863;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _903;
    float _907 = -_885;
    float _909 = _907 + 1.0;
    float _911 = _847 * _873;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _917 = fma(_895, _911, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _919 = fma(_915, _911, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _921 = _831 * _901;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _923;
    float _927 = in.m_52.x;
    float _929 = in.m_52.y;
    float _931 = fma(_905, _921, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _933 = fma(_925, _921, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _935 = _933 * _899;
    float _937 = _931 * _899;
    float _939 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[143].x, _935);
    float _941 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[143].y, _937);
    float _943 = fma(_919, _887, _939);
    float _945 = fma(_917, _887, _941);
    float _947 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[145].x, _943);
    float _949 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[145].y, _945);
    float _951 = _947 * _927;
    float _953 = _949 * _929;
    bool _955 = !_897;
    float _973;
    if (!_955)
    {
        float _957 = in.m_54.x;
        float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _961 = _957 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _965 = _963 * _959;
        float _967 = floor(_965);
        float _969 = -_967;
        float _971 = _965 + _969;
        _973 = _971;
        _975 = true;
    }
    else
    {
        float _977 = float(_83);
        float _979 = 1.0 / _977;
        float _981 = _117 * _979;
        _973 = _981;
    }
    _975 = false;
    float _983 = _973;
    float _985 = _791 * _791;
    float _987 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    bool _989 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _991 = isnan(0.5);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _997 = _993 || _995;
    float _999 = fma(_793, _793, _985);
    float _1001 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].z, _987);
    float _1003 = fma(_795, _795, _999);
    float _1005 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1001);
    float _1007 = rsqrt(_1003);
    float _1009 = _1005 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1011 = _417 * _1009;
    float _1013 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1017 = _1013 * _1015;
    float _1019 = _1007 * _795;
    float _1021 = _1007 * _793;
    float _1023 = _1007 * _791;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1027 = _1019 * _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1031 = _1021 * _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1035 = _1023 * _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1039 = -_1027;
    float _1041 = fma(_1021, _1037, _1039);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1045 = -_1031;
    float _1047 = fma(_1023, _1043, _1045);
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1051 = -_1035;
    float _1053 = fma(_1019, _1049, _1051);
    float _1055 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1057 = _1041 * _1041;
    float _1059 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1061 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1055);
    float _1063 = fma(_1053, _1053, _1057);
    float _1065 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1067 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1069 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1061);
    float _1071 = fma(_1047, _1047, _1063);
    float _1073 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1065);
    float _1075 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1067);
    float _1077 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1079 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1073);
    float _1081 = rsqrt(_1071);
    float _1083 = _1077 * _1059;
    float _1085 = _1069 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1089 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1075);
    float _1091 = _1083 * _1019;
    float _1093 = _385 * _1085;
    float _1095 = _365 * _1087;
    float _1097 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1101 = _1083 * _1021;
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1105 = _1083 * _1023;
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1103);
    float _1109 = _1041 * _1081;
    float _1111 = _1053 * _1081;
    float _1113 = _1047 * _1081;
    float _1115 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1107);
    float _1117 = _1021 * _1109;
    float _1119 = fma(_1017, _1113, _1091);
    float _1121 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = -_1117;
    float _1125 = fma(_1023, _1111, _1123);
    float _1127 = _1023 * _1113;
    float _1129 = fma(_1097, _1125, _1119);
    float _1131 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1115);
    float _1135 = fma(_1017, _1111, _1101);
    float _1137 = -_1127;
    float _1139 = fma(_1019, _1109, _1137);
    float _1141 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1143 = _1133 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1145 = _1019 * _1111;
    float _1147 = fma(_1097, _1139, _1135);
    float _1149 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1141);
    float _1151 = _1143 + _1129;
    float _1153 = fma(_1017, _1109, _1105);
    float _1155 = -_1145;
    float _1157 = fma(_1021, _1113, _1155);
    float _1159 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1163 = _1151 + _1161;
    float _1165 = fma(_1097, _1157, _1153);
    float _1167 = _1159 + _1147;
    float _1169 = _1163 * _1163;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1173 = _1167 + _1171;
    float _1175 = fma(_1173, _1173, _1169);
    float _1177 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1179 = sqrt(_1175);
    float _1181 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1177);
    float _1183 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1181);
    float _1185 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1183);
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _1189 = _1179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1191 = _1187 + _1165;
    float _1193 = _1153;
    float _1195 = _1165;
    float _1197 = _1105;
    float _1199 = _1179;
    float _1201 = _1113;
    if (!_1189)
    {
        _1193 = _1167;
    }
    float _1203 = _1193;
    float _1205 = _1203;
    if (!_1189)
    {
        _1195 = _1151;
    }
    float _1207 = _1195;
    float _1209 = _1207;
    if (!_1189)
    {
        _1197 = _1191;
    }
    float _1211 = _1197;
    bool _1213 = !_1189;
    float _1215 = _1211;
    if (!_1213)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1221 = _1179 + _1219;
        float _1223 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1225 = rsqrt(_1175);
        float _1227 = _1221 * _1217;
        float _1229 = _1227 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = _1229 * 6.283185482025146484375;
        float _1237 = sin(_1235);
        float _1239 = _1233 + (-1.0);
        float _1241 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = fma(_1237, _1223, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1245 = fma(_1191, _1233, _1241);
        float _1247 = _1225 * _1243;
        float _1249 = fma(_1173, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1251 = fma(_1163, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1209 = _1251;
        _1205 = _1249;
        _1215 = _1245;
    }
    float _1253 = _1209;
    float _1255 = _1205;
    float _1257 = _1215;
    float _1259 = _1257;
    float _1261 = _1255;
    float _1263 = _1253;
    if (!_997)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1267 = _1187 + _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1271 = _1159 + _1269;
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1275 = -_1143;
        float _1277 = _1275 + _1253;
        float _1279 = _1267 * _1267;
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1283 = _1143 + _1281;
        float _1285 = fma(_1271, _1271, _1279);
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1289 = fma(_1283, _1283, _1285);
        float _1291 = sqrt(_1289);
        float _1293 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1295 = precise::min(_1291, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1287;
        float _1299 = -_1159;
        float _1301 = _1299 + _1255;
        float _1303 = _1293 * _1297;
        float _1305 = -_1187;
        float _1307 = _1305 + _1257;
        float _1309 = fma(_1301, _1303, _1159);
        float _1311 = fma(_1307, _1303, _1187);
        float _1313 = fma(_1277, _1303, _1143);
        _1259 = _1311;
        _1261 = _1309;
        _1263 = _1313;
        _1199 = _1287;
    }
    float _1315 = _1259;
    float _1317 = _1261;
    float _1319 = _1263;
    float _1321 = _1199;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1315 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1317 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1319 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = fma(_1333, _1333, _1337);
    float _1341 = rsqrt(_1339);
    float _1343 = sqrt(_1339);
    float _1345 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1347 = _1329 * _1345;
    float _1349 = _1333 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 * _1349;
    float _1355 = _1351 + _1353;
    float _1357 = sqrt(_1355);
    bool _1359 = _1357 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1363 = _1357 + _1361;
    float _1365 = _1333;
    float _1367 = _1355;
    float _1369 = _1363;
    float _1371 = _1321;
    float _1373 = _1325;
    if (_1359)
    {
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1375;
    }
    float _1377 = _1365;
    if (_1359)
    {
        float _1379 = rsqrt(_1355);
        _1367 = _1379;
    }
    float _1381 = _1367;
    float _1383 = _1381;
    if (_1359)
    {
        float _1385 = _1363 * _1377;
        _1369 = _1385;
    }
    float _1387 = _1369;
    if (_1359)
    {
        float _1389 = _1387 * 0.15915493667125701904296875;
        _1371 = _1389;
    }
    float _1391 = _1371;
    float _1393 = _1377;
    float _1395 = _1391;
    if (_1359)
    {
        float _1397 = _1391 * 6.283185482025146484375;
        float _1399 = sin(_1397);
        _1393 = _1399;
    }
    float _1401 = _1393;
    float _1403 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1405 = precise::max(0.0, _1403);
    float _1407 = _1335;
    float _1409 = _1405;
    if (_1359)
    {
        float _1411 = _1391 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        _1407 = _1413;
    }
    float _1415 = _1407;
    float _1417 = -_1345;
    float _1419 = -_1405;
    float _1421 = fma(_1325, _1417, _1419);
    if (_1359)
    {
        float _1423 = _1421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1409 = _1423;
    }
    float _1425 = _1409;
    float _1427 = _1401;
    float _1429 = _1425;
    if (_1359)
    {
        float _1431 = fma(_1401, _1425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1373 = _1431;
    }
    float _1433 = _1373;
    float _1435 = _1433;
    if (!_1359)
    {
        _1427 = _1347;
    }
    float _1437 = _1427;
    float _1439 = _1437;
    float _1441 = _1415;
    if (_1359)
    {
        float _1443 = _1415 + (-1.0);
        _1429 = _1443;
    }
    float _1445 = _1429;
    float _1447 = _1445;
    if (_1359)
    {
        float _1449 = _1381 * _1433;
        _1201 = _1449;
    }
    float _1451 = _1201;
    if (!_1359)
    {
        _1435 = _1421;
    }
    float _1453 = _1435;
    float _1455 = _1453;
    if (_1359)
    {
        float _1457 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1395 = _1457;
    }
    float _1459 = _1395;
    if (_1359)
    {
        float _1461 = _1347 * _1451;
        _1439 = _1461;
    }
    float _1463 = _1439;
    if (!_1359)
    {
        _1447 = _1349;
    }
    float _1465 = _1447;
    float _1467 = _1465;
    if (_1359)
    {
        float _1469 = _1349 * _1451;
        _1467 = _1469;
    }
    float _1471 = _1467;
    if (!_1359)
    {
        _1383 = _1351;
    }
    float _1473 = _1383;
    float _1475 = _1473;
    if (_1359)
    {
        float _1477 = fma(_1421, _1415, _1459);
        _1455 = _1477;
    }
    float _1479 = _1455;
    if (_1359)
    {
        float _1481 = _1463 * _1463;
        _1475 = _1481;
    }
    float _1483 = _1475;
    if (!_1359)
    {
        _1441 = _1353;
    }
    float _1485 = _1441;
    float _1487 = _1485;
    if (_1359)
    {
        float _1489 = _1471 * _1471;
        _1487 = _1489;
    }
    float _1491 = _1487;
    float _1493 = fma(_1479, _1479, _1483);
    float _1495 = _1493 + _1491;
    float _1497 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1501 = fma(_1343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1499);
    float _1503 = precise::clamp(_1501, 0.0, 1.0);
    float _1505 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1507 = rsqrt(_1495);
    float _1509 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1497);
    float _1511 = -_1503;
    float _1513 = _1511 + 1.0;
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1505);
    float _1517 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1519 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1509);
    float _1521 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1523 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1525 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1515);
    float _1527 = abs(_1513);
    float _1529 = log2(_1527);
    float _1531 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1521);
    float _1533 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1523);
    float _1535 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1537 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1539 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1531);
    float _1541 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1533);
    float _1543 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1545 = _1507 * _1463;
    float _1547 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1549 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1551 = _1507 * _1479;
    float _1553 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1555 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1543);
    float _1557 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1559 = _1507 * _1471;
    float _1561 = -_1553;
    float _1563 = fma(_1561, _1517, 1.0);
    float _1565 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1555);
    float _1567 = -_1557;
    float _1569 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1567);
    float _1571 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1573 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1565);
    float _1577 = -_1559;
    float _1579 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1569);
    float _1581 = log2(_1563);
    float _1583 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1585 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1573);
    float _1587 = fma(_1579, -0.5, 0.5);
    float _1589 = fma(_1579, 0.5, 0.5);
    float _1591 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1583);
    float _1593 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1585);
    float _1595 = _1551 + 1.0;
    float _1597 = 1.0 / _1575;
    float _1599 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1591);
    float _1601 = exp2(_1571);
    float _1603 = _1581 * 0.693147182464599609375;
    float _1605 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1607 = sqrt(_1587);
    float _1609 = fma(_1589, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1611 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1593);
    float _1613 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1599);
    float _1615 = fma(_1589, _1609, -0.212114393711090087890625);
    float _1617 = _1611 * _1597;
    float _1619 = _1613 * _1597;
    float _1621 = -_1551;
    float _1623 = fma(_1601, _1595, _1621);
    float _1625 = fma(_1589, _1615, 1.570728778839111328125);
    float _1627 = fma(_1617, 0.5, 0.5);
    float _1629 = fma(_1619, -0.5, 0.5);
    float _1631 = fma(_1623, 0.5, 0.5);
    float _1633 = _1607 * 0.636619746685028076171875;
    float3 _4852 = float3(_1627, _1629, _1605);
    float _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4852, float3(0.0), isnan(_4852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4852, float3(0.0), isnan(_4852)), level(0.0)).x;
    float _1637 = -_1625;
    float _1639 = fma(_1633, _1637, 1.0);
    float3 _4868 = float3(_1627, _1629, _1605);
    float4 _1642 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4868, float3(0.0), isnan(_4868)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4868, float3(0.0), isnan(_4868)), level(0.0)).xyzw;
    float _1644 = _1642.x;
    float _1646 = _1642.y;
    float _1648 = _1642.z;
    float _1650 = _1642.w;
    float2 _4885 = float2(_1639, _1631);
    float3 _1654 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4885, float2(0.0), isnan(_4885)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4885, float2(0.0), isnan(_4885)), level(0.0)).xyz;
    float _1656 = _1654.x;
    float _1658 = _1654.y;
    float _1660 = _1654.z;
    float _1662 = in.m_54.x;
    float _1664 = in.m_54.y;
    float _1666 = in.m_54.z;
    float _1668 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1670 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1672 = isnan(0.5);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1678 = _1674 || _1676;
    float _1680 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1686 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1688 = 1.0 / _1684;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1692 = _1690 != 0;
    float _1694 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1698 = _1696 != 0;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1706 = 1.0 / _1702;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1712 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1694);
    float _1714 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1716 = _1662 > 0.5;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1722 = _1720 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1724 = -_1704;
    float _1726 = fma(_1714, 2.0, _1724);
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1730 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1718);
    float _1732 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1728);
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1736 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1738 = 1.0 / _1722;
    float _1740 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1712);
    float _1742 = fma(_1736, -2.0, _1734);
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1744;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1752;
    bool _1756 = _1664 > 0.5;
    float _1758 = 1.0 / _1710;
    float _1760 = _1750 * _1706;
    float _1762 = -_193;
    int _1764 = _1716 ? as_type<int>(_1762) : as_type<int>(_193);
    bool _1766 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1768 = isnan(_983);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    bool _1778 = !_1692;
    float _1780 = _1778 ? _193 : as_type<float>(_1764);
    bool _1782 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1784 = isnan(_983);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1796 = _1746 * _1688;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1800 = _1798 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1802 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1730);
    float _1804 = -_1792;
    float _1806 = _1804 + 1.0;
    float _1808 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1794);
    float _1810 = _1800 * _1738;
    float _1812 = _1802 * (-0.15915493667125701904296875);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1816 = _983 + _1814;
    float _1818 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1742);
    bool _1820 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1822 = isnan(_983);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1828 = _1824 || _1826;
    float _1830 = float(_1828);
    float _1832 = _1754 * _1758;
    float _1834 = fma(_1796, _1816, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1838 = _983 + _1836;
    bool _1840 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1842 = isnan(_983);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = _1830 * _1806;
    float _1854 = -_1830;
    float _1856 = _1854 + 1.0;
    float _1858 = -_199;
    int _1860 = _1756 ? as_type<int>(_1858) : as_type<int>(_199);
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1864 = _983 + _1862;
    float _1866 = fma(_1832, _1838, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1868 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1732);
    float _1870 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1668);
    float _1872 = -_1850;
    float _1874 = _1872 + 1.0;
    bool _1876 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1878 = isnan(_983);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    float _1888 = fma(_1760, _1864, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1890 = !_1698;
    float _1892 = _1890 ? _199 : as_type<float>(_1860);
    float _1894 = -_117;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1726);
    float _1898 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1870);
    float _1900 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1808);
    float _1902 = _1792 * _1874;
    float _1904 = _1886 * _1856;
    float _1906 = _1812 * 6.283185482025146484375;
    float _1908 = sin(_1906);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1912 = _983 + _1910;
    float _1914 = -_1886;
    float _1916 = _1914 + 1.0;
    float _1918 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1920 = -_1900;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_1810, _1912, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1926 = _1776 * _1916;
    float _1928 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1680);
    float _1930 = _1812 * 6.283185482025146484375;
    float _1932 = cos(_1930);
    float _1934 = -_1776;
    float _1936 = _1934 + 1.0;
    float _1938 = _1834 * _1926;
    float _1940 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1928);
    float _1942 = fma(_1936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1938);
    float _1944 = _1940 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1946 = 1.0 / _1918;
    float _1948 = _1892 * _1908;
    float _1950 = fma(_1888, _1904, _1942);
    float _1952 = _1944 + _1918;
    float _1954 = fma(_1866, _1852, _1950);
    float _1956 = _1866;
    float _1958 = _1780;
    float _1960 = _1818;
    if (!_1678)
    {
        _1956 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1962 = _1956;
    float _1964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1966 = _1892 * _1932;
    float _1968 = -_1948;
    float _1970 = fma(_1780, _1932, _1968);
    float _1972 = fma(_1924, _1902, _1954);
    float _1974 = fma(_1780, _1908, _1966);
    if (!_1678)
    {
        _1958 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1976 = _1958;
    float _1978 = _1970 + 0.5;
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1982 = _1952 * _1946;
    float _1984 = _1982 * 0.5;
    float _1986 = _1974 + (-0.5);
    float _1988 = _1976;
    if (!_1678)
    {
        float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1992 = fma(_1984, _1976, _1990);
        _1988 = _1992;
    }
    float _1994 = _1988;
    float _1996 = -_1868;
    float _1998 = _1996 + 1.0;
    float _2000 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2002 = exp2(_1686);
    float _2004 = -_2000;
    float _2006 = -_1818;
    float _2008 = fma(_2004, _1986, _2006);
    float _2010 = _1998;
    if (!_1678)
    {
        float _2012 = -_1962;
        float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1960 = _2014;
    }
    float _2016 = _1960;
    float _2018 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2020 = _1994;
    if (!_1678)
    {
        float _2022 = 1.0 / _1994;
        _2020 = _2022;
    }
    float _2024 = _2020;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2028 = fma(_2018, _1978, _1896);
    float _2030 = fma(_1974, _1922, _2008);
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2036 = _2016;
    float _2038 = _2032;
    if (!_1678)
    {
        float _2040 = 1.0 / _2016;
        _2036 = _2040;
    }
    float _2042 = _2036;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2046 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = -_1998;
    float _2050 = fma(_1970, _2048, _2028);
    float _2052 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = -_2002;
    float _2056 = _2054 + 1.0;
    if (_1678)
    {
        _2010 = 1.0;
    }
    float _2058 = _2010;
    float _2060 = _2058;
    if (!_1678)
    {
        float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2064 = -_1962;
        float _2066 = fma(_2024, _2062, _2064);
        _2038 = _2066;
    }
    float _2068 = _2038;
    out.m_56.x = _2034;
    out.m_56.y = _2052;
    out.m_56.z = _2046;
    float _2070 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2072 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1972);
    out.m_58.x = _2050;
    out.m_58.y = _2030;
    if (!_1678)
    {
        float _2074 = _2068 * _2042;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        _2060 = _2076;
    }
    float _2078 = _2060;
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2082 = _2078 > 0.0;
    bool _2084 = isnan(_2078);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan(0.0);
    bool _2090 = _2086 || _2088;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2094 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1740);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2098 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2100 = _2094 + _1575;
    out.gl_Position.x = _1611;
    out.gl_Position.y = _1613;
    out.gl_Position.z = _2094;
    out.gl_Position.w = _1575;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2106 = _2100 * 0.5;
    float _2108 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2110 = _2098 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2112 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.z = _2106;
    out.m_60.w = _1575;
    out.m_62.x = _2102;
    out.m_62.y = _2108;
    out.m_62.z = _2112;
    out.m_62.w = _2080;
    out.m_45.x = _2110;
    float _2114 = _2070 * _1635;
    float _2116 = -_2070;
    float _2118 = _2116 + 1.0;
    float _2120 = _1650 * _2114;
    float _2122 = _1660 * _2114;
    float _2124 = fma(_1656, _2120, _1644);
    float _2126 = fma(_1658, _2120, _1646);
    float _2128 = _1650 * _2118;
    float _2130 = fma(_1650, _2122, _1648);
    out.m_64.x = _2124;
    out.m_64.y = _2126;
    out.m_64.z = _2130;
    out.m_64.w = _2128;
    if (_2090)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2132;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _975 = false;
    bool _819 = false;
    bool _567 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2189 = as_type<float>(_99);
        out.gl_Position.z = _2189;
    }
    if (!_87)
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
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2258 = as_type<float>(_135);
        out.gl_Position.z = _2258;
    }
    if (_127)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_47.x;
    float _143 = in.m_47.y;
    float _145 = in.m_47.z;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _159 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _157);
    float _161 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _163 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _159);
    float _165 = _159;
    float _167 = _139;
    float _169 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    if (!_155)
    {
        float _171 = _139 * _139;
        float _173 = _171 * 0.5;
        _165 = _173;
    }
    float _175 = _165;
    float _177 = _175;
    if (!_155)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_137) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_137) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _195);
    bool _203 = !_155;
    float _205 = _181;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _139 * _209;
        float _219 = exp2(_217);
        float _221 = _215 * 0.693147182464599609375;
        float _223 = 1.0 / _221;
        float _225 = 1.0 / _213;
        float _227 = _219 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _223, _139);
        float _233 = _231 * _225;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_155;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _139 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _167 = _259;
    }
    float _261 = _167;
    float _263 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = _263;
    float _271 = _267;
    if (!_155)
    {
        float _273 = _117 * _117;
        float _275 = _273 * 0.5;
        _169 = _275;
    }
    float _277 = _169;
    float _279 = fma(_261, _141, _263);
    float _281 = fma(_261, _143, _265);
    float _283 = fma(_261, _145, _267);
    if (!_155)
    {
        float _285 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _285;
    }
    float _287 = _269;
    bool _289 = !_155;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _117 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _117);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
        _271 = _309;
    }
    float _323 = _291;
    float _325 = _271;
    float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _329 = _325;
    if (!_155)
    {
        _329 = _117;
    }
    float _331 = _329;
    bool _333 = !_155;
    float _335 = _331;
    if (!_333)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _117 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _335 = _355;
    }
    float _357 = _335;
    float _359 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = fma(_357, _143, _327);
    float _363 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = sqrt(_201);
    float _367 = fma(_357, _141, _359);
    float _369 = -_361;
    float _371 = _281 + _369;
    float _373 = fma(_357, _145, _363);
    float _375 = -_367;
    float _377 = _279 + _375;
    float _379 = _371 * _371;
    float _381 = -_373;
    float _383 = _283 + _381;
    float _385 = sqrt(_163);
    float _387 = fma(_377, _377, _379);
    float _389 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _391 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _393 = fma(_383, _383, _387);
    float _395 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _389);
    float _397 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _399 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].y, _391);
    float _401 = sqrt(_393);
    float _403 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _395);
    float _405 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _407 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _409 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].x, _397);
    float _411 = in.m_52.w;
    float _413 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].z, _405);
    float _415 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].w, _407);
    float _417 = sqrt(_403);
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].y, _399);
    float _421 = in.m_42.x;
    float _423 = in.m_42.y;
    float _425 = in.m_42.z;
    float _427 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].x, _409);
    float _429 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].z, _413);
    float _431 = _365 * _419;
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].w, _415);
    float _435 = _385 * _427;
    bool _437 = _401 >= 9.9999999747524270787835121154785e-07;
    bool _439 = isnan(_401);
    bool _441 = _437 || _439;
    bool _443 = isnan(9.9999999747524270787835121154785e-07);
    bool _445 = _441 || _443;
    float _447 = _431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _449 = _431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _451 = _431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].x, _447);
    float _455 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].x, _449);
    float _457 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].x, _451);
    float _459 = _417 * _429;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[24].z, _453);
    float _463 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[25].z, _455);
    float _465 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[26].z, _457);
    float _467 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].w, _461);
    float _469 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].w, _463);
    float _471 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].w, _465);
    float _473 = fma(_279, _411, _421);
    float _475 = fma(_281, _411, _423);
    float _477 = fma(_283, _411, _425);
    float _479 = _465;
    float _481 = _433;
    float _483 = _471;
    if (_445)
    {
        _479 = _467;
    }
    float _485 = _479;
    float _487 = _485;
    if (_445)
    {
        _481 = _469;
    }
    float _489 = _481;
    float _491 = _489;
    if (!_445)
    {
        bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _495 = !_493;
        if (!_495)
        {
            float _497 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _499 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _503 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _497);
            float _505 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _499);
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _505);
            float _513 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _507);
            float _517 = _365 * _509;
            float _519 = _385 * _511;
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _513);
            float _523 = _417 * _515;
            float _525 = _517 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _527 = _517 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _529 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _521);
            float _531 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].x, _525);
            float _533 = _517 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _535 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].x, _527);
            float _537 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _531);
            float _539 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].x, _533);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _535);
            float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].w, _537);
            float _545 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
            float _547 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].w, _541);
            float _549 = _543 * _543;
            float _551 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].w, _545);
            float _553 = fma(_547, _547, _549);
            float _555 = fma(_551, _551, _553);
            float _557 = rsqrt(_555);
            float _559 = _557 * 9.9999999747524270787835121154785e-07;
            float _561 = _547 * _559;
            float _563 = _543 * _559;
            float _565 = _551 * _559;
            _491 = _563;
            _487 = _561;
            _483 = _565;
            _567 = true;
        }
        else
        {
            float _569 = _143 * _143;
            float _571 = fma(_141, _141, _569);
            float _573 = fma(_145, _145, _571);
            float _575 = sqrt(_573);
            bool _577 = _575 >= 9.9999999747524270787835121154785e-07;
            bool _579 = isnan(_575);
            bool _581 = _577 || _579;
            bool _583 = isnan(9.9999999747524270787835121154785e-07);
            bool _585 = _581 || _583;
            if (!_585)
            {
                float _587 = _423 * _423;
                float _589 = fma(_421, _421, _587);
                float _591 = fma(_425, _425, _589);
                float _593 = sqrt(_591);
                bool _595 = _593 >= 9.9999999747524270787835121154785e-07;
                bool _597 = isnan(_593);
                bool _599 = _595 || _597;
                bool _601 = isnan(9.9999999747524270787835121154785e-07);
                bool _603 = _599 || _601;
                if (!_603)
                {
                    float _605 = _365 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _607 = _385 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _609 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _611 = _605 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _613 = _605 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _615 = _605 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _617 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _611);
                    float _619 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
                    float _621 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[26].x, _615);
                    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _617);
                    float _625 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _619);
                    float _627 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _621);
                    float _629 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _623);
                    float _631 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _627);
                    float _635 = _629 * _629;
                    float _637 = fma(_631, _631, _635);
                    float _639 = fma(_633, _633, _637);
                    float _641 = rsqrt(_639);
                    float _643 = _641 * 9.9999999747524270787835121154785e-07;
                    float _645 = _631 * _643;
                    float _647 = _629 * _643;
                    float _649 = _633 * _643;
                    _491 = _647;
                    _487 = _645;
                    _483 = _649;
                    _567 = true;
                }
                else
                {
                    float _651 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _653 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _655 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _657 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _659 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].y, _651);
                    float _661 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].x, _653);
                    float _663 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].z, _655);
                    float _665 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].w, _657);
                    float _667 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].y, _659);
                    float _669 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].x, _661);
                    float _671 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].z, _663);
                    float _673 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].w, _665);
                    float _675 = _365 * _667;
                    float _677 = _385 * _669;
                    float _679 = _417 * _671;
                    float _681 = _675 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _683 = _675 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _685 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[25].x, _681);
                    float _687 = _675 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _689 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[24].x, _683);
                    float _691 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].z, _685);
                    float _693 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[26].x, _687);
                    float _695 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].z, _689);
                    float _697 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[25].w, _691);
                    float _699 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].z, _693);
                    float _701 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[24].w, _695);
                    float _703 = _697 * _697;
                    float _705 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[26].w, _699);
                    float _707 = fma(_701, _701, _703);
                    float _709 = fma(_705, _705, _707);
                    float _711 = rsqrt(_709);
                    float _713 = _711 * 9.9999999747524270787835121154785e-07;
                    float _715 = _701 * _713;
                    float _717 = _697 * _713;
                    float _719 = _705 * _713;
                    _491 = _717;
                    _487 = _715;
                    _483 = _719;
                    _567 = true;
                }
            }
            else
            {
                float _721 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _723 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _725 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _727 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _729 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].y, _721);
                float _731 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].x, _723);
                float _733 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].z, _725);
                float _735 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].w, _727);
                float _737 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].y, _729);
                float _739 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].x, _731);
                float _741 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].z, _733);
                float _743 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].w, _735);
                float _745 = _365 * _737;
                float _747 = _385 * _739;
                float _749 = _417 * _741;
                float _751 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _753 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _757 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
                float _759 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _753);
                float _761 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _755);
                float _763 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].z, _757);
                float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].z, _759);
                float _767 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].z, _761);
                float _769 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].w, _763);
                float _771 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].w, _765);
                float _773 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].w, _767);
                float _775 = _769 * _769;
                float _777 = fma(_771, _771, _775);
                float _779 = fma(_773, _773, _777);
                float _781 = rsqrt(_779);
                float _783 = _781 * 9.9999999747524270787835121154785e-07;
                float _785 = _771 * _783;
                float _787 = _769 * _783;
                float _789 = _773 * _783;
                _491 = _787;
                _487 = _785;
                _483 = _789;
            }
        }
    }
    _567 = false;
    float _791 = _491;
    float _793 = _487;
    float _795 = _483;
    bool _797 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _799 = !_797;
    float _817;
    if (!_799)
    {
        float _801 = in.m_54.x;
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _805 = _801 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _809 = _807 * _803;
        float _811 = floor(_809);
        float _813 = -_811;
        float _815 = _809 + _813;
        _817 = _815;
        _819 = true;
    }
    else
    {
        float _821 = float(_83);
        float _823 = 1.0 / _821;
        float _825 = _117 * _823;
        _817 = _825;
    }
    _819 = false;
    float _827 = _817;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _831 = _827 + _829;
    bool _833 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _835 = isnan(_827);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _847 = _827 + _845;
    bool _849 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _851 = isnan(_827);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _869 = -_843;
    float _871 = _869 + 1.0;
    float _873 = 1.0 / _867;
    bool _875 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _877 = isnan(_827);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = _859 * _871;
    float _889 = -_859;
    float _891 = _889 + 1.0;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _899 = _885 * _891;
    float _901 = 1.0 / _863;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _903;
    float _907 = -_885;
    float _909 = _907 + 1.0;
    float _911 = _847 * _873;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _917 = fma(_895, _911, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _919 = fma(_915, _911, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _921 = _831 * _901;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _923;
    float _927 = in.m_52.x;
    float _929 = in.m_52.y;
    float _931 = fma(_905, _921, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _933 = fma(_925, _921, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _935 = _933 * _899;
    float _937 = _931 * _899;
    float _939 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[143].x, _935);
    float _941 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[143].y, _937);
    float _943 = fma(_919, _887, _939);
    float _945 = fma(_917, _887, _941);
    float _947 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[145].x, _943);
    float _949 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[145].y, _945);
    float _951 = _947 * _927;
    float _953 = _949 * _929;
    bool _955 = !_897;
    float _973;
    if (!_955)
    {
        float _957 = in.m_54.x;
        float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _961 = _957 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _965 = _963 * _959;
        float _967 = floor(_965);
        float _969 = -_967;
        float _971 = _965 + _969;
        _973 = _971;
        _975 = true;
    }
    else
    {
        float _977 = float(_83);
        float _979 = 1.0 / _977;
        float _981 = _117 * _979;
        _973 = _981;
    }
    _975 = false;
    float _983 = _973;
    float _985 = _791 * _791;
    float _987 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    bool _989 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _991 = isnan(0.5);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _997 = _993 || _995;
    float _999 = fma(_793, _793, _985);
    float _1001 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].z, _987);
    float _1003 = fma(_795, _795, _999);
    float _1005 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1001);
    float _1007 = rsqrt(_1003);
    float _1009 = _1005 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1011 = _417 * _1009;
    float _1013 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1017 = _1013 * _1015;
    float _1019 = _1007 * _795;
    float _1021 = _1007 * _793;
    float _1023 = _1007 * _791;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1027 = _1019 * _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1031 = _1021 * _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1035 = _1023 * _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1039 = -_1027;
    float _1041 = fma(_1021, _1037, _1039);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1045 = -_1031;
    float _1047 = fma(_1023, _1043, _1045);
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1051 = -_1035;
    float _1053 = fma(_1019, _1049, _1051);
    float _1055 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1057 = _1041 * _1041;
    float _1059 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1061 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1055);
    float _1063 = fma(_1053, _1053, _1057);
    float _1065 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1067 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1069 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1061);
    float _1071 = fma(_1047, _1047, _1063);
    float _1073 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1065);
    float _1075 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1067);
    float _1077 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1079 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1073);
    float _1081 = rsqrt(_1071);
    float _1083 = _1077 * _1059;
    float _1085 = _1069 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1089 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1075);
    float _1091 = _1083 * _1019;
    float _1093 = _385 * _1085;
    float _1095 = _365 * _1087;
    float _1097 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1101 = _1083 * _1021;
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1105 = _1083 * _1023;
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1103);
    float _1109 = _1041 * _1081;
    float _1111 = _1053 * _1081;
    float _1113 = _1047 * _1081;
    float _1115 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1107);
    float _1117 = _1021 * _1109;
    float _1119 = fma(_1017, _1113, _1091);
    float _1121 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = -_1117;
    float _1125 = fma(_1023, _1111, _1123);
    float _1127 = _1023 * _1113;
    float _1129 = fma(_1097, _1125, _1119);
    float _1131 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1115);
    float _1135 = fma(_1017, _1111, _1101);
    float _1137 = -_1127;
    float _1139 = fma(_1019, _1109, _1137);
    float _1141 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1143 = _1133 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1145 = _1019 * _1111;
    float _1147 = fma(_1097, _1139, _1135);
    float _1149 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1141);
    float _1151 = _1143 + _1129;
    float _1153 = fma(_1017, _1109, _1105);
    float _1155 = -_1145;
    float _1157 = fma(_1021, _1113, _1155);
    float _1159 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1163 = _1151 + _1161;
    float _1165 = fma(_1097, _1157, _1153);
    float _1167 = _1159 + _1147;
    float _1169 = _1163 * _1163;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1173 = _1167 + _1171;
    float _1175 = fma(_1173, _1173, _1169);
    float _1177 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1179 = sqrt(_1175);
    float _1181 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1177);
    float _1183 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1181);
    float _1185 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1183);
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _1189 = _1179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1191 = _1187 + _1165;
    float _1193 = _1153;
    float _1195 = _1165;
    float _1197 = _1105;
    float _1199 = _1179;
    float _1201 = _1113;
    if (!_1189)
    {
        _1193 = _1167;
    }
    float _1203 = _1193;
    float _1205 = _1203;
    if (!_1189)
    {
        _1195 = _1151;
    }
    float _1207 = _1195;
    float _1209 = _1207;
    if (!_1189)
    {
        _1197 = _1191;
    }
    float _1211 = _1197;
    bool _1213 = !_1189;
    float _1215 = _1211;
    if (!_1213)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1221 = _1179 + _1219;
        float _1223 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1225 = rsqrt(_1175);
        float _1227 = _1221 * _1217;
        float _1229 = _1227 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = _1229 * 6.283185482025146484375;
        float _1237 = sin(_1235);
        float _1239 = _1233 + (-1.0);
        float _1241 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = fma(_1237, _1223, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1245 = fma(_1191, _1233, _1241);
        float _1247 = _1225 * _1243;
        float _1249 = fma(_1173, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1251 = fma(_1163, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1209 = _1251;
        _1205 = _1249;
        _1215 = _1245;
    }
    float _1253 = _1209;
    float _1255 = _1205;
    float _1257 = _1215;
    float _1259 = _1257;
    float _1261 = _1255;
    float _1263 = _1253;
    if (!_997)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1267 = _1187 + _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1271 = _1159 + _1269;
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1275 = -_1143;
        float _1277 = _1275 + _1253;
        float _1279 = _1267 * _1267;
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1283 = _1143 + _1281;
        float _1285 = fma(_1271, _1271, _1279);
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1289 = fma(_1283, _1283, _1285);
        float _1291 = sqrt(_1289);
        float _1293 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1295 = precise::min(_1291, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1287;
        float _1299 = -_1159;
        float _1301 = _1299 + _1255;
        float _1303 = _1293 * _1297;
        float _1305 = -_1187;
        float _1307 = _1305 + _1257;
        float _1309 = fma(_1301, _1303, _1159);
        float _1311 = fma(_1307, _1303, _1187);
        float _1313 = fma(_1277, _1303, _1143);
        _1259 = _1311;
        _1261 = _1309;
        _1263 = _1313;
        _1199 = _1287;
    }
    float _1315 = _1259;
    float _1317 = _1261;
    float _1319 = _1263;
    float _1321 = _1199;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1315 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1317 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1319 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = fma(_1333, _1333, _1337);
    float _1341 = rsqrt(_1339);
    float _1343 = sqrt(_1339);
    float _1345 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1347 = _1329 * _1345;
    float _1349 = _1333 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 * _1349;
    float _1355 = _1351 + _1353;
    float _1357 = sqrt(_1355);
    bool _1359 = _1357 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1363 = _1357 + _1361;
    float _1365 = _1333;
    float _1367 = _1355;
    float _1369 = _1363;
    float _1371 = _1321;
    float _1373 = _1325;
    if (_1359)
    {
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1375;
    }
    float _1377 = _1365;
    if (_1359)
    {
        float _1379 = rsqrt(_1355);
        _1367 = _1379;
    }
    float _1381 = _1367;
    float _1383 = _1381;
    if (_1359)
    {
        float _1385 = _1363 * _1377;
        _1369 = _1385;
    }
    float _1387 = _1369;
    if (_1359)
    {
        float _1389 = _1387 * 0.15915493667125701904296875;
        _1371 = _1389;
    }
    float _1391 = _1371;
    float _1393 = _1377;
    float _1395 = _1391;
    if (_1359)
    {
        float _1397 = _1391 * 6.283185482025146484375;
        float _1399 = sin(_1397);
        _1393 = _1399;
    }
    float _1401 = _1393;
    float _1403 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1405 = precise::max(0.0, _1403);
    float _1407 = _1335;
    float _1409 = _1405;
    if (_1359)
    {
        float _1411 = _1391 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        _1407 = _1413;
    }
    float _1415 = _1407;
    float _1417 = -_1345;
    float _1419 = -_1405;
    float _1421 = fma(_1325, _1417, _1419);
    if (_1359)
    {
        float _1423 = _1421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1409 = _1423;
    }
    float _1425 = _1409;
    float _1427 = _1401;
    float _1429 = _1425;
    if (_1359)
    {
        float _1431 = fma(_1401, _1425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1373 = _1431;
    }
    float _1433 = _1373;
    float _1435 = _1433;
    if (!_1359)
    {
        _1427 = _1347;
    }
    float _1437 = _1427;
    float _1439 = _1437;
    float _1441 = _1415;
    if (_1359)
    {
        float _1443 = _1415 + (-1.0);
        _1429 = _1443;
    }
    float _1445 = _1429;
    float _1447 = _1445;
    if (_1359)
    {
        float _1449 = _1381 * _1433;
        _1201 = _1449;
    }
    float _1451 = _1201;
    if (!_1359)
    {
        _1435 = _1421;
    }
    float _1453 = _1435;
    float _1455 = _1453;
    if (_1359)
    {
        float _1457 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1395 = _1457;
    }
    float _1459 = _1395;
    if (_1359)
    {
        float _1461 = _1347 * _1451;
        _1439 = _1461;
    }
    float _1463 = _1439;
    if (!_1359)
    {
        _1447 = _1349;
    }
    float _1465 = _1447;
    float _1467 = _1465;
    if (_1359)
    {
        float _1469 = _1349 * _1451;
        _1467 = _1469;
    }
    float _1471 = _1467;
    if (!_1359)
    {
        _1383 = _1351;
    }
    float _1473 = _1383;
    float _1475 = _1473;
    if (_1359)
    {
        float _1477 = fma(_1421, _1415, _1459);
        _1455 = _1477;
    }
    float _1479 = _1455;
    if (_1359)
    {
        float _1481 = _1463 * _1463;
        _1475 = _1481;
    }
    float _1483 = _1475;
    if (!_1359)
    {
        _1441 = _1353;
    }
    float _1485 = _1441;
    float _1487 = _1485;
    if (_1359)
    {
        float _1489 = _1471 * _1471;
        _1487 = _1489;
    }
    float _1491 = _1487;
    float _1493 = fma(_1479, _1479, _1483);
    float _1495 = _1493 + _1491;
    float _1497 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1501 = fma(_1343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1499);
    float _1503 = precise::clamp(_1501, 0.0, 1.0);
    float _1505 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1507 = rsqrt(_1495);
    float _1509 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1497);
    float _1511 = -_1503;
    float _1513 = _1511 + 1.0;
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1505);
    float _1517 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1519 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1509);
    float _1521 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1523 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1525 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1515);
    float _1527 = abs(_1513);
    float _1529 = log2(_1527);
    float _1531 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1521);
    float _1533 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1523);
    float _1535 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1537 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1539 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1531);
    float _1541 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1533);
    float _1543 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1545 = _1507 * _1463;
    float _1547 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1549 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1551 = _1507 * _1479;
    float _1553 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1555 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1543);
    float _1557 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1559 = _1507 * _1471;
    float _1561 = -_1553;
    float _1563 = fma(_1561, _1517, 1.0);
    float _1565 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1555);
    float _1567 = -_1557;
    float _1569 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1567);
    float _1571 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1573 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1565);
    float _1577 = -_1559;
    float _1579 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1569);
    float _1581 = log2(_1563);
    float _1583 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1585 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1573);
    float _1587 = fma(_1579, -0.5, 0.5);
    float _1589 = fma(_1579, 0.5, 0.5);
    float _1591 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1583);
    float _1593 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1585);
    float _1595 = _1551 + 1.0;
    float _1597 = 1.0 / _1575;
    float _1599 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1591);
    float _1601 = exp2(_1571);
    float _1603 = _1581 * 0.693147182464599609375;
    float _1605 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1607 = sqrt(_1587);
    float _1609 = fma(_1589, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1611 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1593);
    float _1613 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1599);
    float _1615 = fma(_1589, _1609, -0.212114393711090087890625);
    float _1617 = _1611 * _1597;
    float _1619 = _1613 * _1597;
    float _1621 = -_1551;
    float _1623 = fma(_1601, _1595, _1621);
    float _1625 = fma(_1589, _1615, 1.570728778839111328125);
    float _1627 = fma(_1617, 0.5, 0.5);
    float _1629 = fma(_1619, -0.5, 0.5);
    float _1631 = fma(_1623, 0.5, 0.5);
    float _1633 = _1607 * 0.636619746685028076171875;
    float3 _4852 = float3(_1627, _1629, _1605);
    float _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4852, float3(0.0), isnan(_4852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4852, float3(0.0), isnan(_4852)), level(0.0)).x;
    float _1637 = -_1625;
    float _1639 = fma(_1633, _1637, 1.0);
    float3 _4868 = float3(_1627, _1629, _1605);
    float4 _1642 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4868, float3(0.0), isnan(_4868)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4868, float3(0.0), isnan(_4868)), level(0.0)).xyzw;
    float _1644 = _1642.x;
    float _1646 = _1642.y;
    float _1648 = _1642.z;
    float _1650 = _1642.w;
    float2 _4885 = float2(_1639, _1631);
    float3 _1654 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4885, float2(0.0), isnan(_4885)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4885, float2(0.0), isnan(_4885)), level(0.0)).xyz;
    float _1656 = _1654.x;
    float _1658 = _1654.y;
    float _1660 = _1654.z;
    float _1662 = in.m_54.x;
    float _1664 = in.m_54.y;
    float _1666 = in.m_54.z;
    float _1668 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1670 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1672 = isnan(0.5);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1678 = _1674 || _1676;
    float _1680 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1686 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1688 = 1.0 / _1684;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1692 = _1690 != 0;
    float _1694 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1698 = _1696 != 0;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1706 = 1.0 / _1702;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1712 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1694);
    float _1714 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1716 = _1662 > 0.5;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1722 = _1720 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1724 = -_1704;
    float _1726 = fma(_1714, 2.0, _1724);
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1730 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1718);
    float _1732 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1728);
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1736 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1738 = 1.0 / _1722;
    float _1740 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1712);
    float _1742 = fma(_1736, -2.0, _1734);
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1744;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1752;
    bool _1756 = _1664 > 0.5;
    float _1758 = 1.0 / _1710;
    float _1760 = _1750 * _1706;
    float _1762 = -_193;
    int _1764 = _1716 ? as_type<int>(_1762) : as_type<int>(_193);
    bool _1766 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1768 = isnan(_983);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    bool _1778 = !_1692;
    float _1780 = _1778 ? _193 : as_type<float>(_1764);
    bool _1782 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1784 = isnan(_983);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1796 = _1746 * _1688;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1800 = _1798 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1802 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1730);
    float _1804 = -_1792;
    float _1806 = _1804 + 1.0;
    float _1808 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1794);
    float _1810 = _1800 * _1738;
    float _1812 = _1802 * (-0.15915493667125701904296875);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1816 = _983 + _1814;
    float _1818 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1742);
    bool _1820 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1822 = isnan(_983);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1828 = _1824 || _1826;
    float _1830 = float(_1828);
    float _1832 = _1754 * _1758;
    float _1834 = fma(_1796, _1816, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1838 = _983 + _1836;
    bool _1840 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1842 = isnan(_983);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = _1830 * _1806;
    float _1854 = -_1830;
    float _1856 = _1854 + 1.0;
    float _1858 = -_199;
    int _1860 = _1756 ? as_type<int>(_1858) : as_type<int>(_199);
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1864 = _983 + _1862;
    float _1866 = fma(_1832, _1838, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1868 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1732);
    float _1870 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1668);
    float _1872 = -_1850;
    float _1874 = _1872 + 1.0;
    bool _1876 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1878 = isnan(_983);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    float _1888 = fma(_1760, _1864, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1890 = !_1698;
    float _1892 = _1890 ? _199 : as_type<float>(_1860);
    float _1894 = -_117;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1726);
    float _1898 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1870);
    float _1900 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1808);
    float _1902 = _1792 * _1874;
    float _1904 = _1886 * _1856;
    float _1906 = _1812 * 6.283185482025146484375;
    float _1908 = sin(_1906);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1912 = _983 + _1910;
    float _1914 = -_1886;
    float _1916 = _1914 + 1.0;
    float _1918 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1920 = -_1900;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_1810, _1912, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1926 = _1776 * _1916;
    float _1928 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1680);
    float _1930 = _1812 * 6.283185482025146484375;
    float _1932 = cos(_1930);
    float _1934 = -_1776;
    float _1936 = _1934 + 1.0;
    float _1938 = _1834 * _1926;
    float _1940 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1928);
    float _1942 = fma(_1936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1938);
    float _1944 = _1940 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1946 = 1.0 / _1918;
    float _1948 = _1892 * _1908;
    float _1950 = fma(_1888, _1904, _1942);
    float _1952 = _1944 + _1918;
    float _1954 = fma(_1866, _1852, _1950);
    float _1956 = _1866;
    float _1958 = _1780;
    float _1960 = _1818;
    if (!_1678)
    {
        _1956 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1962 = _1956;
    float _1964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1966 = _1892 * _1932;
    float _1968 = -_1948;
    float _1970 = fma(_1780, _1932, _1968);
    float _1972 = fma(_1924, _1902, _1954);
    float _1974 = fma(_1780, _1908, _1966);
    if (!_1678)
    {
        _1958 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1976 = _1958;
    float _1978 = _1970 + 0.5;
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1982 = _1952 * _1946;
    float _1984 = _1982 * 0.5;
    float _1986 = _1974 + (-0.5);
    float _1988 = _1976;
    if (!_1678)
    {
        float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1992 = fma(_1984, _1976, _1990);
        _1988 = _1992;
    }
    float _1994 = _1988;
    float _1996 = -_1868;
    float _1998 = _1996 + 1.0;
    float _2000 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2002 = exp2(_1686);
    float _2004 = -_2000;
    float _2006 = -_1818;
    float _2008 = fma(_2004, _1986, _2006);
    float _2010 = _1998;
    if (!_1678)
    {
        float _2012 = -_1962;
        float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1960 = _2014;
    }
    float _2016 = _1960;
    float _2018 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2020 = _1994;
    if (!_1678)
    {
        float _2022 = 1.0 / _1994;
        _2020 = _2022;
    }
    float _2024 = _2020;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2028 = fma(_2018, _1978, _1896);
    float _2030 = fma(_1974, _1922, _2008);
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2036 = _2016;
    float _2038 = _2032;
    if (!_1678)
    {
        float _2040 = 1.0 / _2016;
        _2036 = _2040;
    }
    float _2042 = _2036;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2046 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = -_1998;
    float _2050 = fma(_1970, _2048, _2028);
    float _2052 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = -_2002;
    float _2056 = _2054 + 1.0;
    if (_1678)
    {
        _2010 = 1.0;
    }
    float _2058 = _2010;
    float _2060 = _2058;
    if (!_1678)
    {
        float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2064 = -_1962;
        float _2066 = fma(_2024, _2062, _2064);
        _2038 = _2066;
    }
    float _2068 = _2038;
    out.m_56.x = _2034;
    out.m_56.y = _2052;
    out.m_56.z = _2046;
    float _2070 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2072 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1972);
    out.m_58.x = _2050;
    out.m_58.y = _2030;
    if (!_1678)
    {
        float _2074 = _2068 * _2042;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        _2060 = _2076;
    }
    float _2078 = _2060;
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2082 = _2078 > 0.0;
    bool _2084 = isnan(_2078);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan(0.0);
    bool _2090 = _2086 || _2088;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2094 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1740);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2098 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2100 = _2094 + _1575;
    out.gl_Position.x = _1611;
    out.gl_Position.y = _1613;
    out.gl_Position.z = _2094;
    out.gl_Position.w = _1575;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2106 = _2100 * 0.5;
    float _2108 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2110 = _2098 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2112 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.z = _2106;
    out.m_60.w = _1575;
    out.m_62.x = _2102;
    out.m_62.y = _2108;
    out.m_62.z = _2112;
    out.m_62.w = _2080;
    out.m_45.x = _2110;
    float _2114 = _2070 * _1635;
    float _2116 = -_2070;
    float _2118 = _2116 + 1.0;
    float _2120 = _1650 * _2114;
    float _2122 = _1660 * _2114;
    float _2124 = fma(_1656, _2120, _1644);
    float _2126 = fma(_1658, _2120, _1646);
    float _2128 = _1650 * _2118;
    float _2130 = fma(_1650, _2122, _1648);
    out.m_64.x = _2124;
    out.m_64.y = _2126;
    out.m_64.z = _2130;
    out.m_64.w = _2128;
    if (_2090)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2132;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _975 = false;
    bool _819 = false;
    bool _567 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2189 = as_type<float>(_99);
        out.gl_Position.z = _2189;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2258 = as_type<float>(_135);
        out.gl_Position.z = _2258;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_47.x;
    float _143 = in.m_47.y;
    float _145 = in.m_47.z;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _159 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _157);
    float _161 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _163 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _159);
    float _165 = _159;
    float _167 = _139;
    float _169 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    if (!_155)
    {
        float _171 = _139 * _139;
        float _173 = _171 * 0.5;
        _165 = _173;
    }
    float _175 = _165;
    float _177 = _175;
    if (!_155)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_137) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_137) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _195);
    bool _203 = !_155;
    float _205 = _181;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _139 * _209;
        float _219 = exp2(_217);
        float _221 = _215 * 0.693147182464599609375;
        float _223 = 1.0 / _221;
        float _225 = 1.0 / _213;
        float _227 = _219 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _223, _139);
        float _233 = _231 * _225;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_155;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _139 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _167 = _259;
    }
    float _261 = _167;
    float _263 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = _263;
    float _271 = _267;
    if (!_155)
    {
        float _273 = _117 * _117;
        float _275 = _273 * 0.5;
        _169 = _275;
    }
    float _277 = _169;
    float _279 = fma(_261, _141, _263);
    float _281 = fma(_261, _143, _265);
    float _283 = fma(_261, _145, _267);
    if (!_155)
    {
        float _285 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _285;
    }
    float _287 = _269;
    bool _289 = !_155;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _117 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _117);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
        _271 = _309;
    }
    float _323 = _291;
    float _325 = _271;
    float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _329 = _325;
    if (!_155)
    {
        _329 = _117;
    }
    float _331 = _329;
    bool _333 = !_155;
    float _335 = _331;
    if (!_333)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _117 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _335 = _355;
    }
    float _357 = _335;
    float _359 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = fma(_357, _143, _327);
    float _363 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = sqrt(_201);
    float _367 = fma(_357, _141, _359);
    float _369 = -_361;
    float _371 = _281 + _369;
    float _373 = fma(_357, _145, _363);
    float _375 = -_367;
    float _377 = _279 + _375;
    float _379 = _371 * _371;
    float _381 = -_373;
    float _383 = _283 + _381;
    float _385 = sqrt(_163);
    float _387 = fma(_377, _377, _379);
    float _389 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _391 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _393 = fma(_383, _383, _387);
    float _395 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _389);
    float _397 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _399 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].y, _391);
    float _401 = sqrt(_393);
    float _403 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _395);
    float _405 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _407 = _371 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _409 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].x, _397);
    float _411 = in.m_52.w;
    float _413 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].z, _405);
    float _415 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[14].w, _407);
    float _417 = sqrt(_403);
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].y, _399);
    float _421 = in.m_42.x;
    float _423 = in.m_42.y;
    float _425 = in.m_42.z;
    float _427 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].x, _409);
    float _429 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].z, _413);
    float _431 = _365 * _419;
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[16].w, _415);
    float _435 = _385 * _427;
    bool _437 = _401 >= 9.9999999747524270787835121154785e-07;
    bool _439 = isnan(_401);
    bool _441 = _437 || _439;
    bool _443 = isnan(9.9999999747524270787835121154785e-07);
    bool _445 = _441 || _443;
    float _447 = _431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _449 = _431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _451 = _431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].x, _447);
    float _455 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].x, _449);
    float _457 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].x, _451);
    float _459 = _417 * _429;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[24].z, _453);
    float _463 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[25].z, _455);
    float _465 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[26].z, _457);
    float _467 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].w, _461);
    float _469 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].w, _463);
    float _471 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].w, _465);
    float _473 = fma(_279, _411, _421);
    float _475 = fma(_281, _411, _423);
    float _477 = fma(_283, _411, _425);
    float _479 = _465;
    float _481 = _433;
    float _483 = _471;
    if (_445)
    {
        _479 = _467;
    }
    float _485 = _479;
    float _487 = _485;
    if (_445)
    {
        _481 = _469;
    }
    float _489 = _481;
    float _491 = _489;
    if (!_445)
    {
        bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _495 = !_493;
        if (!_495)
        {
            float _497 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _499 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _503 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _497);
            float _505 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _499);
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _505);
            float _513 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _507);
            float _517 = _365 * _509;
            float _519 = _385 * _511;
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _513);
            float _523 = _417 * _515;
            float _525 = _517 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _527 = _517 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _529 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _521);
            float _531 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].x, _525);
            float _533 = _517 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _535 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].x, _527);
            float _537 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _531);
            float _539 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].x, _533);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _535);
            float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].w, _537);
            float _545 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
            float _547 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].w, _541);
            float _549 = _543 * _543;
            float _551 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].w, _545);
            float _553 = fma(_547, _547, _549);
            float _555 = fma(_551, _551, _553);
            float _557 = rsqrt(_555);
            float _559 = _557 * 9.9999999747524270787835121154785e-07;
            float _561 = _547 * _559;
            float _563 = _543 * _559;
            float _565 = _551 * _559;
            _491 = _563;
            _487 = _561;
            _483 = _565;
            _567 = true;
        }
        else
        {
            float _569 = _143 * _143;
            float _571 = fma(_141, _141, _569);
            float _573 = fma(_145, _145, _571);
            float _575 = sqrt(_573);
            bool _577 = _575 >= 9.9999999747524270787835121154785e-07;
            bool _579 = isnan(_575);
            bool _581 = _577 || _579;
            bool _583 = isnan(9.9999999747524270787835121154785e-07);
            bool _585 = _581 || _583;
            if (!_585)
            {
                float _587 = _423 * _423;
                float _589 = fma(_421, _421, _587);
                float _591 = fma(_425, _425, _589);
                float _593 = sqrt(_591);
                bool _595 = _593 >= 9.9999999747524270787835121154785e-07;
                bool _597 = isnan(_593);
                bool _599 = _595 || _597;
                bool _601 = isnan(9.9999999747524270787835121154785e-07);
                bool _603 = _599 || _601;
                if (!_603)
                {
                    float _605 = _365 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _607 = _385 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _609 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _611 = _605 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _613 = _605 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _615 = _605 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _617 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _611);
                    float _619 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
                    float _621 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[26].x, _615);
                    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _617);
                    float _625 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _619);
                    float _627 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _621);
                    float _629 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _623);
                    float _631 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _627);
                    float _635 = _629 * _629;
                    float _637 = fma(_631, _631, _635);
                    float _639 = fma(_633, _633, _637);
                    float _641 = rsqrt(_639);
                    float _643 = _641 * 9.9999999747524270787835121154785e-07;
                    float _645 = _631 * _643;
                    float _647 = _629 * _643;
                    float _649 = _633 * _643;
                    _491 = _647;
                    _487 = _645;
                    _483 = _649;
                    _567 = true;
                }
                else
                {
                    float _651 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _653 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _655 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _657 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _659 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].y, _651);
                    float _661 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].x, _653);
                    float _663 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].z, _655);
                    float _665 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].w, _657);
                    float _667 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].y, _659);
                    float _669 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].x, _661);
                    float _671 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].z, _663);
                    float _673 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].w, _665);
                    float _675 = _365 * _667;
                    float _677 = _385 * _669;
                    float _679 = _417 * _671;
                    float _681 = _675 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _683 = _675 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _685 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[25].x, _681);
                    float _687 = _675 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _689 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[24].x, _683);
                    float _691 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].z, _685);
                    float _693 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[26].x, _687);
                    float _695 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].z, _689);
                    float _697 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[25].w, _691);
                    float _699 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].z, _693);
                    float _701 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[24].w, _695);
                    float _703 = _697 * _697;
                    float _705 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[26].w, _699);
                    float _707 = fma(_701, _701, _703);
                    float _709 = fma(_705, _705, _707);
                    float _711 = rsqrt(_709);
                    float _713 = _711 * 9.9999999747524270787835121154785e-07;
                    float _715 = _701 * _713;
                    float _717 = _697 * _713;
                    float _719 = _705 * _713;
                    _491 = _717;
                    _487 = _715;
                    _483 = _719;
                    _567 = true;
                }
            }
            else
            {
                float _721 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _723 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _725 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _727 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _729 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].y, _721);
                float _731 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].x, _723);
                float _733 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].z, _725);
                float _735 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].w, _727);
                float _737 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].y, _729);
                float _739 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].x, _731);
                float _741 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].z, _733);
                float _743 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].w, _735);
                float _745 = _365 * _737;
                float _747 = _385 * _739;
                float _749 = _417 * _741;
                float _751 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _753 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _757 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
                float _759 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _753);
                float _761 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _755);
                float _763 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].z, _757);
                float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].z, _759);
                float _767 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].z, _761);
                float _769 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].w, _763);
                float _771 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].w, _765);
                float _773 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].w, _767);
                float _775 = _769 * _769;
                float _777 = fma(_771, _771, _775);
                float _779 = fma(_773, _773, _777);
                float _781 = rsqrt(_779);
                float _783 = _781 * 9.9999999747524270787835121154785e-07;
                float _785 = _771 * _783;
                float _787 = _769 * _783;
                float _789 = _773 * _783;
                _491 = _787;
                _487 = _785;
                _483 = _789;
            }
        }
    }
    _567 = false;
    float _791 = _491;
    float _793 = _487;
    float _795 = _483;
    bool _797 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _799 = !_797;
    float _817;
    if (!_799)
    {
        float _801 = in.m_54.x;
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _805 = _801 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _809 = _807 * _803;
        float _811 = floor(_809);
        float _813 = -_811;
        float _815 = _809 + _813;
        _817 = _815;
        _819 = true;
    }
    else
    {
        float _821 = float(_83);
        float _823 = 1.0 / _821;
        float _825 = _117 * _823;
        _817 = _825;
    }
    _819 = false;
    float _827 = _817;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _831 = _827 + _829;
    bool _833 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _835 = isnan(_827);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _847 = _827 + _845;
    bool _849 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _851 = isnan(_827);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _869 = -_843;
    float _871 = _869 + 1.0;
    float _873 = 1.0 / _867;
    bool _875 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _877 = isnan(_827);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = _859 * _871;
    float _889 = -_859;
    float _891 = _889 + 1.0;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _899 = _885 * _891;
    float _901 = 1.0 / _863;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _903;
    float _907 = -_885;
    float _909 = _907 + 1.0;
    float _911 = _847 * _873;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _917 = fma(_895, _911, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _919 = fma(_915, _911, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _921 = _831 * _901;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _923;
    float _927 = in.m_52.x;
    float _929 = in.m_52.y;
    float _931 = fma(_905, _921, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _933 = fma(_925, _921, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _935 = _933 * _899;
    float _937 = _931 * _899;
    float _939 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[143].x, _935);
    float _941 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[143].y, _937);
    float _943 = fma(_919, _887, _939);
    float _945 = fma(_917, _887, _941);
    float _947 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[145].x, _943);
    float _949 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[145].y, _945);
    float _951 = _947 * _927;
    float _953 = _949 * _929;
    bool _955 = !_897;
    float _973;
    if (!_955)
    {
        float _957 = in.m_54.x;
        float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _961 = _957 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _965 = _963 * _959;
        float _967 = floor(_965);
        float _969 = -_967;
        float _971 = _965 + _969;
        _973 = _971;
        _975 = true;
    }
    else
    {
        float _977 = float(_83);
        float _979 = 1.0 / _977;
        float _981 = _117 * _979;
        _973 = _981;
    }
    _975 = false;
    float _983 = _973;
    float _985 = _791 * _791;
    float _987 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    bool _989 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _991 = isnan(0.5);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _997 = _993 || _995;
    float _999 = fma(_793, _793, _985);
    float _1001 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].z, _987);
    float _1003 = fma(_795, _795, _999);
    float _1005 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1001);
    float _1007 = rsqrt(_1003);
    float _1009 = _1005 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1011 = _417 * _1009;
    float _1013 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1017 = _1013 * _1015;
    float _1019 = _1007 * _795;
    float _1021 = _1007 * _793;
    float _1023 = _1007 * _791;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1027 = _1019 * _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1031 = _1021 * _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1035 = _1023 * _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1039 = -_1027;
    float _1041 = fma(_1021, _1037, _1039);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1045 = -_1031;
    float _1047 = fma(_1023, _1043, _1045);
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1051 = -_1035;
    float _1053 = fma(_1019, _1049, _1051);
    float _1055 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1057 = _1041 * _1041;
    float _1059 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1061 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1055);
    float _1063 = fma(_1053, _1053, _1057);
    float _1065 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1067 = _475 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1069 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1061);
    float _1071 = fma(_1047, _1047, _1063);
    float _1073 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1065);
    float _1075 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1067);
    float _1077 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1079 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1073);
    float _1081 = rsqrt(_1071);
    float _1083 = _1077 * _1059;
    float _1085 = _1069 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1089 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1075);
    float _1091 = _1083 * _1019;
    float _1093 = _385 * _1085;
    float _1095 = _365 * _1087;
    float _1097 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1101 = _1083 * _1021;
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1105 = _1083 * _1023;
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1103);
    float _1109 = _1041 * _1081;
    float _1111 = _1053 * _1081;
    float _1113 = _1047 * _1081;
    float _1115 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1107);
    float _1117 = _1021 * _1109;
    float _1119 = fma(_1017, _1113, _1091);
    float _1121 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = -_1117;
    float _1125 = fma(_1023, _1111, _1123);
    float _1127 = _1023 * _1113;
    float _1129 = fma(_1097, _1125, _1119);
    float _1131 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1115);
    float _1135 = fma(_1017, _1111, _1101);
    float _1137 = -_1127;
    float _1139 = fma(_1019, _1109, _1137);
    float _1141 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1143 = _1133 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1145 = _1019 * _1111;
    float _1147 = fma(_1097, _1139, _1135);
    float _1149 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1141);
    float _1151 = _1143 + _1129;
    float _1153 = fma(_1017, _1109, _1105);
    float _1155 = -_1145;
    float _1157 = fma(_1021, _1113, _1155);
    float _1159 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1163 = _1151 + _1161;
    float _1165 = fma(_1097, _1157, _1153);
    float _1167 = _1159 + _1147;
    float _1169 = _1163 * _1163;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1173 = _1167 + _1171;
    float _1175 = fma(_1173, _1173, _1169);
    float _1177 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1179 = sqrt(_1175);
    float _1181 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1177);
    float _1183 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1181);
    float _1185 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1183);
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _1189 = _1179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1191 = _1187 + _1165;
    float _1193 = _1153;
    float _1195 = _1165;
    float _1197 = _1105;
    float _1199 = _1179;
    float _1201 = _1113;
    if (!_1189)
    {
        _1193 = _1167;
    }
    float _1203 = _1193;
    float _1205 = _1203;
    if (!_1189)
    {
        _1195 = _1151;
    }
    float _1207 = _1195;
    float _1209 = _1207;
    if (!_1189)
    {
        _1197 = _1191;
    }
    float _1211 = _1197;
    bool _1213 = !_1189;
    float _1215 = _1211;
    if (!_1213)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1221 = _1179 + _1219;
        float _1223 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1225 = rsqrt(_1175);
        float _1227 = _1221 * _1217;
        float _1229 = _1227 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = _1229 * 6.283185482025146484375;
        float _1237 = sin(_1235);
        float _1239 = _1233 + (-1.0);
        float _1241 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = fma(_1237, _1223, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1245 = fma(_1191, _1233, _1241);
        float _1247 = _1225 * _1243;
        float _1249 = fma(_1173, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1251 = fma(_1163, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1209 = _1251;
        _1205 = _1249;
        _1215 = _1245;
    }
    float _1253 = _1209;
    float _1255 = _1205;
    float _1257 = _1215;
    float _1259 = _1257;
    float _1261 = _1255;
    float _1263 = _1253;
    if (!_997)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1267 = _1187 + _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1271 = _1159 + _1269;
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1275 = -_1143;
        float _1277 = _1275 + _1253;
        float _1279 = _1267 * _1267;
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1283 = _1143 + _1281;
        float _1285 = fma(_1271, _1271, _1279);
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1289 = fma(_1283, _1283, _1285);
        float _1291 = sqrt(_1289);
        float _1293 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1295 = precise::min(_1291, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1287;
        float _1299 = -_1159;
        float _1301 = _1299 + _1255;
        float _1303 = _1293 * _1297;
        float _1305 = -_1187;
        float _1307 = _1305 + _1257;
        float _1309 = fma(_1301, _1303, _1159);
        float _1311 = fma(_1307, _1303, _1187);
        float _1313 = fma(_1277, _1303, _1143);
        _1259 = _1311;
        _1261 = _1309;
        _1263 = _1313;
        _1199 = _1287;
    }
    float _1315 = _1259;
    float _1317 = _1261;
    float _1319 = _1263;
    float _1321 = _1199;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1315 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1317 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1319 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = fma(_1333, _1333, _1337);
    float _1341 = rsqrt(_1339);
    float _1343 = sqrt(_1339);
    float _1345 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1347 = _1329 * _1345;
    float _1349 = _1333 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 * _1349;
    float _1355 = _1351 + _1353;
    float _1357 = sqrt(_1355);
    bool _1359 = _1357 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1363 = _1357 + _1361;
    float _1365 = _1333;
    float _1367 = _1355;
    float _1369 = _1363;
    float _1371 = _1321;
    float _1373 = _1325;
    if (_1359)
    {
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1375;
    }
    float _1377 = _1365;
    if (_1359)
    {
        float _1379 = rsqrt(_1355);
        _1367 = _1379;
    }
    float _1381 = _1367;
    float _1383 = _1381;
    if (_1359)
    {
        float _1385 = _1363 * _1377;
        _1369 = _1385;
    }
    float _1387 = _1369;
    if (_1359)
    {
        float _1389 = _1387 * 0.15915493667125701904296875;
        _1371 = _1389;
    }
    float _1391 = _1371;
    float _1393 = _1377;
    float _1395 = _1391;
    if (_1359)
    {
        float _1397 = _1391 * 6.283185482025146484375;
        float _1399 = sin(_1397);
        _1393 = _1399;
    }
    float _1401 = _1393;
    float _1403 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1405 = precise::max(0.0, _1403);
    float _1407 = _1335;
    float _1409 = _1405;
    if (_1359)
    {
        float _1411 = _1391 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        _1407 = _1413;
    }
    float _1415 = _1407;
    float _1417 = -_1345;
    float _1419 = -_1405;
    float _1421 = fma(_1325, _1417, _1419);
    if (_1359)
    {
        float _1423 = _1421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1409 = _1423;
    }
    float _1425 = _1409;
    float _1427 = _1401;
    float _1429 = _1425;
    if (_1359)
    {
        float _1431 = fma(_1401, _1425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1373 = _1431;
    }
    float _1433 = _1373;
    float _1435 = _1433;
    if (!_1359)
    {
        _1427 = _1347;
    }
    float _1437 = _1427;
    float _1439 = _1437;
    float _1441 = _1415;
    if (_1359)
    {
        float _1443 = _1415 + (-1.0);
        _1429 = _1443;
    }
    float _1445 = _1429;
    float _1447 = _1445;
    if (_1359)
    {
        float _1449 = _1381 * _1433;
        _1201 = _1449;
    }
    float _1451 = _1201;
    if (!_1359)
    {
        _1435 = _1421;
    }
    float _1453 = _1435;
    float _1455 = _1453;
    if (_1359)
    {
        float _1457 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1395 = _1457;
    }
    float _1459 = _1395;
    if (_1359)
    {
        float _1461 = _1347 * _1451;
        _1439 = _1461;
    }
    float _1463 = _1439;
    if (!_1359)
    {
        _1447 = _1349;
    }
    float _1465 = _1447;
    float _1467 = _1465;
    if (_1359)
    {
        float _1469 = _1349 * _1451;
        _1467 = _1469;
    }
    float _1471 = _1467;
    if (!_1359)
    {
        _1383 = _1351;
    }
    float _1473 = _1383;
    float _1475 = _1473;
    if (_1359)
    {
        float _1477 = fma(_1421, _1415, _1459);
        _1455 = _1477;
    }
    float _1479 = _1455;
    if (_1359)
    {
        float _1481 = _1463 * _1463;
        _1475 = _1481;
    }
    float _1483 = _1475;
    if (!_1359)
    {
        _1441 = _1353;
    }
    float _1485 = _1441;
    float _1487 = _1485;
    if (_1359)
    {
        float _1489 = _1471 * _1471;
        _1487 = _1489;
    }
    float _1491 = _1487;
    float _1493 = fma(_1479, _1479, _1483);
    float _1495 = _1493 + _1491;
    float _1497 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1501 = fma(_1343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1499);
    float _1503 = precise::clamp(_1501, 0.0, 1.0);
    float _1505 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1507 = rsqrt(_1495);
    float _1509 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1497);
    float _1511 = -_1503;
    float _1513 = _1511 + 1.0;
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1505);
    float _1517 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1519 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1509);
    float _1521 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1523 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1525 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1515);
    float _1527 = abs(_1513);
    float _1529 = log2(_1527);
    float _1531 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1521);
    float _1533 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1523);
    float _1535 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1537 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1539 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1531);
    float _1541 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1533);
    float _1543 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1545 = _1507 * _1463;
    float _1547 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1549 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1551 = _1507 * _1479;
    float _1553 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1555 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1543);
    float _1557 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1559 = _1507 * _1471;
    float _1561 = -_1553;
    float _1563 = fma(_1561, _1517, 1.0);
    float _1565 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1555);
    float _1567 = -_1557;
    float _1569 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1567);
    float _1571 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1573 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1565);
    float _1577 = -_1559;
    float _1579 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1569);
    float _1581 = log2(_1563);
    float _1583 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1585 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1573);
    float _1587 = fma(_1579, -0.5, 0.5);
    float _1589 = fma(_1579, 0.5, 0.5);
    float _1591 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1583);
    float _1593 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1585);
    float _1595 = _1551 + 1.0;
    float _1597 = 1.0 / _1575;
    float _1599 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1591);
    float _1601 = exp2(_1571);
    float _1603 = _1581 * 0.693147182464599609375;
    float _1605 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1607 = sqrt(_1587);
    float _1609 = fma(_1589, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1611 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1593);
    float _1613 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1599);
    float _1615 = fma(_1589, _1609, -0.212114393711090087890625);
    float _1617 = _1611 * _1597;
    float _1619 = _1613 * _1597;
    float _1621 = -_1551;
    float _1623 = fma(_1601, _1595, _1621);
    float _1625 = fma(_1589, _1615, 1.570728778839111328125);
    float _1627 = fma(_1617, 0.5, 0.5);
    float _1629 = fma(_1619, -0.5, 0.5);
    float _1631 = fma(_1623, 0.5, 0.5);
    float _1633 = _1607 * 0.636619746685028076171875;
    float3 _4852 = float3(_1627, _1629, _1605);
    float _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4852, float3(0.0), isnan(_4852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4852, float3(0.0), isnan(_4852)), level(0.0)).x;
    float _1637 = -_1625;
    float _1639 = fma(_1633, _1637, 1.0);
    float3 _4868 = float3(_1627, _1629, _1605);
    float4 _1642 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4868, float3(0.0), isnan(_4868)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4868, float3(0.0), isnan(_4868)), level(0.0)).xyzw;
    float _1644 = _1642.x;
    float _1646 = _1642.y;
    float _1648 = _1642.z;
    float _1650 = _1642.w;
    float2 _4885 = float2(_1639, _1631);
    float3 _1654 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4885, float2(0.0), isnan(_4885)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4885, float2(0.0), isnan(_4885)), level(0.0)).xyz;
    float _1656 = _1654.x;
    float _1658 = _1654.y;
    float _1660 = _1654.z;
    float _1662 = in.m_54.x;
    float _1664 = in.m_54.y;
    float _1666 = in.m_54.z;
    float _1668 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1670 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1672 = isnan(0.5);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1678 = _1674 || _1676;
    float _1680 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1686 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1688 = 1.0 / _1684;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1692 = _1690 != 0;
    float _1694 = _1535 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1698 = _1696 != 0;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1706 = 1.0 / _1702;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1712 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1694);
    float _1714 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1716 = _1662 > 0.5;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1722 = _1720 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1724 = -_1704;
    float _1726 = fma(_1714, 2.0, _1724);
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1730 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1718);
    float _1732 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1728);
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1736 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1738 = 1.0 / _1722;
    float _1740 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1712);
    float _1742 = fma(_1736, -2.0, _1734);
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1744;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1752;
    bool _1756 = _1664 > 0.5;
    float _1758 = 1.0 / _1710;
    float _1760 = _1750 * _1706;
    float _1762 = -_193;
    int _1764 = _1716 ? as_type<int>(_1762) : as_type<int>(_193);
    bool _1766 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1768 = isnan(_983);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    bool _1778 = !_1692;
    float _1780 = _1778 ? _193 : as_type<float>(_1764);
    bool _1782 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1784 = isnan(_983);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1796 = _1746 * _1688;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1800 = _1798 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1802 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1730);
    float _1804 = -_1792;
    float _1806 = _1804 + 1.0;
    float _1808 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1794);
    float _1810 = _1800 * _1738;
    float _1812 = _1802 * (-0.15915493667125701904296875);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1816 = _983 + _1814;
    float _1818 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1742);
    bool _1820 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1822 = isnan(_983);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1828 = _1824 || _1826;
    float _1830 = float(_1828);
    float _1832 = _1754 * _1758;
    float _1834 = fma(_1796, _1816, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1838 = _983 + _1836;
    bool _1840 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1842 = isnan(_983);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = _1830 * _1806;
    float _1854 = -_1830;
    float _1856 = _1854 + 1.0;
    float _1858 = -_199;
    int _1860 = _1756 ? as_type<int>(_1858) : as_type<int>(_199);
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1864 = _983 + _1862;
    float _1866 = fma(_1832, _1838, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1868 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1732);
    float _1870 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1668);
    float _1872 = -_1850;
    float _1874 = _1872 + 1.0;
    bool _1876 = _983 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1878 = isnan(_983);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    float _1888 = fma(_1760, _1864, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1890 = !_1698;
    float _1892 = _1890 ? _199 : as_type<float>(_1860);
    float _1894 = -_117;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1726);
    float _1898 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1870);
    float _1900 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1808);
    float _1902 = _1792 * _1874;
    float _1904 = _1886 * _1856;
    float _1906 = _1812 * 6.283185482025146484375;
    float _1908 = sin(_1906);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1912 = _983 + _1910;
    float _1914 = -_1886;
    float _1916 = _1914 + 1.0;
    float _1918 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1920 = -_1900;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_1810, _1912, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1926 = _1776 * _1916;
    float _1928 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1680);
    float _1930 = _1812 * 6.283185482025146484375;
    float _1932 = cos(_1930);
    float _1934 = -_1776;
    float _1936 = _1934 + 1.0;
    float _1938 = _1834 * _1926;
    float _1940 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1928);
    float _1942 = fma(_1936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1938);
    float _1944 = _1940 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1946 = 1.0 / _1918;
    float _1948 = _1892 * _1908;
    float _1950 = fma(_1888, _1904, _1942);
    float _1952 = _1944 + _1918;
    float _1954 = fma(_1866, _1852, _1950);
    float _1956 = _1866;
    float _1958 = _1780;
    float _1960 = _1818;
    if (!_1678)
    {
        _1956 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1962 = _1956;
    float _1964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1966 = _1892 * _1932;
    float _1968 = -_1948;
    float _1970 = fma(_1780, _1932, _1968);
    float _1972 = fma(_1924, _1902, _1954);
    float _1974 = fma(_1780, _1908, _1966);
    if (!_1678)
    {
        _1958 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1976 = _1958;
    float _1978 = _1970 + 0.5;
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1982 = _1952 * _1946;
    float _1984 = _1982 * 0.5;
    float _1986 = _1974 + (-0.5);
    float _1988 = _1976;
    if (!_1678)
    {
        float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1992 = fma(_1984, _1976, _1990);
        _1988 = _1992;
    }
    float _1994 = _1988;
    float _1996 = -_1868;
    float _1998 = _1996 + 1.0;
    float _2000 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2002 = exp2(_1686);
    float _2004 = -_2000;
    float _2006 = -_1818;
    float _2008 = fma(_2004, _1986, _2006);
    float _2010 = _1998;
    if (!_1678)
    {
        float _2012 = -_1962;
        float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1960 = _2014;
    }
    float _2016 = _1960;
    float _2018 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2020 = _1994;
    if (!_1678)
    {
        float _2022 = 1.0 / _1994;
        _2020 = _2022;
    }
    float _2024 = _2020;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2028 = fma(_2018, _1978, _1896);
    float _2030 = fma(_1974, _1922, _2008);
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2036 = _2016;
    float _2038 = _2032;
    if (!_1678)
    {
        float _2040 = 1.0 / _2016;
        _2036 = _2040;
    }
    float _2042 = _2036;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2046 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = -_1998;
    float _2050 = fma(_1970, _2048, _2028);
    float _2052 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = -_2002;
    float _2056 = _2054 + 1.0;
    if (_1678)
    {
        _2010 = 1.0;
    }
    float _2058 = _2010;
    float _2060 = _2058;
    if (!_1678)
    {
        float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2064 = -_1962;
        float _2066 = fma(_2024, _2062, _2064);
        _2038 = _2066;
    }
    float _2068 = _2038;
    out.m_56.x = _2034;
    out.m_56.y = _2052;
    out.m_56.z = _2046;
    float _2070 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2072 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1972);
    out.m_58.x = _2050;
    out.m_58.y = _2030;
    if (!_1678)
    {
        float _2074 = _2068 * _2042;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        _2060 = _2076;
    }
    float _2078 = _2060;
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2082 = _2078 > 0.0;
    bool _2084 = isnan(_2078);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan(0.0);
    bool _2090 = _2086 || _2088;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2094 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1740);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2098 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2100 = _2094 + _1575;
    out.gl_Position.x = _1611;
    out.gl_Position.y = _1613;
    out.gl_Position.z = _2094;
    out.gl_Position.w = _1575;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2106 = _2100 * 0.5;
    float _2108 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2110 = _2098 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2112 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.z = _2106;
    out.m_60.w = _1575;
    out.m_62.x = _2102;
    out.m_62.y = _2108;
    out.m_62.z = _2112;
    out.m_62.w = _2080;
    out.m_45.x = _2110;
    float _2114 = _2070 * _1635;
    float _2116 = -_2070;
    float _2118 = _2116 + 1.0;
    float _2120 = _1650 * _2114;
    float _2122 = _1660 * _2114;
    float _2124 = fma(_1656, _2120, _1644);
    float _2126 = fma(_1658, _2120, _1646);
    float _2128 = _1650 * _2118;
    float _2130 = fma(_1650, _2122, _1648);
    out.m_64.x = _2124;
    out.m_64.y = _2126;
    out.m_64.z = _2130;
    out.m_64.w = _2128;
    if (_2090)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2132;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

