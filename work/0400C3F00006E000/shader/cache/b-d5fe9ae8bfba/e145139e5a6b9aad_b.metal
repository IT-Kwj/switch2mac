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
    float4 m_56 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _983 = false;
    bool _827 = false;
    bool _575 = false;
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
        float _2033 = as_type<float>(_99);
        out.gl_Position.z = _2033;
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
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2101 = as_type<float>(_135);
        out.gl_Position.z = _2101;
    }
    if (_129)
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
    if (!_155)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_155)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_187;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    bool _195 = !_183;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _193);
    bool _201 = !_155;
    float _203 = _179;
    float _205 = 0.0;
    if (!_201)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _139 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _139);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _235;
        _205 = _233;
    }
    float _237 = _203;
    float _239 = _205;
    bool _241 = !_155;
    float _243 = _239;
    if (!_241)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _139 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _167 = _263;
    }
    float _265 = _167;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = _267;
    float _275 = _271;
    if (!_155)
    {
        float _277 = _117 * _117;
        float _279 = _277 * 0.5;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = fma(_265, _141, _267);
    float _285 = fma(_265, _143, _269);
    float _287 = fma(_265, _145, _271);
    if (!_155)
    {
        float _289 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _289;
    }
    float _291 = _273;
    bool _293 = !_155;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _117 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _117);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
        _275 = _313;
    }
    float _327 = _295;
    float _329 = _275;
    float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = _329;
    if (!_155)
    {
        _333 = _117;
    }
    float _335 = _333;
    bool _337 = !_155;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _117 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _339 = _359;
    }
    float _361 = _339;
    float _363 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_361, _143, _331);
    float _367 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = fma(_361, _141, _363);
    float _371 = -_365;
    float _373 = _285 + _371;
    float _375 = fma(_361, _145, _367);
    float _377 = -_369;
    float _379 = _283 + _377;
    float _381 = _373 * _373;
    float _383 = -_375;
    float _385 = _287 + _383;
    float _387 = sqrt(_199);
    float _389 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _391 = fma(_379, _379, _381);
    float _393 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _397 = fma(_385, _385, _391);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _393);
    float _401 = sqrt(_163);
    float _403 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].y, _389);
    float _405 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].x, _395);
    float _411 = in.m_52.w;
    float _413 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _415 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].z, _405);
    float _417 = sqrt(_397);
    float _419 = in.m_42.x;
    float _421 = in.m_42.y;
    float _423 = in.m_42.z;
    float _425 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].x, _409);
    float _427 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].w, _413);
    float _429 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].z, _415);
    float _431 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].w, _427);
    float _433 = sqrt(_407);
    float _435 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].y, _403);
    float _437 = _401 * _425;
    float _439 = _387 * _435;
    bool _441 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_417);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = _439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _453 = _439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _451);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _455);
    float _463 = _433 * _429;
    float _465 = fma(_283, _411, _419);
    float _467 = fma(_285, _411, _421);
    float _469 = fma(_287, _411, _423);
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _477 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _479 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[25].w, _473);
    float _481 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[26].w, _475);
    float _483 = _475;
    float _485 = _431;
    float _487 = _477;
    if (_449)
    {
        _483 = _477;
    }
    float _489 = _483;
    float _491 = _489;
    if (_449)
    {
        _485 = _479;
    }
    float _493 = _485;
    float _495 = _493;
    if (_449)
    {
        _487 = _481;
    }
    float _497 = _487;
    float _499 = _497;
    if (!_449)
    {
        bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _503 = !_501;
        if (!_503)
        {
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _509 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _511 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _505);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _507);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _509);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _511);
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _513);
            float _523 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _515);
            float _525 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _519);
            float _527 = _387 * _521;
            float _529 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _517);
            float _531 = _401 * _523;
            float _533 = _527 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _535 = _527 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _537 = _433 * _529;
            float _539 = _527 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _541 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].x, _533);
            float _543 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].x, _535);
            float _545 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].x, _539);
            float _547 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[25].z, _541);
            float _549 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[24].z, _543);
            float _551 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[26].z, _545);
            float _553 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].w, _547);
            float _555 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].w, _549);
            float _557 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].w, _551);
            float _559 = _553 * _553;
            float _561 = fma(_555, _555, _559);
            float _563 = fma(_557, _557, _561);
            float _565 = rsqrt(_563);
            float _567 = _565 * 9.9999999747524270787835121154785e-07;
            float _569 = _555 * _567;
            float _571 = _553 * _567;
            float _573 = _557 * _567;
            _495 = _571;
            _491 = _569;
            _499 = _573;
            _575 = true;
        }
        else
        {
            float _577 = _143 * _143;
            float _579 = fma(_141, _141, _577);
            float _581 = fma(_145, _145, _579);
            float _583 = sqrt(_581);
            bool _585 = _583 >= 9.9999999747524270787835121154785e-07;
            bool _587 = isnan(_583);
            bool _589 = _585 || _587;
            bool _591 = isnan(9.9999999747524270787835121154785e-07);
            bool _593 = _589 || _591;
            if (!_593)
            {
                float _595 = _421 * _421;
                float _597 = fma(_419, _419, _595);
                float _599 = fma(_423, _423, _597);
                float _601 = sqrt(_599);
                bool _603 = _601 >= 9.9999999747524270787835121154785e-07;
                bool _605 = isnan(_601);
                bool _607 = _603 || _605;
                bool _609 = isnan(9.9999999747524270787835121154785e-07);
                bool _611 = _607 || _609;
                if (!_611)
                {
                    float _613 = _387 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _615 = _401 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _617 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _619 = _613 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _621 = _613 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _623 = _613 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _625 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _619);
                    float _627 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _621);
                    float _629 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _623);
                    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _625);
                    float _633 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _627);
                    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _633);
                    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _635);
                    float _643 = _637 * _637;
                    float _645 = fma(_639, _639, _643);
                    float _647 = fma(_641, _641, _645);
                    float _649 = rsqrt(_647);
                    float _651 = _649 * 9.9999999747524270787835121154785e-07;
                    float _653 = _639 * _651;
                    float _655 = _637 * _651;
                    float _657 = _641 * _651;
                    _495 = _655;
                    _491 = _653;
                    _499 = _657;
                    _575 = true;
                }
                else
                {
                    float _659 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _661 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _663 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _665 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _667 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].y, _659);
                    float _669 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].x, _661);
                    float _671 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].z, _663);
                    float _673 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].w, _665);
                    float _675 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].y, _667);
                    float _677 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].x, _669);
                    float _679 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].z, _671);
                    float _681 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].w, _673);
                    float _683 = _387 * _675;
                    float _685 = _401 * _677;
                    float _687 = _433 * _679;
                    float _689 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _691 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _693 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _689);
                    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
                    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _695);
                    float _703 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
                    float _705 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
                    float _707 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].w, _701);
                    float _709 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].w, _703);
                    float _711 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].w, _705);
                    float _713 = _707 * _707;
                    float _715 = fma(_709, _709, _713);
                    float _717 = fma(_711, _711, _715);
                    float _719 = rsqrt(_717);
                    float _721 = _719 * 9.9999999747524270787835121154785e-07;
                    float _723 = _709 * _721;
                    float _725 = _707 * _721;
                    float _727 = _711 * _721;
                    _495 = _725;
                    _491 = _723;
                    _499 = _727;
                    _575 = true;
                }
            }
            else
            {
                float _729 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _731 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _733 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _735 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _737 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].y, _729);
                float _739 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].x, _731);
                float _741 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].z, _733);
                float _743 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].w, _735);
                float _745 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].y, _737);
                float _747 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].x, _739);
                float _749 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].z, _741);
                float _751 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].w, _743);
                float _753 = _387 * _745;
                float _755 = _401 * _747;
                float _757 = _433 * _749;
                float _759 = _753 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _765 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].x, _759);
                float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].x, _763);
                float _771 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].z, _765);
                float _773 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
                float _775 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
                float _777 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].w, _771);
                float _779 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].w, _773);
                float _781 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].w, _775);
                float _783 = _777 * _777;
                float _785 = fma(_779, _779, _783);
                float _787 = fma(_781, _781, _785);
                float _789 = rsqrt(_787);
                float _791 = _789 * 9.9999999747524270787835121154785e-07;
                float _793 = _779 * _791;
                float _795 = _777 * _791;
                float _797 = _781 * _791;
                _495 = _795;
                _491 = _793;
                _499 = _797;
            }
        }
    }
    _575 = false;
    float _799 = _495;
    float _801 = _491;
    float _803 = _499;
    bool _805 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _807 = !_805;
    float _825;
    if (!_807)
    {
        float _809 = in.m_54.x;
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _813 = _809 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_83);
        float _831 = 1.0 / _829;
        float _833 = _117 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _839 = _835 + _837;
    bool _841 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _843 = isnan(_835);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _855 = _835 + _853;
    bool _857 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _859 = isnan(_835);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    float _881 = 1.0 / _875;
    bool _883 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _885 = isnan(_835);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _867 * _879;
    float _897 = -_867;
    float _899 = _897 + 1.0;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _905 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _907 = _893 * _899;
    float _909 = 1.0 / _871;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _911;
    float _915 = -_893;
    float _917 = _915 + 1.0;
    float _919 = _855 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _925 = fma(_903, _919, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _927 = fma(_923, _919, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _929 = _839 * _909;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _931;
    float _935 = in.m_52.x;
    float _937 = in.m_52.y;
    float _939 = fma(_913, _929, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _941 = fma(_933, _929, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _943 = _941 * _907;
    float _945 = _939 * _907;
    float _947 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[143].x, _943);
    float _949 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[143].y, _945);
    float _951 = fma(_927, _895, _947);
    float _953 = fma(_925, _895, _949);
    float _955 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].x, _951);
    float _957 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].y, _953);
    float _959 = _955 * _935;
    float _961 = _957 * _937;
    bool _963 = !_905;
    float _981;
    if (!_963)
    {
        float _965 = in.m_54.x;
        float _967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _969 = _965 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _973 = _971 * _967;
        float _975 = floor(_973);
        float _977 = -_975;
        float _979 = _973 + _977;
        _981 = _979;
        _983 = true;
    }
    else
    {
        float _985 = float(_83);
        float _987 = 1.0 / _985;
        float _989 = _117 * _987;
        _981 = _989;
    }
    _983 = false;
    float _991 = _981;
    float _993 = _799 * _799;
    float _995 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _997 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _999 = fma(_801, _801, _993);
    float _1001 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].y, _995);
    float _1003 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].z, _997);
    bool _1005 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1007 = isnan(0.5);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1013 = _1009 || _1011;
    float _1015 = fma(_803, _803, _999);
    float _1017 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1001);
    float _1019 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1003);
    bool _1021 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1023 = isnan(0.5);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1029 = _1025 || _1027;
    float _1031 = rsqrt(_1015);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1035 = _1031 * _803;
    float _1037 = _1031 * _801;
    float _1039 = _1031 * _799;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1043 = _1035 * _1041;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1047 = _1037 * _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1051 = _1039 * _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1055 = -_1043;
    float _1057 = fma(_1037, _1053, _1055);
    float _1059 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1063 = -_1051;
    float _1065 = fma(_1035, _1061, _1063);
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1069 = -_1047;
    float _1071 = fma(_1039, _1067, _1069);
    float _1073 = _1057 * _1057;
    float _1075 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1077 = _1059 * _1033;
    float _1079 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1081 = fma(_1065, _1065, _1073);
    float _1083 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1075);
    float _1085 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1087 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1089 = fma(_1071, _1071, _1081);
    float _1091 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1083);
    float _1093 = _1085 * _1079;
    float _1095 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1097 = rsqrt(_1089);
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1101 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1087);
    float _1103 = _387 * _1095;
    float _1105 = _1093 * _1035;
    float _1107 = _401 * _1099;
    float _1109 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1101);
    float _1111 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1113 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1115 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1117 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1111);
    float _1119 = _433 * _1113;
    float _1121 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1123 = _1065 * _1097;
    float _1125 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1127 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1129 = _1057 * _1097;
    float _1131 = _1071 * _1097;
    float _1133 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1125);
    float _1135 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1127);
    float _1137 = _1037 * _1129;
    float _1139 = fma(_1077, _1131, _1105);
    float _1141 = _1039 * _1131;
    float _1143 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1135);
    float _1145 = -_1137;
    float _1147 = fma(_1039, _1123, _1145);
    float _1149 = _1093 * _1037;
    float _1151 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1133);
    float _1153 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1143);
    float _1155 = fma(_1121, _1147, _1139);
    float _1157 = fma(_1077, _1123, _1149);
    float _1159 = -_1141;
    float _1161 = fma(_1035, _1129, _1159);
    float _1163 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1151);
    float _1165 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1167 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1117);
    float _1169 = fma(_1121, _1161, _1157);
    float _1171 = _1163 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1173 = _1165 + _1155;
    float _1175 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1167);
    float _1177 = _1171 + _1169;
    float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1181 = _1173 + _1179;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1187 = _1177 + _1185;
    float _1189 = _1181 * _1181;
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1193 = fma(_1187, _1187, _1189);
    float _1195 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1191);
    float _1197 = sqrt(_1193);
    float _1199 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1195);
    float _1201 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1203 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1205 = _1093 * _1039;
    float _1207 = _1035 * _1123;
    float _1209 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1201);
    float _1211 = 1.0 / _1203;
    float _1213 = fma(_1077, _1129, _1205);
    float _1215 = -_1207;
    float _1217 = fma(_1037, _1131, _1215);
    float _1219 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1209);
    float _1221 = fma(_1121, _1217, _1213);
    bool _1223 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1227 = _1183 + _1221;
    float _1229 = _1225 + _1203;
    float _1231 = _1229 * _1211;
    float _1233 = _1231 * 0.5;
    float _1235 = _1221;
    float _1237 = _1213;
    float _1239 = _1217;
    float _1241 = _1197;
    float _1243 = _1177;
    float _1245 = _1123;
    float _1247 = _1187;
    if (!_1223)
    {
        _1235 = _1177;
    }
    float _1249 = _1235;
    float _1251 = _1249;
    if (!_1223)
    {
        _1237 = _1173;
    }
    float _1253 = _1237;
    float _1255 = _1253;
    if (!_1223)
    {
        _1239 = _1227;
    }
    float _1257 = _1239;
    bool _1259 = !_1223;
    float _1261 = _1257;
    if (!_1259)
    {
        float _1263 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1267 = _1197 + _1265;
        float _1269 = rsqrt(_1193);
        float _1271 = _1267 * _1263;
        float _1273 = _1227 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = _1271 * 0.15915493667125701904296875;
        float _1277 = _1275 * 6.283185482025146484375;
        float _1279 = cos(_1277);
        float _1281 = _1275 * 6.283185482025146484375;
        float _1283 = sin(_1281);
        float _1285 = _1279 + (-1.0);
        float _1287 = fma(_1283, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1289 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1291 = _1269 * _1287;
        float _1293 = fma(_1227, _1279, _1289);
        float _1295 = fma(_1187, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1297 = fma(_1181, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1251 = _1295;
        _1255 = _1297;
        _1261 = _1293;
        _1241 = _1275;
    }
    float _1299 = _1251;
    float _1301 = _1255;
    float _1303 = _1261;
    float _1305 = _1241;
    float _1307 = _1303;
    float _1309 = _1299;
    float _1311 = _1301;
    float _1313 = _1305;
    if (_1029)
    {
        _1243 = 1.0;
    }
    float _1315 = _1243;
    float _1317 = _1315;
    if (!_1013)
    {
        float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1321 = _1183 + _1319;
        float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1325 = _1171 + _1323;
        float _1327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1329 = -_1171;
        float _1331 = _1329 + _1299;
        float _1333 = _1321 * _1321;
        float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1337 = _1165 + _1335;
        float _1339 = -_1165;
        float _1341 = _1339 + _1301;
        float _1343 = fma(_1325, _1325, _1333);
        float _1345 = fma(_1337, _1337, _1343);
        float _1347 = sqrt(_1345);
        float _1349 = precise::min(_1347, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1351 = _1349 * _1327;
        float _1353 = -_1183;
        float _1355 = _1353 + _1303;
        float _1357 = fma(_1331, _1351, _1171);
        float _1359 = fma(_1355, _1351, _1183);
        float _1361 = fma(_1341, _1351, _1165);
        _1245 = _1351;
        _1307 = _1359;
        _1309 = _1357;
        _1311 = _1361;
        _1313 = _1331;
    }
    float _1363 = _1245;
    float _1365 = _1307;
    float _1367 = _1309;
    float _1369 = _1311;
    float _1371 = _1313;
    float _1373 = _1363;
    float _1375 = _1371;
    if (!_1029)
    {
        float _1377 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1385 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1383);
        float _1387 = _1379 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1381 * 0.15915493667125701904296875;
        float _1393 = _1379 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = 1.0 / _1389;
        float _1399 = _1391 * 6.283185482025146484375;
        float _1401 = cos(_1399);
        float _1403 = _1395 * _1397;
        float _1405 = _1391 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        float _1409 = _1401 * _1403;
        float _1411 = 1.0 / _1385;
        float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1415 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1413;
        float _1417 = 1.0 / _1409;
        float _1419 = 1.0 / _1415;
        float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1423 = _1411 * _1421;
        float _1425 = _1407 * _1417;
        float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1429 = fma(_1425, _1423, _1427);
        float _1431 = _1429 * _1419;
        float _1433 = precise::clamp(_1431, 0.0, 1.0);
        _1373 = _1397;
        _1375 = _1417;
        _1317 = _1433;
    }
    float _1435 = _1373;
    float _1437 = _1375;
    float _1439 = _1317;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1443 = _1365 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1447 = _1367 + _1445;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1451 = _1369 + _1449;
    float _1453 = _1443 * _1443;
    float _1455 = fma(_1447, _1447, _1453);
    float _1457 = fma(_1451, _1451, _1455);
    float _1459 = rsqrt(_1457);
    float _1461 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1463 = _1447 * _1461;
    float _1465 = _1451 * _1461;
    float _1467 = _1463 * _1463;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1479 = _1473 + _1477;
    float _1481 = _1451;
    float _1483 = _1437;
    float _1485 = _1479;
    float _1487 = _1435;
    float _1489 = _1443;
    if (_1475)
    {
        float _1491 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1491;
    }
    float _1493 = _1481;
    if (_1475)
    {
        float _1495 = rsqrt(_1471);
        _1483 = _1495;
    }
    float _1497 = _1483;
    float _1499 = _1497;
    if (_1475)
    {
        float _1501 = _1479 * _1493;
        _1485 = _1501;
    }
    float _1503 = _1485;
    if (_1475)
    {
        float _1505 = _1503 * 0.15915493667125701904296875;
        _1487 = _1505;
    }
    float _1507 = _1487;
    float _1509 = _1459;
    if (_1475)
    {
        float _1511 = _1507 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1519 = precise::max(0.0, _1517);
    float _1521 = _1455;
    float _1523 = _1519;
    float _1525 = _1517;
    if (_1475)
    {
        float _1527 = _1507 * 6.283185482025146484375;
        float _1529 = cos(_1527);
        _1521 = _1529;
    }
    float _1531 = _1521;
    float _1533 = -_1461;
    float _1535 = -_1519;
    float _1537 = fma(_1443, _1533, _1535);
    if (!_1475)
    {
        _1523 = _1463;
    }
    float _1539 = _1523;
    float _1541 = _1539;
    if (_1475)
    {
        float _1543 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1525 = _1543;
    }
    float _1545 = _1525;
    float _1547 = sqrt(_1457);
    float _1549 = _1515;
    float _1551 = _1545;
    if (_1475)
    {
        float _1553 = fma(_1515, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1489 = _1553;
    }
    float _1555 = _1489;
    float _1557 = _1555;
    if (!_1475)
    {
        _1549 = _1467;
    }
    float _1559 = _1549;
    float _1561 = _1559;
    float _1563 = _1531;
    if (_1475)
    {
        float _1565 = _1531 + (-1.0);
        _1551 = _1565;
    }
    float _1567 = _1551;
    float _1569 = _1567;
    if (_1475)
    {
        float _1571 = _1497 * _1555;
        _1247 = _1571;
    }
    float _1573 = _1247;
    if (!_1475)
    {
        _1557 = _1537;
    }
    float _1575 = _1557;
    float _1577 = _1575;
    if (_1475)
    {
        float _1579 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1579;
    }
    float _1581 = _1499;
    if (_1475)
    {
        float _1583 = _1463 * _1573;
        _1541 = _1583;
    }
    float _1585 = _1541;
    if (!_1475)
    {
        _1569 = _1465;
    }
    float _1587 = _1569;
    float _1589 = _1587;
    if (_1475)
    {
        float _1591 = _1465 * _1573;
        _1589 = _1591;
    }
    float _1593 = _1589;
    if (_1475)
    {
        float _1595 = fma(_1537, _1531, _1581);
        _1577 = _1595;
    }
    float _1597 = _1577;
    if (_1475)
    {
        float _1599 = _1585 * _1585;
        _1561 = _1599;
    }
    float _1601 = _1561;
    if (!_1475)
    {
        _1563 = _1469;
    }
    float _1603 = _1563;
    float _1605 = _1603;
    if (_1475)
    {
        float _1607 = _1593 * _1593;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = fma(_1597, _1597, _1601);
    float _1613 = _1611 + _1609;
    float _1615 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1619 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1617);
    float _1621 = precise::clamp(_1619, 0.0, 1.0);
    float _1623 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1625 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1627 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1615);
    float _1629 = rsqrt(_1613);
    float _1631 = -_1621;
    float _1633 = _1631 + 1.0;
    float _1635 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1637 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1627);
    float _1639 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1623);
    float _1641 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1643 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1645 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1635);
    float _1647 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1639);
    float _1649 = abs(_1633);
    float _1651 = log2(_1649);
    float _1653 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1641);
    float _1655 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1645);
    float _1657 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1659 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1661 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1663 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1665 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1667 = _1629 * _1585;
    float _1669 = _1629 * _1593;
    float _1671 = _1661 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1673 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1665);
    float _1675 = _1629 * _1597;
    float _1677 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1679 = -_1659;
    float _1681 = fma(_1679, _1625, 1.0);
    float _1683 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1673);
    float _1685 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1687 = -_1677;
    float _1689 = fma(_1675, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1687);
    float _1691 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1693 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1683);
    float _1695 = exp2(_1685);
    float _1697 = -_1669;
    float _1699 = fma(_1697, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1689);
    float _1701 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1703 = fma(_1699, -0.5, 0.5);
    float _1705 = fma(_1699, 0.5, 0.5);
    float _1707 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1701);
    float _1709 = log2(_1681);
    float _1711 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1691);
    float _1713 = _1675 + 1.0;
    float _1715 = fma(_1705, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1717 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1707);
    float _1719 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1711);
    float _1721 = fma(_1705, _1715, -0.212114393711090087890625);
    float _1723 = 1.0 / _1693;
    float _1725 = -_1675;
    float _1727 = fma(_1695, _1713, _1725);
    float _1729 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1717);
    float _1731 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1719);
    float _1733 = fma(_1705, _1721, 1.570728778839111328125);
    float _1735 = sqrt(_1703);
    float _1737 = _1709 * 0.693147182464599609375;
    float _1739 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1741 = _1729 * _1723;
    float _1743 = _1731 * _1723;
    float _1745 = fma(_1741, 0.5, 0.5);
    float _1747 = fma(_1743, -0.5, 0.5);
    float _1749 = fma(_1727, 0.5, 0.5);
    float _1751 = _1735 * 0.636619746685028076171875;
    float3 _4854 = float3(_1745, _1747, _1739);
    float _1753 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4854, float3(0.0), isnan(_4854)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4854, float3(0.0), isnan(_4854)), level(0.0)).x;
    float _1755 = -_1733;
    float _1757 = fma(_1751, _1755, 1.0);
    float3 _4870 = float3(_1745, _1747, _1739);
    float4 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4870, float3(0.0), isnan(_4870)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4870, float3(0.0), isnan(_4870)), level(0.0)).xyzw;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = _1760.w;
    float2 _4887 = float2(_1757, _1749);
    float3 _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4887, float2(0.0), isnan(_4887)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4887, float2(0.0), isnan(_4887)), level(0.0)).xyz;
    float _1774 = _1772.x;
    float _1776 = _1772.y;
    float _1778 = _1772.z;
    float _1780 = in.m_54.x;
    float _1782 = in.m_54.y;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1786 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1790 = _1788 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1792 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1794;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1800 = _1798 != 0;
    float _1802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1804 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1792);
    float _1806 = 1.0 / _1790;
    bool _1808 = _1780 > 0.5;
    bool _1810 = _1782 > 0.5;
    float _1812 = exp2(_1786);
    float _1814 = -_197;
    int _1816 = _1808 ? as_type<int>(_1814) : as_type<int>(_197);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1820 = _1818 != 0;
    bool _1822 = !_1800;
    float _1824 = _1822 ? _197 : as_type<float>(_1816);
    float _1826 = _1796 * _1806;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1830 = _991 + _1828;
    bool _1832 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1834 = isnan(_991);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = _1824 + 0.5;
    bool _1846 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1848 = isnan(_991);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = fma(_1826, _1830, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1860 = -_191;
    int _1862 = _1810 ? as_type<int>(_1860) : as_type<int>(_191);
    float _1864 = -_1842;
    float _1866 = _1864 + 1.0;
    float _1868 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1870 = -_1812;
    float _1872 = _1870 + 1.0;
    bool _1874 = !_1820;
    float _1876 = _1874 ? _191 : as_type<float>(_1862);
    float _1878 = _1856 * _1866;
    float _1880 = _1868 * _1784;
    float _1882 = -_1856;
    float _1884 = _1882 + 1.0;
    float _1886 = -_1876;
    float _1888 = _1886 + 0.5;
    float _1890 = _1858 * _1878;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1894 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1896 = fma(_1884, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1890);
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1900 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1904 = _1894 * _1802;
    float _1906 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1908 = _1902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1896);
    float _1912 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1804);
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1916 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_56.x = _1908;
    out.m_56.y = _1900;
    out.m_56.z = _1906;
    float _1918 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1912);
    float _1920 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1922 = _1439 > 0.0;
    bool _1924 = isnan(_1439);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.0);
    bool _1930 = _1926 || _1928;
    out.m_58.x = _1880;
    out.m_58.y = _1904;
    float _1932 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1934 = _1920 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1936 = _1918 + _1693;
    out.gl_Position.x = _1729;
    out.gl_Position.y = _1731;
    out.gl_Position.z = _1918;
    out.gl_Position.w = _1693;
    float _1938 = _1936 * 0.5;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1944 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1693 * 0.5;
    float _1948 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1729 + _1693;
    float _1954 = fma(_1731, -0.5, _1946);
    float _1956 = -_1916;
    float _1958 = _1956 + 1.0;
    out.m_45.x = _1934;
    float _1960 = _1952 * 0.5;
    out.m_60.x = _1944;
    out.m_60.y = _1948;
    out.m_60.z = _1950;
    out.m_60.w = _1932;
    out.m_62.x = _1960;
    out.m_62.y = _1954;
    out.m_62.z = _1938;
    out.m_62.w = _1693;
    float _1962 = _1916 * _1753;
    float _1964 = _1768 * _1962;
    float _1966 = _1768 * _1958;
    float _1968 = _1778 * _1962;
    float _1970 = fma(_1774, _1964, _1762);
    float _1972 = fma(_1776, _1964, _1764);
    float _1974 = fma(_1768, _1968, _1766);
    out.m_64.x = _1970;
    out.m_64.y = _1972;
    out.m_64.z = _1974;
    out.m_64.w = _1966;
    if (_1930)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1976 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1976;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _983 = false;
    bool _827 = false;
    bool _575 = false;
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
        float _2033 = as_type<float>(_99);
        out.gl_Position.z = _2033;
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
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2101 = as_type<float>(_135);
        out.gl_Position.z = _2101;
    }
    if (_129)
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
    if (!_155)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_155)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_187;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    bool _195 = !_183;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _193);
    bool _201 = !_155;
    float _203 = _179;
    float _205 = 0.0;
    if (!_201)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _139 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _139);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _235;
        _205 = _233;
    }
    float _237 = _203;
    float _239 = _205;
    bool _241 = !_155;
    float _243 = _239;
    if (!_241)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _139 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _167 = _263;
    }
    float _265 = _167;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = _267;
    float _275 = _271;
    if (!_155)
    {
        float _277 = _117 * _117;
        float _279 = _277 * 0.5;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = fma(_265, _141, _267);
    float _285 = fma(_265, _143, _269);
    float _287 = fma(_265, _145, _271);
    if (!_155)
    {
        float _289 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _289;
    }
    float _291 = _273;
    bool _293 = !_155;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _117 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _117);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
        _275 = _313;
    }
    float _327 = _295;
    float _329 = _275;
    float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = _329;
    if (!_155)
    {
        _333 = _117;
    }
    float _335 = _333;
    bool _337 = !_155;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _117 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _339 = _359;
    }
    float _361 = _339;
    float _363 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_361, _143, _331);
    float _367 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = fma(_361, _141, _363);
    float _371 = -_365;
    float _373 = _285 + _371;
    float _375 = fma(_361, _145, _367);
    float _377 = -_369;
    float _379 = _283 + _377;
    float _381 = _373 * _373;
    float _383 = -_375;
    float _385 = _287 + _383;
    float _387 = sqrt(_199);
    float _389 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _391 = fma(_379, _379, _381);
    float _393 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _397 = fma(_385, _385, _391);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _393);
    float _401 = sqrt(_163);
    float _403 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].y, _389);
    float _405 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].x, _395);
    float _411 = in.m_52.w;
    float _413 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _415 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].z, _405);
    float _417 = sqrt(_397);
    float _419 = in.m_42.x;
    float _421 = in.m_42.y;
    float _423 = in.m_42.z;
    float _425 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].x, _409);
    float _427 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].w, _413);
    float _429 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].z, _415);
    float _431 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].w, _427);
    float _433 = sqrt(_407);
    float _435 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].y, _403);
    float _437 = _401 * _425;
    float _439 = _387 * _435;
    bool _441 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_417);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = _439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _453 = _439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _451);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _455);
    float _463 = _433 * _429;
    float _465 = fma(_283, _411, _419);
    float _467 = fma(_285, _411, _421);
    float _469 = fma(_287, _411, _423);
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _477 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _479 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[25].w, _473);
    float _481 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[26].w, _475);
    float _483 = _475;
    float _485 = _431;
    float _487 = _477;
    if (_449)
    {
        _483 = _477;
    }
    float _489 = _483;
    float _491 = _489;
    if (_449)
    {
        _485 = _479;
    }
    float _493 = _485;
    float _495 = _493;
    if (_449)
    {
        _487 = _481;
    }
    float _497 = _487;
    float _499 = _497;
    if (!_449)
    {
        bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _503 = !_501;
        if (!_503)
        {
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _509 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _511 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _505);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _507);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _509);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _511);
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _513);
            float _523 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _515);
            float _525 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _519);
            float _527 = _387 * _521;
            float _529 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _517);
            float _531 = _401 * _523;
            float _533 = _527 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _535 = _527 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _537 = _433 * _529;
            float _539 = _527 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _541 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].x, _533);
            float _543 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].x, _535);
            float _545 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].x, _539);
            float _547 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[25].z, _541);
            float _549 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[24].z, _543);
            float _551 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[26].z, _545);
            float _553 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].w, _547);
            float _555 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].w, _549);
            float _557 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].w, _551);
            float _559 = _553 * _553;
            float _561 = fma(_555, _555, _559);
            float _563 = fma(_557, _557, _561);
            float _565 = rsqrt(_563);
            float _567 = _565 * 9.9999999747524270787835121154785e-07;
            float _569 = _555 * _567;
            float _571 = _553 * _567;
            float _573 = _557 * _567;
            _495 = _571;
            _491 = _569;
            _499 = _573;
            _575 = true;
        }
        else
        {
            float _577 = _143 * _143;
            float _579 = fma(_141, _141, _577);
            float _581 = fma(_145, _145, _579);
            float _583 = sqrt(_581);
            bool _585 = _583 >= 9.9999999747524270787835121154785e-07;
            bool _587 = isnan(_583);
            bool _589 = _585 || _587;
            bool _591 = isnan(9.9999999747524270787835121154785e-07);
            bool _593 = _589 || _591;
            if (!_593)
            {
                float _595 = _421 * _421;
                float _597 = fma(_419, _419, _595);
                float _599 = fma(_423, _423, _597);
                float _601 = sqrt(_599);
                bool _603 = _601 >= 9.9999999747524270787835121154785e-07;
                bool _605 = isnan(_601);
                bool _607 = _603 || _605;
                bool _609 = isnan(9.9999999747524270787835121154785e-07);
                bool _611 = _607 || _609;
                if (!_611)
                {
                    float _613 = _387 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _615 = _401 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _617 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _619 = _613 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _621 = _613 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _623 = _613 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _625 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _619);
                    float _627 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _621);
                    float _629 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _623);
                    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _625);
                    float _633 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _627);
                    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _633);
                    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _635);
                    float _643 = _637 * _637;
                    float _645 = fma(_639, _639, _643);
                    float _647 = fma(_641, _641, _645);
                    float _649 = rsqrt(_647);
                    float _651 = _649 * 9.9999999747524270787835121154785e-07;
                    float _653 = _639 * _651;
                    float _655 = _637 * _651;
                    float _657 = _641 * _651;
                    _495 = _655;
                    _491 = _653;
                    _499 = _657;
                    _575 = true;
                }
                else
                {
                    float _659 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _661 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _663 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _665 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _667 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].y, _659);
                    float _669 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].x, _661);
                    float _671 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].z, _663);
                    float _673 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].w, _665);
                    float _675 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].y, _667);
                    float _677 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].x, _669);
                    float _679 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].z, _671);
                    float _681 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].w, _673);
                    float _683 = _387 * _675;
                    float _685 = _401 * _677;
                    float _687 = _433 * _679;
                    float _689 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _691 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _693 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _689);
                    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
                    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _695);
                    float _703 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
                    float _705 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
                    float _707 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].w, _701);
                    float _709 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].w, _703);
                    float _711 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].w, _705);
                    float _713 = _707 * _707;
                    float _715 = fma(_709, _709, _713);
                    float _717 = fma(_711, _711, _715);
                    float _719 = rsqrt(_717);
                    float _721 = _719 * 9.9999999747524270787835121154785e-07;
                    float _723 = _709 * _721;
                    float _725 = _707 * _721;
                    float _727 = _711 * _721;
                    _495 = _725;
                    _491 = _723;
                    _499 = _727;
                    _575 = true;
                }
            }
            else
            {
                float _729 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _731 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _733 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _735 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _737 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].y, _729);
                float _739 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].x, _731);
                float _741 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].z, _733);
                float _743 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].w, _735);
                float _745 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].y, _737);
                float _747 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].x, _739);
                float _749 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].z, _741);
                float _751 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].w, _743);
                float _753 = _387 * _745;
                float _755 = _401 * _747;
                float _757 = _433 * _749;
                float _759 = _753 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _765 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].x, _759);
                float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].x, _763);
                float _771 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].z, _765);
                float _773 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
                float _775 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
                float _777 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].w, _771);
                float _779 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].w, _773);
                float _781 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].w, _775);
                float _783 = _777 * _777;
                float _785 = fma(_779, _779, _783);
                float _787 = fma(_781, _781, _785);
                float _789 = rsqrt(_787);
                float _791 = _789 * 9.9999999747524270787835121154785e-07;
                float _793 = _779 * _791;
                float _795 = _777 * _791;
                float _797 = _781 * _791;
                _495 = _795;
                _491 = _793;
                _499 = _797;
            }
        }
    }
    _575 = false;
    float _799 = _495;
    float _801 = _491;
    float _803 = _499;
    bool _805 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _807 = !_805;
    float _825;
    if (!_807)
    {
        float _809 = in.m_54.x;
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _813 = _809 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_83);
        float _831 = 1.0 / _829;
        float _833 = _117 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _839 = _835 + _837;
    bool _841 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _843 = isnan(_835);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _855 = _835 + _853;
    bool _857 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _859 = isnan(_835);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    float _881 = 1.0 / _875;
    bool _883 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _885 = isnan(_835);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _867 * _879;
    float _897 = -_867;
    float _899 = _897 + 1.0;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _905 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _907 = _893 * _899;
    float _909 = 1.0 / _871;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _911;
    float _915 = -_893;
    float _917 = _915 + 1.0;
    float _919 = _855 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _925 = fma(_903, _919, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _927 = fma(_923, _919, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _929 = _839 * _909;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _931;
    float _935 = in.m_52.x;
    float _937 = in.m_52.y;
    float _939 = fma(_913, _929, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _941 = fma(_933, _929, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _943 = _941 * _907;
    float _945 = _939 * _907;
    float _947 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[143].x, _943);
    float _949 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[143].y, _945);
    float _951 = fma(_927, _895, _947);
    float _953 = fma(_925, _895, _949);
    float _955 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].x, _951);
    float _957 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].y, _953);
    float _959 = _955 * _935;
    float _961 = _957 * _937;
    bool _963 = !_905;
    float _981;
    if (!_963)
    {
        float _965 = in.m_54.x;
        float _967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _969 = _965 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _973 = _971 * _967;
        float _975 = floor(_973);
        float _977 = -_975;
        float _979 = _973 + _977;
        _981 = _979;
        _983 = true;
    }
    else
    {
        float _985 = float(_83);
        float _987 = 1.0 / _985;
        float _989 = _117 * _987;
        _981 = _989;
    }
    _983 = false;
    float _991 = _981;
    float _993 = _799 * _799;
    float _995 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _997 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _999 = fma(_801, _801, _993);
    float _1001 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].y, _995);
    float _1003 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].z, _997);
    bool _1005 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1007 = isnan(0.5);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1013 = _1009 || _1011;
    float _1015 = fma(_803, _803, _999);
    float _1017 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1001);
    float _1019 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1003);
    bool _1021 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1023 = isnan(0.5);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1029 = _1025 || _1027;
    float _1031 = rsqrt(_1015);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1035 = _1031 * _803;
    float _1037 = _1031 * _801;
    float _1039 = _1031 * _799;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1043 = _1035 * _1041;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1047 = _1037 * _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1051 = _1039 * _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1055 = -_1043;
    float _1057 = fma(_1037, _1053, _1055);
    float _1059 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1063 = -_1051;
    float _1065 = fma(_1035, _1061, _1063);
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1069 = -_1047;
    float _1071 = fma(_1039, _1067, _1069);
    float _1073 = _1057 * _1057;
    float _1075 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1077 = _1059 * _1033;
    float _1079 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1081 = fma(_1065, _1065, _1073);
    float _1083 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1075);
    float _1085 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1087 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1089 = fma(_1071, _1071, _1081);
    float _1091 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1083);
    float _1093 = _1085 * _1079;
    float _1095 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1097 = rsqrt(_1089);
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1101 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1087);
    float _1103 = _387 * _1095;
    float _1105 = _1093 * _1035;
    float _1107 = _401 * _1099;
    float _1109 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1101);
    float _1111 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1113 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1115 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1117 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1111);
    float _1119 = _433 * _1113;
    float _1121 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1123 = _1065 * _1097;
    float _1125 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1127 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1129 = _1057 * _1097;
    float _1131 = _1071 * _1097;
    float _1133 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1125);
    float _1135 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1127);
    float _1137 = _1037 * _1129;
    float _1139 = fma(_1077, _1131, _1105);
    float _1141 = _1039 * _1131;
    float _1143 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1135);
    float _1145 = -_1137;
    float _1147 = fma(_1039, _1123, _1145);
    float _1149 = _1093 * _1037;
    float _1151 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1133);
    float _1153 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1143);
    float _1155 = fma(_1121, _1147, _1139);
    float _1157 = fma(_1077, _1123, _1149);
    float _1159 = -_1141;
    float _1161 = fma(_1035, _1129, _1159);
    float _1163 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1151);
    float _1165 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1167 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1117);
    float _1169 = fma(_1121, _1161, _1157);
    float _1171 = _1163 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1173 = _1165 + _1155;
    float _1175 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1167);
    float _1177 = _1171 + _1169;
    float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1181 = _1173 + _1179;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1187 = _1177 + _1185;
    float _1189 = _1181 * _1181;
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1193 = fma(_1187, _1187, _1189);
    float _1195 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1191);
    float _1197 = sqrt(_1193);
    float _1199 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1195);
    float _1201 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1203 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1205 = _1093 * _1039;
    float _1207 = _1035 * _1123;
    float _1209 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1201);
    float _1211 = 1.0 / _1203;
    float _1213 = fma(_1077, _1129, _1205);
    float _1215 = -_1207;
    float _1217 = fma(_1037, _1131, _1215);
    float _1219 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1209);
    float _1221 = fma(_1121, _1217, _1213);
    bool _1223 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1227 = _1183 + _1221;
    float _1229 = _1225 + _1203;
    float _1231 = _1229 * _1211;
    float _1233 = _1231 * 0.5;
    float _1235 = _1221;
    float _1237 = _1213;
    float _1239 = _1217;
    float _1241 = _1197;
    float _1243 = _1177;
    float _1245 = _1123;
    float _1247 = _1187;
    if (!_1223)
    {
        _1235 = _1177;
    }
    float _1249 = _1235;
    float _1251 = _1249;
    if (!_1223)
    {
        _1237 = _1173;
    }
    float _1253 = _1237;
    float _1255 = _1253;
    if (!_1223)
    {
        _1239 = _1227;
    }
    float _1257 = _1239;
    bool _1259 = !_1223;
    float _1261 = _1257;
    if (!_1259)
    {
        float _1263 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1267 = _1197 + _1265;
        float _1269 = rsqrt(_1193);
        float _1271 = _1267 * _1263;
        float _1273 = _1227 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = _1271 * 0.15915493667125701904296875;
        float _1277 = _1275 * 6.283185482025146484375;
        float _1279 = cos(_1277);
        float _1281 = _1275 * 6.283185482025146484375;
        float _1283 = sin(_1281);
        float _1285 = _1279 + (-1.0);
        float _1287 = fma(_1283, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1289 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1291 = _1269 * _1287;
        float _1293 = fma(_1227, _1279, _1289);
        float _1295 = fma(_1187, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1297 = fma(_1181, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1251 = _1295;
        _1255 = _1297;
        _1261 = _1293;
        _1241 = _1275;
    }
    float _1299 = _1251;
    float _1301 = _1255;
    float _1303 = _1261;
    float _1305 = _1241;
    float _1307 = _1303;
    float _1309 = _1299;
    float _1311 = _1301;
    float _1313 = _1305;
    if (_1029)
    {
        _1243 = 1.0;
    }
    float _1315 = _1243;
    float _1317 = _1315;
    if (!_1013)
    {
        float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1321 = _1183 + _1319;
        float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1325 = _1171 + _1323;
        float _1327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1329 = -_1171;
        float _1331 = _1329 + _1299;
        float _1333 = _1321 * _1321;
        float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1337 = _1165 + _1335;
        float _1339 = -_1165;
        float _1341 = _1339 + _1301;
        float _1343 = fma(_1325, _1325, _1333);
        float _1345 = fma(_1337, _1337, _1343);
        float _1347 = sqrt(_1345);
        float _1349 = precise::min(_1347, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1351 = _1349 * _1327;
        float _1353 = -_1183;
        float _1355 = _1353 + _1303;
        float _1357 = fma(_1331, _1351, _1171);
        float _1359 = fma(_1355, _1351, _1183);
        float _1361 = fma(_1341, _1351, _1165);
        _1245 = _1351;
        _1307 = _1359;
        _1309 = _1357;
        _1311 = _1361;
        _1313 = _1331;
    }
    float _1363 = _1245;
    float _1365 = _1307;
    float _1367 = _1309;
    float _1369 = _1311;
    float _1371 = _1313;
    float _1373 = _1363;
    float _1375 = _1371;
    if (!_1029)
    {
        float _1377 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1385 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1383);
        float _1387 = _1379 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1381 * 0.15915493667125701904296875;
        float _1393 = _1379 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = 1.0 / _1389;
        float _1399 = _1391 * 6.283185482025146484375;
        float _1401 = cos(_1399);
        float _1403 = _1395 * _1397;
        float _1405 = _1391 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        float _1409 = _1401 * _1403;
        float _1411 = 1.0 / _1385;
        float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1415 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1413;
        float _1417 = 1.0 / _1409;
        float _1419 = 1.0 / _1415;
        float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1423 = _1411 * _1421;
        float _1425 = _1407 * _1417;
        float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1429 = fma(_1425, _1423, _1427);
        float _1431 = _1429 * _1419;
        float _1433 = precise::clamp(_1431, 0.0, 1.0);
        _1373 = _1397;
        _1375 = _1417;
        _1317 = _1433;
    }
    float _1435 = _1373;
    float _1437 = _1375;
    float _1439 = _1317;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1443 = _1365 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1447 = _1367 + _1445;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1451 = _1369 + _1449;
    float _1453 = _1443 * _1443;
    float _1455 = fma(_1447, _1447, _1453);
    float _1457 = fma(_1451, _1451, _1455);
    float _1459 = rsqrt(_1457);
    float _1461 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1463 = _1447 * _1461;
    float _1465 = _1451 * _1461;
    float _1467 = _1463 * _1463;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1479 = _1473 + _1477;
    float _1481 = _1451;
    float _1483 = _1437;
    float _1485 = _1479;
    float _1487 = _1435;
    float _1489 = _1443;
    if (_1475)
    {
        float _1491 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1491;
    }
    float _1493 = _1481;
    if (_1475)
    {
        float _1495 = rsqrt(_1471);
        _1483 = _1495;
    }
    float _1497 = _1483;
    float _1499 = _1497;
    if (_1475)
    {
        float _1501 = _1479 * _1493;
        _1485 = _1501;
    }
    float _1503 = _1485;
    if (_1475)
    {
        float _1505 = _1503 * 0.15915493667125701904296875;
        _1487 = _1505;
    }
    float _1507 = _1487;
    float _1509 = _1459;
    if (_1475)
    {
        float _1511 = _1507 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1519 = precise::max(0.0, _1517);
    float _1521 = _1455;
    float _1523 = _1519;
    float _1525 = _1517;
    if (_1475)
    {
        float _1527 = _1507 * 6.283185482025146484375;
        float _1529 = cos(_1527);
        _1521 = _1529;
    }
    float _1531 = _1521;
    float _1533 = -_1461;
    float _1535 = -_1519;
    float _1537 = fma(_1443, _1533, _1535);
    if (!_1475)
    {
        _1523 = _1463;
    }
    float _1539 = _1523;
    float _1541 = _1539;
    if (_1475)
    {
        float _1543 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1525 = _1543;
    }
    float _1545 = _1525;
    float _1547 = sqrt(_1457);
    float _1549 = _1515;
    float _1551 = _1545;
    if (_1475)
    {
        float _1553 = fma(_1515, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1489 = _1553;
    }
    float _1555 = _1489;
    float _1557 = _1555;
    if (!_1475)
    {
        _1549 = _1467;
    }
    float _1559 = _1549;
    float _1561 = _1559;
    float _1563 = _1531;
    if (_1475)
    {
        float _1565 = _1531 + (-1.0);
        _1551 = _1565;
    }
    float _1567 = _1551;
    float _1569 = _1567;
    if (_1475)
    {
        float _1571 = _1497 * _1555;
        _1247 = _1571;
    }
    float _1573 = _1247;
    if (!_1475)
    {
        _1557 = _1537;
    }
    float _1575 = _1557;
    float _1577 = _1575;
    if (_1475)
    {
        float _1579 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1579;
    }
    float _1581 = _1499;
    if (_1475)
    {
        float _1583 = _1463 * _1573;
        _1541 = _1583;
    }
    float _1585 = _1541;
    if (!_1475)
    {
        _1569 = _1465;
    }
    float _1587 = _1569;
    float _1589 = _1587;
    if (_1475)
    {
        float _1591 = _1465 * _1573;
        _1589 = _1591;
    }
    float _1593 = _1589;
    if (_1475)
    {
        float _1595 = fma(_1537, _1531, _1581);
        _1577 = _1595;
    }
    float _1597 = _1577;
    if (_1475)
    {
        float _1599 = _1585 * _1585;
        _1561 = _1599;
    }
    float _1601 = _1561;
    if (!_1475)
    {
        _1563 = _1469;
    }
    float _1603 = _1563;
    float _1605 = _1603;
    if (_1475)
    {
        float _1607 = _1593 * _1593;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = fma(_1597, _1597, _1601);
    float _1613 = _1611 + _1609;
    float _1615 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1619 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1617);
    float _1621 = precise::clamp(_1619, 0.0, 1.0);
    float _1623 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1625 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1627 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1615);
    float _1629 = rsqrt(_1613);
    float _1631 = -_1621;
    float _1633 = _1631 + 1.0;
    float _1635 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1637 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1627);
    float _1639 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1623);
    float _1641 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1643 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1645 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1635);
    float _1647 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1639);
    float _1649 = abs(_1633);
    float _1651 = log2(_1649);
    float _1653 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1641);
    float _1655 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1645);
    float _1657 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1659 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1661 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1663 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1665 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1667 = _1629 * _1585;
    float _1669 = _1629 * _1593;
    float _1671 = _1661 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1673 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1665);
    float _1675 = _1629 * _1597;
    float _1677 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1679 = -_1659;
    float _1681 = fma(_1679, _1625, 1.0);
    float _1683 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1673);
    float _1685 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1687 = -_1677;
    float _1689 = fma(_1675, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1687);
    float _1691 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1693 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1683);
    float _1695 = exp2(_1685);
    float _1697 = -_1669;
    float _1699 = fma(_1697, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1689);
    float _1701 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1703 = fma(_1699, -0.5, 0.5);
    float _1705 = fma(_1699, 0.5, 0.5);
    float _1707 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1701);
    float _1709 = log2(_1681);
    float _1711 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1691);
    float _1713 = _1675 + 1.0;
    float _1715 = fma(_1705, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1717 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1707);
    float _1719 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1711);
    float _1721 = fma(_1705, _1715, -0.212114393711090087890625);
    float _1723 = 1.0 / _1693;
    float _1725 = -_1675;
    float _1727 = fma(_1695, _1713, _1725);
    float _1729 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1717);
    float _1731 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1719);
    float _1733 = fma(_1705, _1721, 1.570728778839111328125);
    float _1735 = sqrt(_1703);
    float _1737 = _1709 * 0.693147182464599609375;
    float _1739 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1741 = _1729 * _1723;
    float _1743 = _1731 * _1723;
    float _1745 = fma(_1741, 0.5, 0.5);
    float _1747 = fma(_1743, -0.5, 0.5);
    float _1749 = fma(_1727, 0.5, 0.5);
    float _1751 = _1735 * 0.636619746685028076171875;
    float3 _4854 = float3(_1745, _1747, _1739);
    float _1753 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4854, float3(0.0), isnan(_4854)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4854, float3(0.0), isnan(_4854)), level(0.0)).x;
    float _1755 = -_1733;
    float _1757 = fma(_1751, _1755, 1.0);
    float3 _4870 = float3(_1745, _1747, _1739);
    float4 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4870, float3(0.0), isnan(_4870)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4870, float3(0.0), isnan(_4870)), level(0.0)).xyzw;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = _1760.w;
    float2 _4887 = float2(_1757, _1749);
    float3 _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4887, float2(0.0), isnan(_4887)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4887, float2(0.0), isnan(_4887)), level(0.0)).xyz;
    float _1774 = _1772.x;
    float _1776 = _1772.y;
    float _1778 = _1772.z;
    float _1780 = in.m_54.x;
    float _1782 = in.m_54.y;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1786 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1790 = _1788 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1792 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1794;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1800 = _1798 != 0;
    float _1802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1804 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1792);
    float _1806 = 1.0 / _1790;
    bool _1808 = _1780 > 0.5;
    bool _1810 = _1782 > 0.5;
    float _1812 = exp2(_1786);
    float _1814 = -_197;
    int _1816 = _1808 ? as_type<int>(_1814) : as_type<int>(_197);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1820 = _1818 != 0;
    bool _1822 = !_1800;
    float _1824 = _1822 ? _197 : as_type<float>(_1816);
    float _1826 = _1796 * _1806;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1830 = _991 + _1828;
    bool _1832 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1834 = isnan(_991);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = _1824 + 0.5;
    bool _1846 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1848 = isnan(_991);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = fma(_1826, _1830, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1860 = -_191;
    int _1862 = _1810 ? as_type<int>(_1860) : as_type<int>(_191);
    float _1864 = -_1842;
    float _1866 = _1864 + 1.0;
    float _1868 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1870 = -_1812;
    float _1872 = _1870 + 1.0;
    bool _1874 = !_1820;
    float _1876 = _1874 ? _191 : as_type<float>(_1862);
    float _1878 = _1856 * _1866;
    float _1880 = _1868 * _1784;
    float _1882 = -_1856;
    float _1884 = _1882 + 1.0;
    float _1886 = -_1876;
    float _1888 = _1886 + 0.5;
    float _1890 = _1858 * _1878;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1894 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1896 = fma(_1884, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1890);
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1900 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1904 = _1894 * _1802;
    float _1906 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1908 = _1902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1896);
    float _1912 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1804);
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1916 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_56.x = _1908;
    out.m_56.y = _1900;
    out.m_56.z = _1906;
    float _1918 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1912);
    float _1920 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1922 = _1439 > 0.0;
    bool _1924 = isnan(_1439);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.0);
    bool _1930 = _1926 || _1928;
    out.m_58.x = _1880;
    out.m_58.y = _1904;
    float _1932 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1934 = _1920 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1936 = _1918 + _1693;
    out.gl_Position.x = _1729;
    out.gl_Position.y = _1731;
    out.gl_Position.z = _1918;
    out.gl_Position.w = _1693;
    float _1938 = _1936 * 0.5;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1944 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1693 * 0.5;
    float _1948 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1729 + _1693;
    float _1954 = fma(_1731, -0.5, _1946);
    float _1956 = -_1916;
    float _1958 = _1956 + 1.0;
    out.m_45.x = _1934;
    float _1960 = _1952 * 0.5;
    out.m_60.x = _1944;
    out.m_60.y = _1948;
    out.m_60.z = _1950;
    out.m_60.w = _1932;
    out.m_62.x = _1960;
    out.m_62.y = _1954;
    out.m_62.z = _1938;
    out.m_62.w = _1693;
    float _1962 = _1916 * _1753;
    float _1964 = _1768 * _1962;
    float _1966 = _1768 * _1958;
    float _1968 = _1778 * _1962;
    float _1970 = fma(_1774, _1964, _1762);
    float _1972 = fma(_1776, _1964, _1764);
    float _1974 = fma(_1768, _1968, _1766);
    out.m_64.x = _1970;
    out.m_64.y = _1972;
    out.m_64.z = _1974;
    out.m_64.w = _1966;
    if (_1930)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1976 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1976;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _983 = false;
    bool _827 = false;
    bool _575 = false;
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
        float _2033 = as_type<float>(_99);
        out.gl_Position.z = _2033;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2101 = as_type<float>(_135);
        out.gl_Position.z = _2101;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    if (!_155)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_155)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_187;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    bool _195 = !_183;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _193);
    bool _201 = !_155;
    float _203 = _179;
    float _205 = 0.0;
    if (!_201)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _139 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _139);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _235;
        _205 = _233;
    }
    float _237 = _203;
    float _239 = _205;
    bool _241 = !_155;
    float _243 = _239;
    if (!_241)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _139 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _167 = _263;
    }
    float _265 = _167;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = _267;
    float _275 = _271;
    if (!_155)
    {
        float _277 = _117 * _117;
        float _279 = _277 * 0.5;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = fma(_265, _141, _267);
    float _285 = fma(_265, _143, _269);
    float _287 = fma(_265, _145, _271);
    if (!_155)
    {
        float _289 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _289;
    }
    float _291 = _273;
    bool _293 = !_155;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _117 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _117);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
        _275 = _313;
    }
    float _327 = _295;
    float _329 = _275;
    float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = _329;
    if (!_155)
    {
        _333 = _117;
    }
    float _335 = _333;
    bool _337 = !_155;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _117 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _339 = _359;
    }
    float _361 = _339;
    float _363 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_361, _143, _331);
    float _367 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = fma(_361, _141, _363);
    float _371 = -_365;
    float _373 = _285 + _371;
    float _375 = fma(_361, _145, _367);
    float _377 = -_369;
    float _379 = _283 + _377;
    float _381 = _373 * _373;
    float _383 = -_375;
    float _385 = _287 + _383;
    float _387 = sqrt(_199);
    float _389 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _391 = fma(_379, _379, _381);
    float _393 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _397 = fma(_385, _385, _391);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _393);
    float _401 = sqrt(_163);
    float _403 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].y, _389);
    float _405 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].x, _395);
    float _411 = in.m_52.w;
    float _413 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _415 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].z, _405);
    float _417 = sqrt(_397);
    float _419 = in.m_42.x;
    float _421 = in.m_42.y;
    float _423 = in.m_42.z;
    float _425 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].x, _409);
    float _427 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[14].w, _413);
    float _429 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].z, _415);
    float _431 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].w, _427);
    float _433 = sqrt(_407);
    float _435 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[16].y, _403);
    float _437 = _401 * _425;
    float _439 = _387 * _435;
    bool _441 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_417);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = _439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _453 = _439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _451);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _455);
    float _463 = _433 * _429;
    float _465 = fma(_283, _411, _419);
    float _467 = fma(_285, _411, _421);
    float _469 = fma(_287, _411, _423);
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _477 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _479 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[25].w, _473);
    float _481 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[26].w, _475);
    float _483 = _475;
    float _485 = _431;
    float _487 = _477;
    if (_449)
    {
        _483 = _477;
    }
    float _489 = _483;
    float _491 = _489;
    if (_449)
    {
        _485 = _479;
    }
    float _493 = _485;
    float _495 = _493;
    if (_449)
    {
        _487 = _481;
    }
    float _497 = _487;
    float _499 = _497;
    if (!_449)
    {
        bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _503 = !_501;
        if (!_503)
        {
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _509 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _511 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _505);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _507);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _509);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _511);
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _513);
            float _523 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _515);
            float _525 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _519);
            float _527 = _387 * _521;
            float _529 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _517);
            float _531 = _401 * _523;
            float _533 = _527 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _535 = _527 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _537 = _433 * _529;
            float _539 = _527 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _541 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].x, _533);
            float _543 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].x, _535);
            float _545 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].x, _539);
            float _547 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[25].z, _541);
            float _549 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[24].z, _543);
            float _551 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[26].z, _545);
            float _553 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].w, _547);
            float _555 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].w, _549);
            float _557 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].w, _551);
            float _559 = _553 * _553;
            float _561 = fma(_555, _555, _559);
            float _563 = fma(_557, _557, _561);
            float _565 = rsqrt(_563);
            float _567 = _565 * 9.9999999747524270787835121154785e-07;
            float _569 = _555 * _567;
            float _571 = _553 * _567;
            float _573 = _557 * _567;
            _495 = _571;
            _491 = _569;
            _499 = _573;
            _575 = true;
        }
        else
        {
            float _577 = _143 * _143;
            float _579 = fma(_141, _141, _577);
            float _581 = fma(_145, _145, _579);
            float _583 = sqrt(_581);
            bool _585 = _583 >= 9.9999999747524270787835121154785e-07;
            bool _587 = isnan(_583);
            bool _589 = _585 || _587;
            bool _591 = isnan(9.9999999747524270787835121154785e-07);
            bool _593 = _589 || _591;
            if (!_593)
            {
                float _595 = _421 * _421;
                float _597 = fma(_419, _419, _595);
                float _599 = fma(_423, _423, _597);
                float _601 = sqrt(_599);
                bool _603 = _601 >= 9.9999999747524270787835121154785e-07;
                bool _605 = isnan(_601);
                bool _607 = _603 || _605;
                bool _609 = isnan(9.9999999747524270787835121154785e-07);
                bool _611 = _607 || _609;
                if (!_611)
                {
                    float _613 = _387 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _615 = _401 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _617 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _619 = _613 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _621 = _613 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _623 = _613 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _625 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _619);
                    float _627 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _621);
                    float _629 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _623);
                    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _625);
                    float _633 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _627);
                    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _633);
                    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _635);
                    float _643 = _637 * _637;
                    float _645 = fma(_639, _639, _643);
                    float _647 = fma(_641, _641, _645);
                    float _649 = rsqrt(_647);
                    float _651 = _649 * 9.9999999747524270787835121154785e-07;
                    float _653 = _639 * _651;
                    float _655 = _637 * _651;
                    float _657 = _641 * _651;
                    _495 = _655;
                    _491 = _653;
                    _499 = _657;
                    _575 = true;
                }
                else
                {
                    float _659 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _661 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _663 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _665 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _667 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].y, _659);
                    float _669 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].x, _661);
                    float _671 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].z, _663);
                    float _673 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[14].w, _665);
                    float _675 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].y, _667);
                    float _677 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].x, _669);
                    float _679 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].z, _671);
                    float _681 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[16].w, _673);
                    float _683 = _387 * _675;
                    float _685 = _401 * _677;
                    float _687 = _433 * _679;
                    float _689 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _691 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _693 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _689);
                    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
                    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _695);
                    float _703 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
                    float _705 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
                    float _707 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].w, _701);
                    float _709 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].w, _703);
                    float _711 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].w, _705);
                    float _713 = _707 * _707;
                    float _715 = fma(_709, _709, _713);
                    float _717 = fma(_711, _711, _715);
                    float _719 = rsqrt(_717);
                    float _721 = _719 * 9.9999999747524270787835121154785e-07;
                    float _723 = _709 * _721;
                    float _725 = _707 * _721;
                    float _727 = _711 * _721;
                    _495 = _725;
                    _491 = _723;
                    _499 = _727;
                    _575 = true;
                }
            }
            else
            {
                float _729 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _731 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _733 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _735 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _737 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].y, _729);
                float _739 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].x, _731);
                float _741 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].z, _733);
                float _743 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].w, _735);
                float _745 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].y, _737);
                float _747 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].x, _739);
                float _749 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].z, _741);
                float _751 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].w, _743);
                float _753 = _387 * _745;
                float _755 = _401 * _747;
                float _757 = _433 * _749;
                float _759 = _753 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _765 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].x, _759);
                float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].x, _763);
                float _771 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].z, _765);
                float _773 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
                float _775 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
                float _777 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].w, _771);
                float _779 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].w, _773);
                float _781 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].w, _775);
                float _783 = _777 * _777;
                float _785 = fma(_779, _779, _783);
                float _787 = fma(_781, _781, _785);
                float _789 = rsqrt(_787);
                float _791 = _789 * 9.9999999747524270787835121154785e-07;
                float _793 = _779 * _791;
                float _795 = _777 * _791;
                float _797 = _781 * _791;
                _495 = _795;
                _491 = _793;
                _499 = _797;
            }
        }
    }
    _575 = false;
    float _799 = _495;
    float _801 = _491;
    float _803 = _499;
    bool _805 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _807 = !_805;
    float _825;
    if (!_807)
    {
        float _809 = in.m_54.x;
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _813 = _809 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_83);
        float _831 = 1.0 / _829;
        float _833 = _117 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _839 = _835 + _837;
    bool _841 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _843 = isnan(_835);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _855 = _835 + _853;
    bool _857 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _859 = isnan(_835);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    float _881 = 1.0 / _875;
    bool _883 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _885 = isnan(_835);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _867 * _879;
    float _897 = -_867;
    float _899 = _897 + 1.0;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _905 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _907 = _893 * _899;
    float _909 = 1.0 / _871;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _911;
    float _915 = -_893;
    float _917 = _915 + 1.0;
    float _919 = _855 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _925 = fma(_903, _919, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _927 = fma(_923, _919, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _929 = _839 * _909;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _931;
    float _935 = in.m_52.x;
    float _937 = in.m_52.y;
    float _939 = fma(_913, _929, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _941 = fma(_933, _929, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _943 = _941 * _907;
    float _945 = _939 * _907;
    float _947 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[143].x, _943);
    float _949 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[143].y, _945);
    float _951 = fma(_927, _895, _947);
    float _953 = fma(_925, _895, _949);
    float _955 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].x, _951);
    float _957 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].y, _953);
    float _959 = _955 * _935;
    float _961 = _957 * _937;
    bool _963 = !_905;
    float _981;
    if (!_963)
    {
        float _965 = in.m_54.x;
        float _967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _969 = _965 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _973 = _971 * _967;
        float _975 = floor(_973);
        float _977 = -_975;
        float _979 = _973 + _977;
        _981 = _979;
        _983 = true;
    }
    else
    {
        float _985 = float(_83);
        float _987 = 1.0 / _985;
        float _989 = _117 * _987;
        _981 = _989;
    }
    _983 = false;
    float _991 = _981;
    float _993 = _799 * _799;
    float _995 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _997 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _999 = fma(_801, _801, _993);
    float _1001 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].y, _995);
    float _1003 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].z, _997);
    bool _1005 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1007 = isnan(0.5);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1013 = _1009 || _1011;
    float _1015 = fma(_803, _803, _999);
    float _1017 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1001);
    float _1019 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1003);
    bool _1021 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1023 = isnan(0.5);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1029 = _1025 || _1027;
    float _1031 = rsqrt(_1015);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1035 = _1031 * _803;
    float _1037 = _1031 * _801;
    float _1039 = _1031 * _799;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1043 = _1035 * _1041;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1047 = _1037 * _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1051 = _1039 * _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1055 = -_1043;
    float _1057 = fma(_1037, _1053, _1055);
    float _1059 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1063 = -_1051;
    float _1065 = fma(_1035, _1061, _1063);
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1069 = -_1047;
    float _1071 = fma(_1039, _1067, _1069);
    float _1073 = _1057 * _1057;
    float _1075 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1077 = _1059 * _1033;
    float _1079 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1081 = fma(_1065, _1065, _1073);
    float _1083 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1075);
    float _1085 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1087 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1089 = fma(_1071, _1071, _1081);
    float _1091 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1083);
    float _1093 = _1085 * _1079;
    float _1095 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1097 = rsqrt(_1089);
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1101 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1087);
    float _1103 = _387 * _1095;
    float _1105 = _1093 * _1035;
    float _1107 = _401 * _1099;
    float _1109 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1101);
    float _1111 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1113 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1115 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1117 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1111);
    float _1119 = _433 * _1113;
    float _1121 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1123 = _1065 * _1097;
    float _1125 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1127 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1129 = _1057 * _1097;
    float _1131 = _1071 * _1097;
    float _1133 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1125);
    float _1135 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1127);
    float _1137 = _1037 * _1129;
    float _1139 = fma(_1077, _1131, _1105);
    float _1141 = _1039 * _1131;
    float _1143 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1135);
    float _1145 = -_1137;
    float _1147 = fma(_1039, _1123, _1145);
    float _1149 = _1093 * _1037;
    float _1151 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1133);
    float _1153 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1143);
    float _1155 = fma(_1121, _1147, _1139);
    float _1157 = fma(_1077, _1123, _1149);
    float _1159 = -_1141;
    float _1161 = fma(_1035, _1129, _1159);
    float _1163 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1151);
    float _1165 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1167 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1117);
    float _1169 = fma(_1121, _1161, _1157);
    float _1171 = _1163 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1173 = _1165 + _1155;
    float _1175 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1167);
    float _1177 = _1171 + _1169;
    float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1181 = _1173 + _1179;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1187 = _1177 + _1185;
    float _1189 = _1181 * _1181;
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1193 = fma(_1187, _1187, _1189);
    float _1195 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1191);
    float _1197 = sqrt(_1193);
    float _1199 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1195);
    float _1201 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1203 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1205 = _1093 * _1039;
    float _1207 = _1035 * _1123;
    float _1209 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1201);
    float _1211 = 1.0 / _1203;
    float _1213 = fma(_1077, _1129, _1205);
    float _1215 = -_1207;
    float _1217 = fma(_1037, _1131, _1215);
    float _1219 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1209);
    float _1221 = fma(_1121, _1217, _1213);
    bool _1223 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1227 = _1183 + _1221;
    float _1229 = _1225 + _1203;
    float _1231 = _1229 * _1211;
    float _1233 = _1231 * 0.5;
    float _1235 = _1221;
    float _1237 = _1213;
    float _1239 = _1217;
    float _1241 = _1197;
    float _1243 = _1177;
    float _1245 = _1123;
    float _1247 = _1187;
    if (!_1223)
    {
        _1235 = _1177;
    }
    float _1249 = _1235;
    float _1251 = _1249;
    if (!_1223)
    {
        _1237 = _1173;
    }
    float _1253 = _1237;
    float _1255 = _1253;
    if (!_1223)
    {
        _1239 = _1227;
    }
    float _1257 = _1239;
    bool _1259 = !_1223;
    float _1261 = _1257;
    if (!_1259)
    {
        float _1263 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1267 = _1197 + _1265;
        float _1269 = rsqrt(_1193);
        float _1271 = _1267 * _1263;
        float _1273 = _1227 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = _1271 * 0.15915493667125701904296875;
        float _1277 = _1275 * 6.283185482025146484375;
        float _1279 = cos(_1277);
        float _1281 = _1275 * 6.283185482025146484375;
        float _1283 = sin(_1281);
        float _1285 = _1279 + (-1.0);
        float _1287 = fma(_1283, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1289 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1291 = _1269 * _1287;
        float _1293 = fma(_1227, _1279, _1289);
        float _1295 = fma(_1187, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1297 = fma(_1181, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1251 = _1295;
        _1255 = _1297;
        _1261 = _1293;
        _1241 = _1275;
    }
    float _1299 = _1251;
    float _1301 = _1255;
    float _1303 = _1261;
    float _1305 = _1241;
    float _1307 = _1303;
    float _1309 = _1299;
    float _1311 = _1301;
    float _1313 = _1305;
    if (_1029)
    {
        _1243 = 1.0;
    }
    float _1315 = _1243;
    float _1317 = _1315;
    if (!_1013)
    {
        float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1321 = _1183 + _1319;
        float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1325 = _1171 + _1323;
        float _1327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1329 = -_1171;
        float _1331 = _1329 + _1299;
        float _1333 = _1321 * _1321;
        float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1337 = _1165 + _1335;
        float _1339 = -_1165;
        float _1341 = _1339 + _1301;
        float _1343 = fma(_1325, _1325, _1333);
        float _1345 = fma(_1337, _1337, _1343);
        float _1347 = sqrt(_1345);
        float _1349 = precise::min(_1347, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1351 = _1349 * _1327;
        float _1353 = -_1183;
        float _1355 = _1353 + _1303;
        float _1357 = fma(_1331, _1351, _1171);
        float _1359 = fma(_1355, _1351, _1183);
        float _1361 = fma(_1341, _1351, _1165);
        _1245 = _1351;
        _1307 = _1359;
        _1309 = _1357;
        _1311 = _1361;
        _1313 = _1331;
    }
    float _1363 = _1245;
    float _1365 = _1307;
    float _1367 = _1309;
    float _1369 = _1311;
    float _1371 = _1313;
    float _1373 = _1363;
    float _1375 = _1371;
    if (!_1029)
    {
        float _1377 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1385 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1383);
        float _1387 = _1379 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1381 * 0.15915493667125701904296875;
        float _1393 = _1379 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = 1.0 / _1389;
        float _1399 = _1391 * 6.283185482025146484375;
        float _1401 = cos(_1399);
        float _1403 = _1395 * _1397;
        float _1405 = _1391 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        float _1409 = _1401 * _1403;
        float _1411 = 1.0 / _1385;
        float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1415 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1413;
        float _1417 = 1.0 / _1409;
        float _1419 = 1.0 / _1415;
        float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1423 = _1411 * _1421;
        float _1425 = _1407 * _1417;
        float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1429 = fma(_1425, _1423, _1427);
        float _1431 = _1429 * _1419;
        float _1433 = precise::clamp(_1431, 0.0, 1.0);
        _1373 = _1397;
        _1375 = _1417;
        _1317 = _1433;
    }
    float _1435 = _1373;
    float _1437 = _1375;
    float _1439 = _1317;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1443 = _1365 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1447 = _1367 + _1445;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1451 = _1369 + _1449;
    float _1453 = _1443 * _1443;
    float _1455 = fma(_1447, _1447, _1453);
    float _1457 = fma(_1451, _1451, _1455);
    float _1459 = rsqrt(_1457);
    float _1461 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1463 = _1447 * _1461;
    float _1465 = _1451 * _1461;
    float _1467 = _1463 * _1463;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1479 = _1473 + _1477;
    float _1481 = _1451;
    float _1483 = _1437;
    float _1485 = _1479;
    float _1487 = _1435;
    float _1489 = _1443;
    if (_1475)
    {
        float _1491 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1491;
    }
    float _1493 = _1481;
    if (_1475)
    {
        float _1495 = rsqrt(_1471);
        _1483 = _1495;
    }
    float _1497 = _1483;
    float _1499 = _1497;
    if (_1475)
    {
        float _1501 = _1479 * _1493;
        _1485 = _1501;
    }
    float _1503 = _1485;
    if (_1475)
    {
        float _1505 = _1503 * 0.15915493667125701904296875;
        _1487 = _1505;
    }
    float _1507 = _1487;
    float _1509 = _1459;
    if (_1475)
    {
        float _1511 = _1507 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1519 = precise::max(0.0, _1517);
    float _1521 = _1455;
    float _1523 = _1519;
    float _1525 = _1517;
    if (_1475)
    {
        float _1527 = _1507 * 6.283185482025146484375;
        float _1529 = cos(_1527);
        _1521 = _1529;
    }
    float _1531 = _1521;
    float _1533 = -_1461;
    float _1535 = -_1519;
    float _1537 = fma(_1443, _1533, _1535);
    if (!_1475)
    {
        _1523 = _1463;
    }
    float _1539 = _1523;
    float _1541 = _1539;
    if (_1475)
    {
        float _1543 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1525 = _1543;
    }
    float _1545 = _1525;
    float _1547 = sqrt(_1457);
    float _1549 = _1515;
    float _1551 = _1545;
    if (_1475)
    {
        float _1553 = fma(_1515, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1489 = _1553;
    }
    float _1555 = _1489;
    float _1557 = _1555;
    if (!_1475)
    {
        _1549 = _1467;
    }
    float _1559 = _1549;
    float _1561 = _1559;
    float _1563 = _1531;
    if (_1475)
    {
        float _1565 = _1531 + (-1.0);
        _1551 = _1565;
    }
    float _1567 = _1551;
    float _1569 = _1567;
    if (_1475)
    {
        float _1571 = _1497 * _1555;
        _1247 = _1571;
    }
    float _1573 = _1247;
    if (!_1475)
    {
        _1557 = _1537;
    }
    float _1575 = _1557;
    float _1577 = _1575;
    if (_1475)
    {
        float _1579 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1579;
    }
    float _1581 = _1499;
    if (_1475)
    {
        float _1583 = _1463 * _1573;
        _1541 = _1583;
    }
    float _1585 = _1541;
    if (!_1475)
    {
        _1569 = _1465;
    }
    float _1587 = _1569;
    float _1589 = _1587;
    if (_1475)
    {
        float _1591 = _1465 * _1573;
        _1589 = _1591;
    }
    float _1593 = _1589;
    if (_1475)
    {
        float _1595 = fma(_1537, _1531, _1581);
        _1577 = _1595;
    }
    float _1597 = _1577;
    if (_1475)
    {
        float _1599 = _1585 * _1585;
        _1561 = _1599;
    }
    float _1601 = _1561;
    if (!_1475)
    {
        _1563 = _1469;
    }
    float _1603 = _1563;
    float _1605 = _1603;
    if (_1475)
    {
        float _1607 = _1593 * _1593;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = fma(_1597, _1597, _1601);
    float _1613 = _1611 + _1609;
    float _1615 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1619 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1617);
    float _1621 = precise::clamp(_1619, 0.0, 1.0);
    float _1623 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1625 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1627 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1615);
    float _1629 = rsqrt(_1613);
    float _1631 = -_1621;
    float _1633 = _1631 + 1.0;
    float _1635 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1637 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1627);
    float _1639 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1623);
    float _1641 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1643 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1645 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1635);
    float _1647 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1639);
    float _1649 = abs(_1633);
    float _1651 = log2(_1649);
    float _1653 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1641);
    float _1655 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1645);
    float _1657 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1659 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1661 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1663 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1665 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1667 = _1629 * _1585;
    float _1669 = _1629 * _1593;
    float _1671 = _1661 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1673 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1665);
    float _1675 = _1629 * _1597;
    float _1677 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1679 = -_1659;
    float _1681 = fma(_1679, _1625, 1.0);
    float _1683 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1673);
    float _1685 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1687 = -_1677;
    float _1689 = fma(_1675, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1687);
    float _1691 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1693 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1683);
    float _1695 = exp2(_1685);
    float _1697 = -_1669;
    float _1699 = fma(_1697, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1689);
    float _1701 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1703 = fma(_1699, -0.5, 0.5);
    float _1705 = fma(_1699, 0.5, 0.5);
    float _1707 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1701);
    float _1709 = log2(_1681);
    float _1711 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1691);
    float _1713 = _1675 + 1.0;
    float _1715 = fma(_1705, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1717 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1707);
    float _1719 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1711);
    float _1721 = fma(_1705, _1715, -0.212114393711090087890625);
    float _1723 = 1.0 / _1693;
    float _1725 = -_1675;
    float _1727 = fma(_1695, _1713, _1725);
    float _1729 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1717);
    float _1731 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1719);
    float _1733 = fma(_1705, _1721, 1.570728778839111328125);
    float _1735 = sqrt(_1703);
    float _1737 = _1709 * 0.693147182464599609375;
    float _1739 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1741 = _1729 * _1723;
    float _1743 = _1731 * _1723;
    float _1745 = fma(_1741, 0.5, 0.5);
    float _1747 = fma(_1743, -0.5, 0.5);
    float _1749 = fma(_1727, 0.5, 0.5);
    float _1751 = _1735 * 0.636619746685028076171875;
    float3 _4854 = float3(_1745, _1747, _1739);
    float _1753 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4854, float3(0.0), isnan(_4854)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4854, float3(0.0), isnan(_4854)), level(0.0)).x;
    float _1755 = -_1733;
    float _1757 = fma(_1751, _1755, 1.0);
    float3 _4870 = float3(_1745, _1747, _1739);
    float4 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4870, float3(0.0), isnan(_4870)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4870, float3(0.0), isnan(_4870)), level(0.0)).xyzw;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = _1760.w;
    float2 _4887 = float2(_1757, _1749);
    float3 _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4887, float2(0.0), isnan(_4887)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4887, float2(0.0), isnan(_4887)), level(0.0)).xyz;
    float _1774 = _1772.x;
    float _1776 = _1772.y;
    float _1778 = _1772.z;
    float _1780 = in.m_54.x;
    float _1782 = in.m_54.y;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1786 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1790 = _1788 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1792 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1794;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1800 = _1798 != 0;
    float _1802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1804 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1792);
    float _1806 = 1.0 / _1790;
    bool _1808 = _1780 > 0.5;
    bool _1810 = _1782 > 0.5;
    float _1812 = exp2(_1786);
    float _1814 = -_197;
    int _1816 = _1808 ? as_type<int>(_1814) : as_type<int>(_197);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1820 = _1818 != 0;
    bool _1822 = !_1800;
    float _1824 = _1822 ? _197 : as_type<float>(_1816);
    float _1826 = _1796 * _1806;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1830 = _991 + _1828;
    bool _1832 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1834 = isnan(_991);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = _1824 + 0.5;
    bool _1846 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1848 = isnan(_991);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = fma(_1826, _1830, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1860 = -_191;
    int _1862 = _1810 ? as_type<int>(_1860) : as_type<int>(_191);
    float _1864 = -_1842;
    float _1866 = _1864 + 1.0;
    float _1868 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1870 = -_1812;
    float _1872 = _1870 + 1.0;
    bool _1874 = !_1820;
    float _1876 = _1874 ? _191 : as_type<float>(_1862);
    float _1878 = _1856 * _1866;
    float _1880 = _1868 * _1784;
    float _1882 = -_1856;
    float _1884 = _1882 + 1.0;
    float _1886 = -_1876;
    float _1888 = _1886 + 0.5;
    float _1890 = _1858 * _1878;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1894 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1896 = fma(_1884, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1890);
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1900 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1904 = _1894 * _1802;
    float _1906 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1908 = _1902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1896);
    float _1912 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1804);
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1916 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_56.x = _1908;
    out.m_56.y = _1900;
    out.m_56.z = _1906;
    float _1918 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1912);
    float _1920 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1922 = _1439 > 0.0;
    bool _1924 = isnan(_1439);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.0);
    bool _1930 = _1926 || _1928;
    out.m_58.x = _1880;
    out.m_58.y = _1904;
    float _1932 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1934 = _1920 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1936 = _1918 + _1693;
    out.gl_Position.x = _1729;
    out.gl_Position.y = _1731;
    out.gl_Position.z = _1918;
    out.gl_Position.w = _1693;
    float _1938 = _1936 * 0.5;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1944 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1693 * 0.5;
    float _1948 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1729 + _1693;
    float _1954 = fma(_1731, -0.5, _1946);
    float _1956 = -_1916;
    float _1958 = _1956 + 1.0;
    out.m_45.x = _1934;
    float _1960 = _1952 * 0.5;
    out.m_60.x = _1944;
    out.m_60.y = _1948;
    out.m_60.z = _1950;
    out.m_60.w = _1932;
    out.m_62.x = _1960;
    out.m_62.y = _1954;
    out.m_62.z = _1938;
    out.m_62.w = _1693;
    float _1962 = _1916 * _1753;
    float _1964 = _1768 * _1962;
    float _1966 = _1768 * _1958;
    float _1968 = _1778 * _1962;
    float _1970 = fma(_1774, _1964, _1762);
    float _1972 = fma(_1776, _1964, _1764);
    float _1974 = fma(_1768, _1968, _1766);
    out.m_64.x = _1970;
    out.m_64.y = _1972;
    out.m_64.z = _1974;
    out.m_64.w = _1966;
    if (_1930)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1976 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1976;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

