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
    float4 m_58 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _941 = false;
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
        float _3002 = as_type<float>(_99);
        out.gl_Position.z = _3002;
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
        float _3071 = as_type<float>(_135);
        out.gl_Position.z = _3071;
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
    int _163 = as_type<int>(_137) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_137) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    float _177 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _159);
    float _179 = _159;
    float _181 = _139;
    if (!_155)
    {
        float _183 = _139 * _139;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    bool _189 = !_169;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _175);
    float _195 = _187;
    if (!_155)
    {
        float _197 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    bool _201 = !_155;
    float _203 = _199;
    float _205 = 0.0;
    if (!_201)
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
        _181 = _263;
    }
    float _265 = _181;
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
    float _387 = sqrt(_193);
    float _389 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _391 = fma(_379, _379, _381);
    float _393 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _397 = fma(_385, _385, _391);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _393);
    float _401 = sqrt(_177);
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
    float _841 = in.m_52.x;
    float _843 = in.m_52.y;
    bool _845 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _847 = isnan(_835);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _857;
    bool _861 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _863 = isnan(_835);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -_855;
    float _875 = _873 + 1.0;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _877;
    float _881 = 1.0 / _859;
    bool _883 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _885 = _871 * _875;
    float _887 = -_871;
    float _889 = _887 + 1.0;
    float _891 = _839 * _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _893;
    float _897 = fma(_879, _891, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _899 = fma(_895, _891, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _901 = _897 * _885;
    float _903 = _899 * _885;
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[143].x, _901);
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[143].y, _903);
    float _909 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[144].x, _905);
    float _911 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[144].y, _907);
    float _913 = _909 * _841;
    float _915 = _911 * _843;
    bool _917 = !_883;
    float _937;
    float _939;
    if (!_917)
    {
        float _919 = in.m_54.x;
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _923 = float(_83);
        float _925 = _919 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _929 = _927 * _921;
        float _931 = floor(_929);
        float _933 = -_931;
        float _935 = _929 + _933;
        _937 = _923;
        _939 = _935;
        _941 = true;
    }
    else
    {
        float _943 = float(_83);
        float _945 = 1.0 / _943;
        float _947 = _117 * _945;
        _937 = _943;
        _939 = _947;
    }
    _941 = false;
    float _949 = _937;
    float _951 = _939;
    float _953 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _955 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _957 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _959 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _961 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].y, _953);
    float _963 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].x, _955);
    float _965 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].z, _957);
    float _967 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].w, _959);
    float _969 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].y, _961);
    float _971 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].x, _963);
    float _973 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].z, _965);
    float _975 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].w, _967);
    float _977 = _969 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _979 = _971 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _981 = _915 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _983 = _975 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _985 = _387 * _977;
    float _987 = _973 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _989 = _401 * _979;
    float _991 = _985 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _993 = _433 * _987;
    float _995 = _985 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _997 = _985 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _999 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].x, _991);
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _995);
    float _1003 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _997);
    float _1005 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].z, _999);
    float _1007 = _799 * _799;
    float _1009 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    float _1011 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1003);
    float _1013 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1005);
    float _1015 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1009);
    float _1017 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1011);
    float _1019 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1021 = _1015 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1023 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _1019 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _1021 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1035 = _1023 + _1033;
    float _1037 = _1027 * _1027;
    float _1039 = fma(_1031, _1031, _1037);
    float _1041 = fma(_1035, _1035, _1039);
    float _1043 = fma(_801, _801, _1007);
    float _1045 = rsqrt(_1041);
    float _1047 = fma(_803, _803, _1043);
    float _1049 = rsqrt(_1047);
    float _1051 = _1027 * _1045;
    float _1053 = _1031 * _1045;
    float _1055 = _1035 * _1045;
    float _1057 = -_1051;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1061 = -_1053;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1031);
    float _1065 = -_1055;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1035);
    float _1069 = _1049 * _803;
    float _1071 = _1049 * _799;
    float _1073 = _1049 * _801;
    float _1075 = _1059 * _1059;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1079 = _1069 * _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1083 = _1071 * _1081;
    float _1085 = fma(_1063, _1063, _1075);
    float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1089 = -_1079;
    float _1091 = fma(_1073, _1087, _1089);
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1095 = -_1083;
    float _1097 = fma(_1069, _1093, _1095);
    float _1099 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1101 = _1073 * _1099;
    float _1103 = fma(_1067, _1067, _1085);
    float _1105 = _1091 * _1091;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1109 = -_1101;
    float _1111 = fma(_1071, _1107, _1109);
    float _1113 = sqrt(_1103);
    float _1115 = fma(_1097, _1097, _1105);
    float _1117 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1119 = fma(_1111, _1111, _1115);
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1123 = rsqrt(_1119);
    float _1125 = _1045 * _1113;
    float _1127 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1129 = _981 * _1125;
    float _1131 = _1117 * _1125;
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1135 = _1133 * 0.5;
    float _1137 = _1129 * _1121;
    float _1139 = _1131 * _1127;
    float _1141 = _1091 * _1123;
    float _1143 = _1111 * _1123;
    float _1145 = _1097 * _1123;
    float _1147 = _1137 * _1069;
    float _1149 = _1073 * _1141;
    float _1151 = _1071 * _1143;
    float _1153 = _1137 * _1073;
    float _1155 = fma(_1139, _1143, _1147);
    float _1157 = -_1149;
    float _1159 = fma(_1071, _1145, _1157);
    float _1161 = -_1151;
    float _1163 = fma(_1069, _1141, _1161);
    float _1165 = fma(_1139, _1145, _1153);
    float _1167 = _1069 * _1145;
    float _1169 = fma(_1135, _1159, _1155);
    float _1171 = -_1053;
    float _1173 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1175 = fma(_1135, _1163, _1165);
    float _1177 = _1137 * _1071;
    float _1179 = _1023 + _1169;
    float _1181 = -_1167;
    float _1183 = fma(_1073, _1143, _1181);
    float _1185 = _1021 + _1175;
    float _1187 = -_1051;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1193 = _1179 + _1191;
    float _1195 = fma(_1139, _1141, _1177);
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1199 = _1185 + _1197;
    float _1201 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1203 = _1193 * _1193;
    float _1205 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1207 = fma(_1135, _1183, _1195);
    float _1209 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1201);
    float _1211 = fma(_1199, _1199, _1203);
    float _1213 = -_1055;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1217 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1205);
    float _1219 = sqrt(_1211);
    float _1221 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1209);
    float _1223 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1217);
    float _1225 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1227 = _1019 + _1207;
    float _1229 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1231 = 1.0 / _1225;
    float _1233 = _1229 + _1225;
    bool _1235 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1239 = _1237 != 0;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1247 = _1245 != 0;
    bool _1249 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1251 = isnan(0.5);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1257 = _1253 || _1255;
    bool _1259 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1267 = _1263 || _1265;
    bool _1269 = !_1243;
    int _1271 = _1269 ? 0 : 1;
    bool _1273 = !_1239;
    int _1275 = _1273 ? 0 : 1;
    bool _1277 = !_1247;
    int _1279 = _1277 ? 0 : 1;
    float _1281 = _1207;
    float _1283 = _1183;
    float _1285 = _1069;
    float _1287 = _1199;
    float _1289 = _1055;
    float _1291 = _1023;
    float _1293 = _1233;
    float _1295 = _1215;
    if (!_1235)
    {
        _1281 = _1185;
    }
    float _1297 = _1281;
    float _1299 = _1297;
    if (!_1235)
    {
        _1283 = _1179;
    }
    float _1301 = _1283;
    float _1303 = _1301;
    if (!_1235)
    {
        _1285 = _1227;
    }
    float _1305 = _1285;
    bool _1307 = !_1235;
    float _1309 = _1305;
    if (!_1307)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1315 = _1219 + _1313;
        float _1317 = rsqrt(_1211);
        float _1319 = _1315 * _1311;
        float _1321 = _1227 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = _1319 * 0.15915493667125701904296875;
        float _1325 = _1323 * 6.283185482025146484375;
        float _1327 = cos(_1325);
        float _1329 = _1323 * 6.283185482025146484375;
        float _1331 = sin(_1329);
        float _1333 = _1327 + (-1.0);
        float _1335 = fma(_1331, _1321, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1337 = _1333 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = _1317 * _1335;
        float _1341 = fma(_1227, _1327, _1337);
        float _1343 = fma(_1199, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1345 = fma(_1193, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1299 = _1343;
        _1309 = _1341;
        _1303 = _1345;
    }
    float _1347 = _1299;
    float _1349 = _1309;
    float _1351 = _1303;
    float _1353 = -_1053;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1347);
    float _1357 = -_1051;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1361 = -_1055;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1351);
    float _1365 = _1233 * _1231;
    float _1367 = _1365 * 0.5;
    float _1369 = _1355;
    float _1371 = _1359;
    float _1373 = _1351;
    if (_1267)
    {
        _1287 = 1.0;
    }
    float _1375 = _1287;
    float _1377 = _1375;
    if (_1257)
    {
        _1289 = _1355;
    }
    float _1379 = _1289;
    float _1381 = _1379;
    if (_1257)
    {
        _1369 = _1359;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (_1257)
    {
        _1371 = _1363;
    }
    float _1387 = _1371;
    float _1389 = _1387;
    if (!_1257)
    {
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1393 = _1189 + _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1397 = _1173 + _1395;
        float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1401 = -_1023;
        float _1403 = _1401 + _1351;
        float _1405 = _1393 * _1393;
        float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1409 = _1215 + _1407;
        float _1411 = -_1021;
        float _1413 = _1411 + _1347;
        float _1415 = fma(_1397, _1397, _1405);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1419 = fma(_1409, _1409, _1415);
        float _1421 = sqrt(_1419);
        float _1423 = 1.0 / _1125;
        float _1425 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1427 = precise::min(_1421, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1429 = _1427 * _1399;
        float _1431 = _1429 * _1423;
        float _1433 = -_1019;
        float _1435 = _1433 + _1349;
        float _1437 = _1425 * _1431;
        float _1439 = _1403 * _1431;
        float _1441 = fma(_1435, _1437, _1189);
        float _1443 = fma(_1413, _1437, _1173);
        float _1445 = fma(_1425, _1439, _1215);
        _1385 = _1441;
        _1381 = _1443;
        _1389 = _1445;
        _1373 = _1437;
        _1291 = _1439;
        _1293 = _1423;
    }
    float _1447 = _1385;
    float _1449 = _1381;
    float _1451 = _1389;
    float _1453 = _1373;
    float _1455 = _1291;
    float _1457 = _1293;
    float _1459 = _1453;
    float _1461 = _1455;
    float _1463 = _1457;
    if (!_1267)
    {
        float _1465 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1467 = _1465 * 0.15915493667125701904296875;
        float _1469 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1473 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1471);
        float _1475 = _1467 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        float _1479 = _1469 * 0.15915493667125701904296875;
        float _1481 = _1467 * 6.283185482025146484375;
        float _1483 = sin(_1481);
        float _1485 = 1.0 / _1477;
        float _1487 = _1479 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = _1483 * _1485;
        float _1493 = _1479 * 6.283185482025146484375;
        float _1495 = sin(_1493);
        float _1497 = _1489 * _1491;
        float _1499 = 1.0 / _1473;
        float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1503 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1501;
        float _1505 = 1.0 / _1497;
        float _1507 = 1.0 / _1503;
        float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1511 = _1499 * _1509;
        float _1513 = _1495 * _1505;
        float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1517 = fma(_1513, _1511, _1515);
        float _1519 = _1517 * _1507;
        float _1521 = precise::clamp(_1519, 0.0, 1.0);
        _1295 = _1507;
        _1459 = _1479;
        _1461 = _1499;
        _1377 = _1521;
    }
    float _1523 = _1295;
    float _1525 = _1459;
    float _1527 = _1461;
    float _1529 = _1377;
    float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1533 = _1447 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1537 = _1449 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1541 = _1451 + _1539;
    float _1543 = _1533 * _1533;
    float _1545 = fma(_1537, _1537, _1543);
    float _1547 = fma(_1541, _1541, _1545);
    float _1549 = rsqrt(_1547);
    float _1551 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1553 = _1537 * _1551;
    float _1555 = _1541 * _1551;
    float _1557 = _1553 * _1553;
    float _1559 = _1555 * _1555;
    float _1561 = _1557 + _1559;
    float _1563 = sqrt(_1561);
    bool _1565 = _1563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1569 = _1563 + _1567;
    float _1571 = _1523;
    float _1573 = _1569;
    float _1575 = _1525;
    float _1577 = _1533;
    float _1579 = _1553;
    if (_1565)
    {
        float _1581 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1581;
    }
    float _1583 = _1571;
    float _1585 = _1583;
    if (_1565)
    {
        float _1587 = _1569 * _1583;
        _1573 = _1587;
    }
    float _1589 = _1573;
    if (_1565)
    {
        float _1591 = rsqrt(_1561);
        _1585 = _1591;
    }
    float _1593 = _1585;
    float _1595 = _1593;
    if (_1565)
    {
        float _1597 = _1589 * 0.15915493667125701904296875;
        _1575 = _1597;
    }
    float _1599 = _1575;
    float _1601 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1603 = _1541;
    if (_1565)
    {
        float _1605 = _1599 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        _1603 = _1607;
    }
    float _1609 = _1603;
    float _1611 = precise::max(0.0, _1601);
    float _1613 = _1527;
    float _1615 = _1611;
    if (_1565)
    {
        float _1617 = _1599 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        _1613 = _1619;
    }
    float _1621 = _1613;
    float _1623 = -_1551;
    float _1625 = -_1611;
    float _1627 = fma(_1533, _1623, _1625);
    if (_1565)
    {
        float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1577 = _1629;
    }
    float _1631 = _1577;
    float _1633 = sqrt(_1547);
    float _1635 = _1609;
    float _1637 = _1631;
    if (_1565)
    {
        float _1639 = fma(_1609, _1631, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1635 = _1639;
    }
    float _1641 = _1635;
    float _1643 = _1641;
    if (!_1565)
    {
        _1637 = _1557;
    }
    float _1645 = _1637;
    float _1647 = _1645;
    if (_1565)
    {
        float _1649 = _1593 * _1641;
        _1463 = _1649;
    }
    float _1651 = _1463;
    if (!_1565)
    {
        _1643 = _1627;
    }
    float _1653 = _1643;
    float _1655 = _1653;
    float _1657 = _1621;
    if (_1565)
    {
        float _1659 = _1621 + (-1.0);
        _1615 = _1659;
    }
    float _1661 = _1615;
    float _1663 = _1661;
    if (_1565)
    {
        float _1665 = _1553 * _1651;
        _1579 = _1665;
    }
    float _1667 = _1579;
    if (_1565)
    {
        float _1669 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1669;
    }
    float _1671 = _1595;
    if (!_1565)
    {
        _1663 = _1555;
    }
    float _1673 = _1663;
    float _1675 = _1673;
    if (_1565)
    {
        float _1677 = _1555 * _1651;
        _1675 = _1677;
    }
    float _1679 = _1675;
    if (_1565)
    {
        float _1681 = _1667 * _1667;
        _1647 = _1681;
    }
    float _1683 = _1647;
    if (_1565)
    {
        float _1685 = fma(_1627, _1621, _1671);
        _1655 = _1685;
    }
    float _1687 = _1655;
    if (!_1565)
    {
        _1657 = _1559;
    }
    float _1689 = _1657;
    float _1691 = _1689;
    if (_1565)
    {
        float _1693 = _1679 * _1679;
        _1691 = _1693;
    }
    float _1695 = _1691;
    float _1697 = fma(_1687, _1687, _1683);
    float _1699 = _1697 + _1695;
    float _1701 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1705 = fma(_1633, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1703);
    float _1707 = precise::clamp(_1705, 0.0, 1.0);
    float _1709 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1711 = rsqrt(_1699);
    float _1713 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1701);
    float _1715 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1717 = -_1707;
    float _1719 = _1717 + 1.0;
    float _1721 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1709);
    float _1723 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1713);
    float _1725 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1727 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1729 = abs(_1719);
    float _1731 = log2(_1729);
    float _1733 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1721);
    float _1735 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1725);
    float _1737 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1727);
    float _1739 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1741 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1743 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1735);
    float _1745 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1737);
    float _1747 = _1711 * _1667;
    float _1749 = _1711 * _1687;
    float _1751 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1753 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1755 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1757 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1759 = _1711 * _1679;
    float _1761 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1763 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1755);
    float _1765 = -_1757;
    float _1767 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1765);
    float _1769 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1771 = -_1761;
    float _1773 = fma(_1771, _1715, 1.0);
    float _1775 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1763);
    float _1777 = -_1759;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1767);
    float _1781 = exp2(_1769);
    float _1783 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1785 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1775);
    float _1787 = fma(_1779, -0.5, 0.5);
    float _1789 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1791 = fma(_1779, 0.5, 0.5);
    float _1793 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1783);
    float _1795 = _1749 + 1.0;
    float _1797 = log2(_1773);
    float _1799 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1789);
    float _1801 = fma(_1791, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1803 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1793);
    float _1805 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1799);
    float _1807 = 1.0 / _1785;
    float _1809 = -_1749;
    float _1811 = fma(_1781, _1795, _1809);
    float _1813 = fma(_1791, _1801, -0.212114393711090087890625);
    float _1815 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1803);
    float _1817 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1805);
    float _1819 = fma(_1791, _1813, 1.570728778839111328125);
    float _1821 = sqrt(_1787);
    float _1823 = _1797 * 0.693147182464599609375;
    float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1827 = _1815 * _1807;
    float _1829 = _1817 * _1807;
    float _1831 = fma(_1827, 0.5, 0.5);
    float _1833 = fma(_1829, -0.5, 0.5);
    float _1835 = _1821 * 0.636619746685028076171875;
    float _1837 = fma(_1811, 0.5, 0.5);
    float _1839 = -_1819;
    float _1841 = fma(_1835, _1839, 1.0);
    float3 _5951 = float3(_1831, _1833, _1825);
    float _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5951, float3(0.0), isnan(_5951)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5951, float3(0.0), isnan(_5951)), level(0.0)).x;
    float3 _5962 = float3(_1831, _1833, _1825);
    float4 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5962, float3(0.0), isnan(_5962)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5962, float3(0.0), isnan(_5962)), level(0.0)).xyzw;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = _1846.w;
    float2 _5979 = float2(_1841, _1837);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5979, float2(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5979, float2(0.0), isnan(_5979)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1868 = int(_1866);
    int _1870 = abs(_1275);
    float _1872 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1874 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1876 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1878 = int(_1876);
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1882 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1874);
    float _1884 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1882);
    float _1886 = float(_1868);
    float _1888 = 1.0 / _949;
    float _1890 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1884);
    float _1892 = float(uint(_1878));
    float _1894 = 1.0 / _1886;
    int _1896 = ~_1878;
    int _1898 = _1896 + 1;
    float _1900 = 1.0 / _1892;
    float _1902 = _117 * _1894;
    float _1904 = exp2(_1872);
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1908 = _1906 != 0;
    int _1910 = as_type<int>(_1900) + (-2);
    float _1912 = trunc(_1902);
    int _1914 = int(_1912);
    int _1916 = ~_1878;
    int _1918 = _1916 + 1;
    float _1920 = -_1904;
    float _1922 = _1920 + 1.0;
    float _1924 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1926 = float(uint(_1914));
    float _1928 = as_type<float>(_1910) * _1926;
    float _1930 = trunc(_1928);
    float _1932 = precise::max(_1930, 0.0);
    uint _1935 = uint(_1932);
    float _1937 = in.m_54.x;
    float _1939 = in.m_54.y;
    float _1941 = in.m_54.z;
    float _1943 = in.m_54.w;
    bool _1945 = !_1908;
    float _1947 = _1945 ? 7.345489978790283203125 : 1.0;
    int _1949 = _1898 * int(_1935);
    int _1951 = _1949 + _1914;
    float _1953 = float(uint(_1951));
    float _1955 = _1947 * _1937;
    float _1957 = as_type<float>(_1910) * _1953;
    float _1959 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1961 = floor(_1955);
    float _1963 = trunc(_1957);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    float _1969 = -_1961;
    float _1971 = _1955 + _1969;
    int _1973 = int(_1935) + int(_1967);
    float _1975 = float(_1878);
    float _1977 = float(_1914);
    int _1979 = _1918 * _1973;
    int _1981 = _1979 + _1914;
    bool _1983 = _1977 >= _1975;
    bool _1985 = isnan(_1977);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(_1975);
    bool _1991 = _1987 || _1989;
    float _1993 = float(_1991);
    bool _1995 = uint(_1981) >= uint(_1878);
    float _1997 = trunc(_1993);
    int _1999 = int(_1997);
    bool _2001 = !_1995;
    int _2003 = _2001 ? 0 : (-1);
    bool _2005 = _1878 == 0;
    int _2007 = ~_1973;
    int _2009 = _2007 + _2003;
    int _2011 = _2009 + 1;
    float _2013 = _1971 * _1975;
    float _2015 = _117 * _1975;
    int _2017 = _1878 * _2011;
    int _2019 = _2017 + _1914;
    float _2021 = _2015 * _1888;
    float _2023 = trunc(_2013);
    int _2025 = int(_2023);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2029 = _2027 != 0;
    bool _2031 = !_2005;
    int _2033 = _2031 ? _2019 : (-1);
    int _2035 = ~_1999;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = _1878 + (-1);
    float _2043 = trunc(_2021);
    int _2045 = int(_2043);
    bool _2047 = !_2029;
    int _2049 = _2047 ? 0 : 1;
    int _2051 = _2033 * _2039;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2055 = _2053 != 0;
    int _2057 = abs(_1271);
    int _2059 = _1999 * _2041;
    int _2061 = _2059 + _2051;
    int _2063 = abs(_2049);
    bool _2065 = !_2055;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = _2061 * _2057;
    int _2071 = abs(_1279);
    int _2073 = _2025 * _2063;
    int _2075 = _2073 + _1914;
    int _2077 = abs(_2067);
    int _2079 = _2045 * _1870;
    int _2081 = _2079 + _2069;
    int _2083 = ~_1878;
    int _2085 = _2083 + 1;
    int _2087 = _2075 * _2071;
    int _2089 = _2087 + _2081;
    int _2091 = ~_1878;
    int _2093 = _2091 + 1;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2097 = _2095 != 0;
    int _2099 = _2025 * _2077;
    int _2101 = _2099 + _2089;
    float _2103 = float(uint(_2101));
    float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2107 = _2105 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2111 = _2109 != 0;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2115 = as_type<float>(_1910) * _2103;
    float _2117 = 1.0 / _2107;
    float _2119 = trunc(_2115);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    int _2125 = _2085 * int(_2123);
    int _2127 = _2125 + _2101;
    float _2129 = float(uint(_2127));
    float _2131 = as_type<float>(_1910) * _2129;
    float _2133 = trunc(_2131);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    int _2139 = int(_2123) + int(_2137);
    int _2141 = _2093 * _2139;
    int _2143 = _2141 + _2101;
    bool _2145 = uint(_2143) >= uint(_1878);
    bool _2147 = !_2145;
    int _2149 = _2147 ? 0 : (-1);
    bool _2151 = _1943 > 0.5;
    int _2153 = ~_2139;
    int _2155 = _2153 + _2149;
    int _2157 = _2155 + 1;
    int _2159 = _1878 * _2157;
    int _2161 = _2159 + _2101;
    float _2163 = float(uint(_2075));
    bool _2165 = !_2005;
    int _2167 = _2165 ? _2161 : (-1);
    float _2169 = as_type<float>(_1910) * _2163;
    float _2171 = -_191;
    int _2173 = _2151 ? as_type<int>(_2171) : as_type<int>(_191);
    int _2175 = _2167 >> 31;
    int _2177 = ~_1878;
    int _2179 = _2177 + 1;
    float _2181 = trunc(_2169);
    float _2183 = precise::max(_2181, 0.0);
    uint _2185 = uint(_2183);
    int _2187 = _2175 & 3;
    int _2189 = _2167 & 3;
    bool _2191 = _2189 != 0;
    int _2193 = _2167 + _2187;
    float _2195 = _1924 * _1843;
    bool _2197 = !_2097;
    float _2199 = _2197 ? _191 : as_type<float>(_2173);
    int _2201 = _2193 >> 2;
    float _2203 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2205 = _2167 & 3;
    bool _2207 = _2205 != 0;
    float _2209 = _1864 * _2195;
    int _2211 = _2201 << 4;
    int _2213 = _2211 + 368;
    float _2215 = -_2113;
    float _2217 = fma(_2203, 2.0, _2215);
    bool _2219 = !_2207;
    int _2221 = _2219 ? 0 : 1;
    int _2223 = _2179 * int(_2185);
    int _2225 = _2223 + _2075;
    uint _2227 = uint(int(uint(_2213) >> uint(2)));
    uint _2229 = uint(int(uint(int(_2227)) >> uint(2)));
    int _2231 = int(_2227) & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    int _2235 = int(_2227) + 1;
    uint _2237 = uint(int(uint(_2235) >> uint(2)));
    int _2239 = _2235 & 3;
    float _2241 = (*spvDescriptorSet0.vp_c9)._m0[int(_2237)][_2239];
    bool _2243 = uint(_2205) > 1u;
    float _2245 = -_117;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2217);
    int _2249 = _2191 ? 0 : 1;
    float _2251 = float(uint(_2225));
    int _2253 = ~_2249;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    float _2259 = as_type<float>(_1910) * _2251;
    int _2261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2263 = _2261 != 0;
    int _2265 = _2213 + 8;
    uint _2267 = uint(int(uint(_2265) >> uint(2)));
    uint _2269 = uint(int(uint(int(_2267)) >> uint(2)));
    int _2271 = int(_2267) & 3;
    float _2273 = (*spvDescriptorSet0.vp_c9)._m0[int(_2269)][_2271];
    int _2275 = int(_2267) + 1;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    int _2279 = _2275 & 3;
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[int(_2277)][_2279];
    int _2283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2285 = _2283 != 0;
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _2291 = _2257;
    float _2293 = as_type<float>(_1878);
    float _2295 = as_type<float>(_2075);
    if (!_2243)
    {
        int _2297 = ~_2249;
        int _2299 = _2297 + 1;
        _2291 = _2299;
    }
    int _2301 = _2291;
    float _2303 = trunc(_2259);
    float _2305 = precise::max(_2303, 0.0);
    uint _2307 = uint(_2305);
    bool _2309 = uint(_2205) >= 2u;
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2313 = _2311 != 0;
    int _2315 = _2309 ? 0 : 1;
    float _2317 = 1.0 / _2289;
    bool _2319 = _2205 != 3;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2323 = ~_2315;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2331 = _2321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2335 = abs(_2221);
    float _2337 = _2329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2339 = fma(_1959, -2.0, _1880);
    float _2341 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2343;
    int _2347 = abs(_2301);
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2351 = _2349 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _2353 = _2327;
    float _2355 = as_type<float>(_2335);
    if (_2319)
    {
        int _2357 = ~_2315;
        int _2359 = _2357 + 1;
        _2353 = _2359;
    }
    int _2361 = _2353;
    out.m_56.x = _2341;
    out.m_56.y = _2331;
    out.m_56.z = _2337;
    bool _2363 = _1939 > 0.5;
    float _2365 = _2345 * _2117;
    int _2367 = ~_2347;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    float _2373 = _2351 * _2317;
    int _2375 = abs(_2361);
    float _2377 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2339);
    int _2379 = int(_2185) + int(_2307);
    int _2381 = _2371 * as_type<int>(_2241);
    float _2383 = as_type<float>(_2371);
    if (!_1908)
    {
        _2383 = _1941;
    }
    float _2385 = _2383;
    float _2387 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2389 = -_191;
    int _2391 = _2363 ? as_type<int>(_2389) : as_type<int>(_191);
    int _2393 = ~_2335;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    bool _2399 = !_2285;
    float _2401 = _2399 ? _191 : as_type<float>(_2391);
    int _2403 = _2397 * as_type<int>(_2233);
    int _2405 = _2403 + _2381;
    int _2407 = ~_1878;
    int _2409 = _2407 + 1;
    int _2411 = ~_2375;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    bool _2417 = _2205 != 3;
    int _2419 = _2409 * _2379;
    int _2421 = _2419 + _2075;
    bool _2423 = !_2111;
    int _2425 = _2423 ? 0 : 1;
    int _2427 = _2415 * as_type<int>(_2273);
    int _2429 = _2427 + _2405;
    bool _2431 = !_2417;
    int _2433 = _2431 ? 0 : (-1);
    float _2435 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2437 = int(_2435);
    bool _2439 = _1937 > 0.5;
    int _2441 = abs(_2433);
    float _2443 = -_173;
    int _2445 = _2439 ? as_type<int>(_2443) : as_type<int>(_173);
    bool _2447 = _1941 > 0.5;
    bool _2449 = uint(_2421) >= uint(_1878);
    int _2451 = ~_2441;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    float _2457 = -_173;
    int _2459 = _2447 ? as_type<int>(_2457) : as_type<int>(_173);
    int _2461 = abs(_2425);
    int _2463 = _2455 * as_type<int>(_2281);
    int _2465 = _2463 + _2429;
    bool _2467 = !_2449;
    int _2469 = _2467 ? 0 : (-1);
    bool _2471 = !_2263;
    float _2473 = _2471 ? _173 : as_type<float>(_2445);
    bool _2475 = !_2313;
    float _2477 = _2475 ? _173 : as_type<float>(_2459);
    float _2479 = float(uint(_2437));
    int _2481 = ~_2379;
    int _2483 = _2481 + _2469;
    int _2485 = _2483 + 1;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2489 = ~_2461;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    float _2495 = 1.0 / _2479;
    int _2497 = _1878 * _2485;
    int _2499 = _2497 + _2075;
    float _2501 = as_type<float>(_2429);
    float _2503 = _2385;
    if (!_1908)
    {
        _2293 = _1939;
    }
    float _2505 = _2293;
    int _2507 = _2465 * _2493;
    float _2509 = _2505;
    if (!_1908)
    {
        _2355 = _1939;
    }
    float _2511 = _2355;
    float _2513 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2487);
    float _2515 = _2511;
    if (_1908)
    {
        _2509 = _1937;
    }
    float _2517 = _2509;
    float _2519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2521 = _951 + _2519;
    if (_1908)
    {
        _2515 = _1937;
    }
    float _2523 = _2515;
    if (!_1908)
    {
        _2501 = _1937;
    }
    float _2525 = _2501;
    int _2527 = abs(_2437);
    bool _2529 = !_2005;
    int _2531 = _2529 ? _2499 : (-1);
    float _2533 = fma(_2365, _2521, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2535 = float(uint(_2527));
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2539 = _951 + _2537;
    float _2541 = _2525;
    if (!_1908)
    {
        _2295 = _1941;
    }
    float _2543 = _2295;
    int _2545 = _2531 * _2461;
    int _2547 = _2545 + _2507;
    float _2549 = _2543;
    if (_1908)
    {
        _2541 = _1941;
    }
    float _2551 = _2541;
    float _2553 = 1.0 / _2535;
    float _2555 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2387);
    if (_1908)
    {
        _2549 = _1939;
    }
    float _2557 = _2549;
    float _2559 = fma(_2373, _2539, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_1908)
    {
        _2503 = _1939;
    }
    float _2561 = _2503;
    float _2563 = _2557 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2565 = as_type<int>(_2495) + (-2);
    float _2567 = float(uint(_2547));
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _2571 = abs(_2547);
    float _2573 = as_type<float>(_2565) * _2567;
    float _2575 = fma(_2551, (*spvDescriptorSet0.vp_c9)._m0[84].z, _2569);
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2579 = as_type<int>(_2553) + (-2);
    float _2581 = trunc(_2573);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    float _2587 = float(uint(_2571));
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2591 = fma(_2561, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2577);
    bool _2593 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2595 = isnan(_951);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2601 = _2597 || _2599;
    float _2603 = float(_2601);
    float _2605 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[84].x, _2575);
    float _2607 = as_type<float>(_2579) * _2587;
    float _2609 = fma(_2523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2589);
    bool _2611 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2613 = isnan(_951);
    bool _2615 = _2611 || _2613;
    bool _2617 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2619 = _2615 || _2617;
    float _2621 = float(_2619);
    float _2623 = -_2603;
    float _2625 = _2623 + 1.0;
    bool _2627 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2629 = isnan(_951);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = _2605 * (-0.15915493667125701904296875);
    float _2641 = trunc(_2607);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    int _2647 = ~_2437;
    int _2649 = _2647 + 1;
    int _2651 = ~_2527;
    int _2653 = _2651 + 1;
    float _2655 = -_2637;
    float _2657 = _2655 + 1.0;
    float _2659 = _2637 * _2625;
    int _2661 = _2649 * int(_2585);
    int _2663 = _2661 + _2547;
    float _2665 = _2621 * _2657;
    float _2667 = _2639 * 6.283185482025146484375;
    float _2669 = sin(_2667);
    float _2671 = -_2621;
    float _2673 = _2671 + 1.0;
    float _2675 = float(uint(_2663));
    int _2677 = _2653 * int(_2645);
    int _2679 = _2677 + _2571;
    float _2681 = as_type<float>(_2565) * _2675;
    float _2683 = _2533 * _2665;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2687 = float(uint(_2679));
    float _2689 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2693 = trunc(_2681);
    float _2695 = precise::max(_2693, 0.0);
    uint _2697 = uint(_2695);
    float _2699 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2513);
    float _2701 = as_type<float>(_2579) * _2687;
    float _2703 = -_2685;
    float _2705 = fma(_2689, 2.0, _2703);
    float _2707 = fma(_2563, -2.0, _2691);
    float _2709 = fma(_2673, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2683);
    float _2711 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2555);
    int _2713 = ~_2437;
    int _2715 = _2713 + 1;
    float _2717 = _2639 * 6.283185482025146484375;
    float _2719 = cos(_2717);
    float _2721 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2609);
    float _2723 = fma(_2559, _2659, _2709);
    float _2725 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2591);
    float _2727 = -_117;
    float _2729 = fma(_2727, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2705);
    float _2731 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2707);
    float _2733 = _2199 * _2669;
    float _2735 = trunc(_2701);
    float _2737 = precise::max(_2735, 0.0);
    uint _2739 = uint(_2737);
    int _2741 = int(_2585) + int(_2697);
    float _2743 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2723);
    float _2745 = -_2721;
    float _2747 = _2745 + 1.0;
    float _2749 = -_2725;
    float _2751 = _2749 + 1.0;
    float _2753 = -_2699;
    float _2755 = _2753 + 1.0;
    int _2757 = _2715 * _2741;
    int _2759 = _2757 + _2547;
    float _2761 = _2199 * _2719;
    int _2763 = ~_2527;
    int _2765 = _2763 + 1;
    float _2767 = -_2733;
    float _2769 = fma(_2477, _2719, _2767);
    bool _2771 = uint(_2759) >= uint(_2437);
    float _2773 = fma(_2477, _2669, _2761);
    float _2775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2777 = int(_2645) + int(_2739);
    int _2779 = _2765 * _2777;
    int _2781 = _2779 + _2571;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2785 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2791 = uint(_2781) >= uint(_2527);
    float _2793 = _2785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2795 = _2743 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2797 = !_2771;
    int _2799 = _2797 ? 0 : (-1);
    float _2801 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2803 = _2547 ^ _2437;
    float _2805 = _2787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2807 = ~_2741;
    int _2809 = _2807 + _2799;
    int _2811 = _2809 + 1;
    float _2813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2815 = !_2791;
    int _2817 = _2815 ? 0 : (-1);
    uint _2819 = uint(int(uint(_2803) >> uint(31)));
    out.m_58.x = _2793;
    out.m_58.y = _2801;
    out.m_58.z = _2805;
    out.m_58.w = _2795;
    int _2821 = ~_2817;
    int _2823 = _2777 + _2821;
    int _2825 = _2823 + 1;
    int _2827 = ~int(_2819);
    int _2829 = _2827 + 1;
    float _2831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2833 = _2437 == 0;
    float _2835 = _2789 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2837 = _2825 ^ _2829;
    bool _2839 = _2437 == 0;
    int _2841 = _2437 * _2811;
    int _2843 = _2841 + _2547;
    float _2845 = _2775 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2847 = ~_2829;
    int _2849 = _2847 + _2837;
    int _2851 = _2849 + 1;
    float _2853 = _2769 + 0.5;
    float _2855 = _2813 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2857 = _2773 + (-0.5);
    float _2859 = fma(_2845, _2853, _2729);
    bool _2861 = !_2839;
    int _2863 = _2861 ? _2851 : (-1);
    float _2865 = -_2855;
    float _2867 = -_2731;
    float _2869 = fma(_2865, _2857, _2867);
    bool _2871 = !_2833;
    int _2873 = _2871 ? _2843 : (-1);
    float _2875 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2877 = float(_2863);
    float _2879 = _2401 + (-0.5);
    float _2881 = float(_2873);
    float _2883 = -_2711;
    float _2885 = _2883 + 1.0;
    bool _2887 = _1529 > 0.0;
    bool _2889 = isnan(_1529);
    bool _2891 = _2887 || _2889;
    bool _2893 = isnan(0.0);
    bool _2895 = _2891 || _2893;
    float _2897 = -_2377;
    float _2899 = fma(_2875, _2877, _2897);
    float _2901 = _2473 + 0.5;
    float _2903 = fma(_2835, _2881, _2247);
    float _2905 = -_2747;
    float _2907 = fma(_2769, _2905, _2859);
    float _2909 = -_2875;
    float _2911 = fma(_2909, _2879, _2899);
    float _2913 = fma(_2773, _2751, _2869);
    float _2915 = fma(_2835, _2901, _2903);
    float _2917 = fma(_2401, _2885, _2911);
    float _2919 = _1854 * _2195;
    float _2921 = _1890 + _1785;
    float _2923 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2925 = -_1924;
    float _2927 = _2925 + 1.0;
    float _2929 = -_2755;
    float _2931 = fma(_2473, _2929, _2915);
    out.gl_Position.x = _1815;
    out.gl_Position.y = _1817;
    out.gl_Position.z = _1890;
    out.gl_Position.w = _1785;
    float _2933 = fma(_1860, _2919, _1848);
    float _2935 = fma(_1862, _2919, _1850);
    float _2937 = _2921 * 0.5;
    float _2939 = _2923 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2941 = _1854 * _2927;
    float _2943 = fma(_1854, _2209, _1852);
    out.m_60.x = _2931;
    out.m_60.y = _2917;
    out.m_60.z = _2907;
    out.m_60.w = _2913;
    out.m_62.z = _2937;
    out.m_62.w = _1785;
    out.m_45.x = _2939;
    out.m_64.x = _2933;
    out.m_64.y = _2935;
    out.m_64.z = _2943;
    out.m_64.w = _2941;
    if (_2895)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2945 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2945;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _941 = false;
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
        float _3002 = as_type<float>(_99);
        out.gl_Position.z = _3002;
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
        float _3071 = as_type<float>(_135);
        out.gl_Position.z = _3071;
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
    int _163 = as_type<int>(_137) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_137) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    float _177 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _159);
    float _179 = _159;
    float _181 = _139;
    if (!_155)
    {
        float _183 = _139 * _139;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    bool _189 = !_169;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _175);
    float _195 = _187;
    if (!_155)
    {
        float _197 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    bool _201 = !_155;
    float _203 = _199;
    float _205 = 0.0;
    if (!_201)
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
        _181 = _263;
    }
    float _265 = _181;
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
    float _387 = sqrt(_193);
    float _389 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _391 = fma(_379, _379, _381);
    float _393 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _397 = fma(_385, _385, _391);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _393);
    float _401 = sqrt(_177);
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
    float _841 = in.m_52.x;
    float _843 = in.m_52.y;
    bool _845 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _847 = isnan(_835);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _857;
    bool _861 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _863 = isnan(_835);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -_855;
    float _875 = _873 + 1.0;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _877;
    float _881 = 1.0 / _859;
    bool _883 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _885 = _871 * _875;
    float _887 = -_871;
    float _889 = _887 + 1.0;
    float _891 = _839 * _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _893;
    float _897 = fma(_879, _891, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _899 = fma(_895, _891, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _901 = _897 * _885;
    float _903 = _899 * _885;
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[143].x, _901);
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[143].y, _903);
    float _909 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[144].x, _905);
    float _911 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[144].y, _907);
    float _913 = _909 * _841;
    float _915 = _911 * _843;
    bool _917 = !_883;
    float _937;
    float _939;
    if (!_917)
    {
        float _919 = in.m_54.x;
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _923 = float(_83);
        float _925 = _919 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _929 = _927 * _921;
        float _931 = floor(_929);
        float _933 = -_931;
        float _935 = _929 + _933;
        _937 = _923;
        _939 = _935;
        _941 = true;
    }
    else
    {
        float _943 = float(_83);
        float _945 = 1.0 / _943;
        float _947 = _117 * _945;
        _937 = _943;
        _939 = _947;
    }
    _941 = false;
    float _949 = _937;
    float _951 = _939;
    float _953 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _955 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _957 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _959 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _961 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].y, _953);
    float _963 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].x, _955);
    float _965 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].z, _957);
    float _967 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].w, _959);
    float _969 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].y, _961);
    float _971 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].x, _963);
    float _973 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].z, _965);
    float _975 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].w, _967);
    float _977 = _969 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _979 = _971 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _981 = _915 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _983 = _975 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _985 = _387 * _977;
    float _987 = _973 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _989 = _401 * _979;
    float _991 = _985 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _993 = _433 * _987;
    float _995 = _985 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _997 = _985 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _999 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].x, _991);
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _995);
    float _1003 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _997);
    float _1005 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].z, _999);
    float _1007 = _799 * _799;
    float _1009 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    float _1011 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1003);
    float _1013 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1005);
    float _1015 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1009);
    float _1017 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1011);
    float _1019 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1021 = _1015 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1023 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _1019 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _1021 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1035 = _1023 + _1033;
    float _1037 = _1027 * _1027;
    float _1039 = fma(_1031, _1031, _1037);
    float _1041 = fma(_1035, _1035, _1039);
    float _1043 = fma(_801, _801, _1007);
    float _1045 = rsqrt(_1041);
    float _1047 = fma(_803, _803, _1043);
    float _1049 = rsqrt(_1047);
    float _1051 = _1027 * _1045;
    float _1053 = _1031 * _1045;
    float _1055 = _1035 * _1045;
    float _1057 = -_1051;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1061 = -_1053;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1031);
    float _1065 = -_1055;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1035);
    float _1069 = _1049 * _803;
    float _1071 = _1049 * _799;
    float _1073 = _1049 * _801;
    float _1075 = _1059 * _1059;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1079 = _1069 * _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1083 = _1071 * _1081;
    float _1085 = fma(_1063, _1063, _1075);
    float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1089 = -_1079;
    float _1091 = fma(_1073, _1087, _1089);
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1095 = -_1083;
    float _1097 = fma(_1069, _1093, _1095);
    float _1099 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1101 = _1073 * _1099;
    float _1103 = fma(_1067, _1067, _1085);
    float _1105 = _1091 * _1091;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1109 = -_1101;
    float _1111 = fma(_1071, _1107, _1109);
    float _1113 = sqrt(_1103);
    float _1115 = fma(_1097, _1097, _1105);
    float _1117 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1119 = fma(_1111, _1111, _1115);
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1123 = rsqrt(_1119);
    float _1125 = _1045 * _1113;
    float _1127 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1129 = _981 * _1125;
    float _1131 = _1117 * _1125;
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1135 = _1133 * 0.5;
    float _1137 = _1129 * _1121;
    float _1139 = _1131 * _1127;
    float _1141 = _1091 * _1123;
    float _1143 = _1111 * _1123;
    float _1145 = _1097 * _1123;
    float _1147 = _1137 * _1069;
    float _1149 = _1073 * _1141;
    float _1151 = _1071 * _1143;
    float _1153 = _1137 * _1073;
    float _1155 = fma(_1139, _1143, _1147);
    float _1157 = -_1149;
    float _1159 = fma(_1071, _1145, _1157);
    float _1161 = -_1151;
    float _1163 = fma(_1069, _1141, _1161);
    float _1165 = fma(_1139, _1145, _1153);
    float _1167 = _1069 * _1145;
    float _1169 = fma(_1135, _1159, _1155);
    float _1171 = -_1053;
    float _1173 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1175 = fma(_1135, _1163, _1165);
    float _1177 = _1137 * _1071;
    float _1179 = _1023 + _1169;
    float _1181 = -_1167;
    float _1183 = fma(_1073, _1143, _1181);
    float _1185 = _1021 + _1175;
    float _1187 = -_1051;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1193 = _1179 + _1191;
    float _1195 = fma(_1139, _1141, _1177);
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1199 = _1185 + _1197;
    float _1201 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1203 = _1193 * _1193;
    float _1205 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1207 = fma(_1135, _1183, _1195);
    float _1209 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1201);
    float _1211 = fma(_1199, _1199, _1203);
    float _1213 = -_1055;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1217 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1205);
    float _1219 = sqrt(_1211);
    float _1221 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1209);
    float _1223 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1217);
    float _1225 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1227 = _1019 + _1207;
    float _1229 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1231 = 1.0 / _1225;
    float _1233 = _1229 + _1225;
    bool _1235 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1239 = _1237 != 0;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1247 = _1245 != 0;
    bool _1249 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1251 = isnan(0.5);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1257 = _1253 || _1255;
    bool _1259 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1267 = _1263 || _1265;
    bool _1269 = !_1243;
    int _1271 = _1269 ? 0 : 1;
    bool _1273 = !_1239;
    int _1275 = _1273 ? 0 : 1;
    bool _1277 = !_1247;
    int _1279 = _1277 ? 0 : 1;
    float _1281 = _1207;
    float _1283 = _1183;
    float _1285 = _1069;
    float _1287 = _1199;
    float _1289 = _1055;
    float _1291 = _1023;
    float _1293 = _1233;
    float _1295 = _1215;
    if (!_1235)
    {
        _1281 = _1185;
    }
    float _1297 = _1281;
    float _1299 = _1297;
    if (!_1235)
    {
        _1283 = _1179;
    }
    float _1301 = _1283;
    float _1303 = _1301;
    if (!_1235)
    {
        _1285 = _1227;
    }
    float _1305 = _1285;
    bool _1307 = !_1235;
    float _1309 = _1305;
    if (!_1307)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1315 = _1219 + _1313;
        float _1317 = rsqrt(_1211);
        float _1319 = _1315 * _1311;
        float _1321 = _1227 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = _1319 * 0.15915493667125701904296875;
        float _1325 = _1323 * 6.283185482025146484375;
        float _1327 = cos(_1325);
        float _1329 = _1323 * 6.283185482025146484375;
        float _1331 = sin(_1329);
        float _1333 = _1327 + (-1.0);
        float _1335 = fma(_1331, _1321, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1337 = _1333 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = _1317 * _1335;
        float _1341 = fma(_1227, _1327, _1337);
        float _1343 = fma(_1199, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1345 = fma(_1193, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1299 = _1343;
        _1309 = _1341;
        _1303 = _1345;
    }
    float _1347 = _1299;
    float _1349 = _1309;
    float _1351 = _1303;
    float _1353 = -_1053;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1347);
    float _1357 = -_1051;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1361 = -_1055;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1351);
    float _1365 = _1233 * _1231;
    float _1367 = _1365 * 0.5;
    float _1369 = _1355;
    float _1371 = _1359;
    float _1373 = _1351;
    if (_1267)
    {
        _1287 = 1.0;
    }
    float _1375 = _1287;
    float _1377 = _1375;
    if (_1257)
    {
        _1289 = _1355;
    }
    float _1379 = _1289;
    float _1381 = _1379;
    if (_1257)
    {
        _1369 = _1359;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (_1257)
    {
        _1371 = _1363;
    }
    float _1387 = _1371;
    float _1389 = _1387;
    if (!_1257)
    {
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1393 = _1189 + _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1397 = _1173 + _1395;
        float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1401 = -_1023;
        float _1403 = _1401 + _1351;
        float _1405 = _1393 * _1393;
        float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1409 = _1215 + _1407;
        float _1411 = -_1021;
        float _1413 = _1411 + _1347;
        float _1415 = fma(_1397, _1397, _1405);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1419 = fma(_1409, _1409, _1415);
        float _1421 = sqrt(_1419);
        float _1423 = 1.0 / _1125;
        float _1425 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1427 = precise::min(_1421, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1429 = _1427 * _1399;
        float _1431 = _1429 * _1423;
        float _1433 = -_1019;
        float _1435 = _1433 + _1349;
        float _1437 = _1425 * _1431;
        float _1439 = _1403 * _1431;
        float _1441 = fma(_1435, _1437, _1189);
        float _1443 = fma(_1413, _1437, _1173);
        float _1445 = fma(_1425, _1439, _1215);
        _1385 = _1441;
        _1381 = _1443;
        _1389 = _1445;
        _1373 = _1437;
        _1291 = _1439;
        _1293 = _1423;
    }
    float _1447 = _1385;
    float _1449 = _1381;
    float _1451 = _1389;
    float _1453 = _1373;
    float _1455 = _1291;
    float _1457 = _1293;
    float _1459 = _1453;
    float _1461 = _1455;
    float _1463 = _1457;
    if (!_1267)
    {
        float _1465 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1467 = _1465 * 0.15915493667125701904296875;
        float _1469 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1473 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1471);
        float _1475 = _1467 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        float _1479 = _1469 * 0.15915493667125701904296875;
        float _1481 = _1467 * 6.283185482025146484375;
        float _1483 = sin(_1481);
        float _1485 = 1.0 / _1477;
        float _1487 = _1479 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = _1483 * _1485;
        float _1493 = _1479 * 6.283185482025146484375;
        float _1495 = sin(_1493);
        float _1497 = _1489 * _1491;
        float _1499 = 1.0 / _1473;
        float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1503 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1501;
        float _1505 = 1.0 / _1497;
        float _1507 = 1.0 / _1503;
        float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1511 = _1499 * _1509;
        float _1513 = _1495 * _1505;
        float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1517 = fma(_1513, _1511, _1515);
        float _1519 = _1517 * _1507;
        float _1521 = precise::clamp(_1519, 0.0, 1.0);
        _1295 = _1507;
        _1459 = _1479;
        _1461 = _1499;
        _1377 = _1521;
    }
    float _1523 = _1295;
    float _1525 = _1459;
    float _1527 = _1461;
    float _1529 = _1377;
    float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1533 = _1447 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1537 = _1449 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1541 = _1451 + _1539;
    float _1543 = _1533 * _1533;
    float _1545 = fma(_1537, _1537, _1543);
    float _1547 = fma(_1541, _1541, _1545);
    float _1549 = rsqrt(_1547);
    float _1551 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1553 = _1537 * _1551;
    float _1555 = _1541 * _1551;
    float _1557 = _1553 * _1553;
    float _1559 = _1555 * _1555;
    float _1561 = _1557 + _1559;
    float _1563 = sqrt(_1561);
    bool _1565 = _1563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1569 = _1563 + _1567;
    float _1571 = _1523;
    float _1573 = _1569;
    float _1575 = _1525;
    float _1577 = _1533;
    float _1579 = _1553;
    if (_1565)
    {
        float _1581 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1581;
    }
    float _1583 = _1571;
    float _1585 = _1583;
    if (_1565)
    {
        float _1587 = _1569 * _1583;
        _1573 = _1587;
    }
    float _1589 = _1573;
    if (_1565)
    {
        float _1591 = rsqrt(_1561);
        _1585 = _1591;
    }
    float _1593 = _1585;
    float _1595 = _1593;
    if (_1565)
    {
        float _1597 = _1589 * 0.15915493667125701904296875;
        _1575 = _1597;
    }
    float _1599 = _1575;
    float _1601 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1603 = _1541;
    if (_1565)
    {
        float _1605 = _1599 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        _1603 = _1607;
    }
    float _1609 = _1603;
    float _1611 = precise::max(0.0, _1601);
    float _1613 = _1527;
    float _1615 = _1611;
    if (_1565)
    {
        float _1617 = _1599 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        _1613 = _1619;
    }
    float _1621 = _1613;
    float _1623 = -_1551;
    float _1625 = -_1611;
    float _1627 = fma(_1533, _1623, _1625);
    if (_1565)
    {
        float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1577 = _1629;
    }
    float _1631 = _1577;
    float _1633 = sqrt(_1547);
    float _1635 = _1609;
    float _1637 = _1631;
    if (_1565)
    {
        float _1639 = fma(_1609, _1631, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1635 = _1639;
    }
    float _1641 = _1635;
    float _1643 = _1641;
    if (!_1565)
    {
        _1637 = _1557;
    }
    float _1645 = _1637;
    float _1647 = _1645;
    if (_1565)
    {
        float _1649 = _1593 * _1641;
        _1463 = _1649;
    }
    float _1651 = _1463;
    if (!_1565)
    {
        _1643 = _1627;
    }
    float _1653 = _1643;
    float _1655 = _1653;
    float _1657 = _1621;
    if (_1565)
    {
        float _1659 = _1621 + (-1.0);
        _1615 = _1659;
    }
    float _1661 = _1615;
    float _1663 = _1661;
    if (_1565)
    {
        float _1665 = _1553 * _1651;
        _1579 = _1665;
    }
    float _1667 = _1579;
    if (_1565)
    {
        float _1669 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1669;
    }
    float _1671 = _1595;
    if (!_1565)
    {
        _1663 = _1555;
    }
    float _1673 = _1663;
    float _1675 = _1673;
    if (_1565)
    {
        float _1677 = _1555 * _1651;
        _1675 = _1677;
    }
    float _1679 = _1675;
    if (_1565)
    {
        float _1681 = _1667 * _1667;
        _1647 = _1681;
    }
    float _1683 = _1647;
    if (_1565)
    {
        float _1685 = fma(_1627, _1621, _1671);
        _1655 = _1685;
    }
    float _1687 = _1655;
    if (!_1565)
    {
        _1657 = _1559;
    }
    float _1689 = _1657;
    float _1691 = _1689;
    if (_1565)
    {
        float _1693 = _1679 * _1679;
        _1691 = _1693;
    }
    float _1695 = _1691;
    float _1697 = fma(_1687, _1687, _1683);
    float _1699 = _1697 + _1695;
    float _1701 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1705 = fma(_1633, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1703);
    float _1707 = precise::clamp(_1705, 0.0, 1.0);
    float _1709 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1711 = rsqrt(_1699);
    float _1713 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1701);
    float _1715 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1717 = -_1707;
    float _1719 = _1717 + 1.0;
    float _1721 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1709);
    float _1723 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1713);
    float _1725 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1727 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1729 = abs(_1719);
    float _1731 = log2(_1729);
    float _1733 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1721);
    float _1735 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1725);
    float _1737 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1727);
    float _1739 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1741 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1743 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1735);
    float _1745 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1737);
    float _1747 = _1711 * _1667;
    float _1749 = _1711 * _1687;
    float _1751 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1753 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1755 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1757 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1759 = _1711 * _1679;
    float _1761 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1763 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1755);
    float _1765 = -_1757;
    float _1767 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1765);
    float _1769 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1771 = -_1761;
    float _1773 = fma(_1771, _1715, 1.0);
    float _1775 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1763);
    float _1777 = -_1759;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1767);
    float _1781 = exp2(_1769);
    float _1783 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1785 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1775);
    float _1787 = fma(_1779, -0.5, 0.5);
    float _1789 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1791 = fma(_1779, 0.5, 0.5);
    float _1793 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1783);
    float _1795 = _1749 + 1.0;
    float _1797 = log2(_1773);
    float _1799 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1789);
    float _1801 = fma(_1791, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1803 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1793);
    float _1805 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1799);
    float _1807 = 1.0 / _1785;
    float _1809 = -_1749;
    float _1811 = fma(_1781, _1795, _1809);
    float _1813 = fma(_1791, _1801, -0.212114393711090087890625);
    float _1815 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1803);
    float _1817 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1805);
    float _1819 = fma(_1791, _1813, 1.570728778839111328125);
    float _1821 = sqrt(_1787);
    float _1823 = _1797 * 0.693147182464599609375;
    float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1827 = _1815 * _1807;
    float _1829 = _1817 * _1807;
    float _1831 = fma(_1827, 0.5, 0.5);
    float _1833 = fma(_1829, -0.5, 0.5);
    float _1835 = _1821 * 0.636619746685028076171875;
    float _1837 = fma(_1811, 0.5, 0.5);
    float _1839 = -_1819;
    float _1841 = fma(_1835, _1839, 1.0);
    float3 _5951 = float3(_1831, _1833, _1825);
    float _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5951, float3(0.0), isnan(_5951)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5951, float3(0.0), isnan(_5951)), level(0.0)).x;
    float3 _5962 = float3(_1831, _1833, _1825);
    float4 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5962, float3(0.0), isnan(_5962)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5962, float3(0.0), isnan(_5962)), level(0.0)).xyzw;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = _1846.w;
    float2 _5979 = float2(_1841, _1837);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5979, float2(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5979, float2(0.0), isnan(_5979)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1868 = int(_1866);
    int _1870 = abs(_1275);
    float _1872 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1874 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1876 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1878 = int(_1876);
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1882 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1874);
    float _1884 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1882);
    float _1886 = float(_1868);
    float _1888 = 1.0 / _949;
    float _1890 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1884);
    float _1892 = float(uint(_1878));
    float _1894 = 1.0 / _1886;
    int _1896 = ~_1878;
    int _1898 = _1896 + 1;
    float _1900 = 1.0 / _1892;
    float _1902 = _117 * _1894;
    float _1904 = exp2(_1872);
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1908 = _1906 != 0;
    int _1910 = as_type<int>(_1900) + (-2);
    float _1912 = trunc(_1902);
    int _1914 = int(_1912);
    int _1916 = ~_1878;
    int _1918 = _1916 + 1;
    float _1920 = -_1904;
    float _1922 = _1920 + 1.0;
    float _1924 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1926 = float(uint(_1914));
    float _1928 = as_type<float>(_1910) * _1926;
    float _1930 = trunc(_1928);
    float _1932 = precise::max(_1930, 0.0);
    uint _1935 = uint(_1932);
    float _1937 = in.m_54.x;
    float _1939 = in.m_54.y;
    float _1941 = in.m_54.z;
    float _1943 = in.m_54.w;
    bool _1945 = !_1908;
    float _1947 = _1945 ? 7.345489978790283203125 : 1.0;
    int _1949 = _1898 * int(_1935);
    int _1951 = _1949 + _1914;
    float _1953 = float(uint(_1951));
    float _1955 = _1947 * _1937;
    float _1957 = as_type<float>(_1910) * _1953;
    float _1959 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1961 = floor(_1955);
    float _1963 = trunc(_1957);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    float _1969 = -_1961;
    float _1971 = _1955 + _1969;
    int _1973 = int(_1935) + int(_1967);
    float _1975 = float(_1878);
    float _1977 = float(_1914);
    int _1979 = _1918 * _1973;
    int _1981 = _1979 + _1914;
    bool _1983 = _1977 >= _1975;
    bool _1985 = isnan(_1977);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(_1975);
    bool _1991 = _1987 || _1989;
    float _1993 = float(_1991);
    bool _1995 = uint(_1981) >= uint(_1878);
    float _1997 = trunc(_1993);
    int _1999 = int(_1997);
    bool _2001 = !_1995;
    int _2003 = _2001 ? 0 : (-1);
    bool _2005 = _1878 == 0;
    int _2007 = ~_1973;
    int _2009 = _2007 + _2003;
    int _2011 = _2009 + 1;
    float _2013 = _1971 * _1975;
    float _2015 = _117 * _1975;
    int _2017 = _1878 * _2011;
    int _2019 = _2017 + _1914;
    float _2021 = _2015 * _1888;
    float _2023 = trunc(_2013);
    int _2025 = int(_2023);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2029 = _2027 != 0;
    bool _2031 = !_2005;
    int _2033 = _2031 ? _2019 : (-1);
    int _2035 = ~_1999;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = _1878 + (-1);
    float _2043 = trunc(_2021);
    int _2045 = int(_2043);
    bool _2047 = !_2029;
    int _2049 = _2047 ? 0 : 1;
    int _2051 = _2033 * _2039;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2055 = _2053 != 0;
    int _2057 = abs(_1271);
    int _2059 = _1999 * _2041;
    int _2061 = _2059 + _2051;
    int _2063 = abs(_2049);
    bool _2065 = !_2055;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = _2061 * _2057;
    int _2071 = abs(_1279);
    int _2073 = _2025 * _2063;
    int _2075 = _2073 + _1914;
    int _2077 = abs(_2067);
    int _2079 = _2045 * _1870;
    int _2081 = _2079 + _2069;
    int _2083 = ~_1878;
    int _2085 = _2083 + 1;
    int _2087 = _2075 * _2071;
    int _2089 = _2087 + _2081;
    int _2091 = ~_1878;
    int _2093 = _2091 + 1;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2097 = _2095 != 0;
    int _2099 = _2025 * _2077;
    int _2101 = _2099 + _2089;
    float _2103 = float(uint(_2101));
    float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2107 = _2105 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2111 = _2109 != 0;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2115 = as_type<float>(_1910) * _2103;
    float _2117 = 1.0 / _2107;
    float _2119 = trunc(_2115);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    int _2125 = _2085 * int(_2123);
    int _2127 = _2125 + _2101;
    float _2129 = float(uint(_2127));
    float _2131 = as_type<float>(_1910) * _2129;
    float _2133 = trunc(_2131);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    int _2139 = int(_2123) + int(_2137);
    int _2141 = _2093 * _2139;
    int _2143 = _2141 + _2101;
    bool _2145 = uint(_2143) >= uint(_1878);
    bool _2147 = !_2145;
    int _2149 = _2147 ? 0 : (-1);
    bool _2151 = _1943 > 0.5;
    int _2153 = ~_2139;
    int _2155 = _2153 + _2149;
    int _2157 = _2155 + 1;
    int _2159 = _1878 * _2157;
    int _2161 = _2159 + _2101;
    float _2163 = float(uint(_2075));
    bool _2165 = !_2005;
    int _2167 = _2165 ? _2161 : (-1);
    float _2169 = as_type<float>(_1910) * _2163;
    float _2171 = -_191;
    int _2173 = _2151 ? as_type<int>(_2171) : as_type<int>(_191);
    int _2175 = _2167 >> 31;
    int _2177 = ~_1878;
    int _2179 = _2177 + 1;
    float _2181 = trunc(_2169);
    float _2183 = precise::max(_2181, 0.0);
    uint _2185 = uint(_2183);
    int _2187 = _2175 & 3;
    int _2189 = _2167 & 3;
    bool _2191 = _2189 != 0;
    int _2193 = _2167 + _2187;
    float _2195 = _1924 * _1843;
    bool _2197 = !_2097;
    float _2199 = _2197 ? _191 : as_type<float>(_2173);
    int _2201 = _2193 >> 2;
    float _2203 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2205 = _2167 & 3;
    bool _2207 = _2205 != 0;
    float _2209 = _1864 * _2195;
    int _2211 = _2201 << 4;
    int _2213 = _2211 + 368;
    float _2215 = -_2113;
    float _2217 = fma(_2203, 2.0, _2215);
    bool _2219 = !_2207;
    int _2221 = _2219 ? 0 : 1;
    int _2223 = _2179 * int(_2185);
    int _2225 = _2223 + _2075;
    uint _2227 = uint(int(uint(_2213) >> uint(2)));
    uint _2229 = uint(int(uint(int(_2227)) >> uint(2)));
    int _2231 = int(_2227) & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    int _2235 = int(_2227) + 1;
    uint _2237 = uint(int(uint(_2235) >> uint(2)));
    int _2239 = _2235 & 3;
    float _2241 = (*spvDescriptorSet0.vp_c9)._m0[int(_2237)][_2239];
    bool _2243 = uint(_2205) > 1u;
    float _2245 = -_117;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2217);
    int _2249 = _2191 ? 0 : 1;
    float _2251 = float(uint(_2225));
    int _2253 = ~_2249;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    float _2259 = as_type<float>(_1910) * _2251;
    int _2261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2263 = _2261 != 0;
    int _2265 = _2213 + 8;
    uint _2267 = uint(int(uint(_2265) >> uint(2)));
    uint _2269 = uint(int(uint(int(_2267)) >> uint(2)));
    int _2271 = int(_2267) & 3;
    float _2273 = (*spvDescriptorSet0.vp_c9)._m0[int(_2269)][_2271];
    int _2275 = int(_2267) + 1;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    int _2279 = _2275 & 3;
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[int(_2277)][_2279];
    int _2283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2285 = _2283 != 0;
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _2291 = _2257;
    float _2293 = as_type<float>(_1878);
    float _2295 = as_type<float>(_2075);
    if (!_2243)
    {
        int _2297 = ~_2249;
        int _2299 = _2297 + 1;
        _2291 = _2299;
    }
    int _2301 = _2291;
    float _2303 = trunc(_2259);
    float _2305 = precise::max(_2303, 0.0);
    uint _2307 = uint(_2305);
    bool _2309 = uint(_2205) >= 2u;
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2313 = _2311 != 0;
    int _2315 = _2309 ? 0 : 1;
    float _2317 = 1.0 / _2289;
    bool _2319 = _2205 != 3;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2323 = ~_2315;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2331 = _2321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2335 = abs(_2221);
    float _2337 = _2329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2339 = fma(_1959, -2.0, _1880);
    float _2341 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2343;
    int _2347 = abs(_2301);
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2351 = _2349 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _2353 = _2327;
    float _2355 = as_type<float>(_2335);
    if (_2319)
    {
        int _2357 = ~_2315;
        int _2359 = _2357 + 1;
        _2353 = _2359;
    }
    int _2361 = _2353;
    out.m_56.x = _2341;
    out.m_56.y = _2331;
    out.m_56.z = _2337;
    bool _2363 = _1939 > 0.5;
    float _2365 = _2345 * _2117;
    int _2367 = ~_2347;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    float _2373 = _2351 * _2317;
    int _2375 = abs(_2361);
    float _2377 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2339);
    int _2379 = int(_2185) + int(_2307);
    int _2381 = _2371 * as_type<int>(_2241);
    float _2383 = as_type<float>(_2371);
    if (!_1908)
    {
        _2383 = _1941;
    }
    float _2385 = _2383;
    float _2387 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2389 = -_191;
    int _2391 = _2363 ? as_type<int>(_2389) : as_type<int>(_191);
    int _2393 = ~_2335;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    bool _2399 = !_2285;
    float _2401 = _2399 ? _191 : as_type<float>(_2391);
    int _2403 = _2397 * as_type<int>(_2233);
    int _2405 = _2403 + _2381;
    int _2407 = ~_1878;
    int _2409 = _2407 + 1;
    int _2411 = ~_2375;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    bool _2417 = _2205 != 3;
    int _2419 = _2409 * _2379;
    int _2421 = _2419 + _2075;
    bool _2423 = !_2111;
    int _2425 = _2423 ? 0 : 1;
    int _2427 = _2415 * as_type<int>(_2273);
    int _2429 = _2427 + _2405;
    bool _2431 = !_2417;
    int _2433 = _2431 ? 0 : (-1);
    float _2435 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2437 = int(_2435);
    bool _2439 = _1937 > 0.5;
    int _2441 = abs(_2433);
    float _2443 = -_173;
    int _2445 = _2439 ? as_type<int>(_2443) : as_type<int>(_173);
    bool _2447 = _1941 > 0.5;
    bool _2449 = uint(_2421) >= uint(_1878);
    int _2451 = ~_2441;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    float _2457 = -_173;
    int _2459 = _2447 ? as_type<int>(_2457) : as_type<int>(_173);
    int _2461 = abs(_2425);
    int _2463 = _2455 * as_type<int>(_2281);
    int _2465 = _2463 + _2429;
    bool _2467 = !_2449;
    int _2469 = _2467 ? 0 : (-1);
    bool _2471 = !_2263;
    float _2473 = _2471 ? _173 : as_type<float>(_2445);
    bool _2475 = !_2313;
    float _2477 = _2475 ? _173 : as_type<float>(_2459);
    float _2479 = float(uint(_2437));
    int _2481 = ~_2379;
    int _2483 = _2481 + _2469;
    int _2485 = _2483 + 1;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2489 = ~_2461;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    float _2495 = 1.0 / _2479;
    int _2497 = _1878 * _2485;
    int _2499 = _2497 + _2075;
    float _2501 = as_type<float>(_2429);
    float _2503 = _2385;
    if (!_1908)
    {
        _2293 = _1939;
    }
    float _2505 = _2293;
    int _2507 = _2465 * _2493;
    float _2509 = _2505;
    if (!_1908)
    {
        _2355 = _1939;
    }
    float _2511 = _2355;
    float _2513 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2487);
    float _2515 = _2511;
    if (_1908)
    {
        _2509 = _1937;
    }
    float _2517 = _2509;
    float _2519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2521 = _951 + _2519;
    if (_1908)
    {
        _2515 = _1937;
    }
    float _2523 = _2515;
    if (!_1908)
    {
        _2501 = _1937;
    }
    float _2525 = _2501;
    int _2527 = abs(_2437);
    bool _2529 = !_2005;
    int _2531 = _2529 ? _2499 : (-1);
    float _2533 = fma(_2365, _2521, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2535 = float(uint(_2527));
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2539 = _951 + _2537;
    float _2541 = _2525;
    if (!_1908)
    {
        _2295 = _1941;
    }
    float _2543 = _2295;
    int _2545 = _2531 * _2461;
    int _2547 = _2545 + _2507;
    float _2549 = _2543;
    if (_1908)
    {
        _2541 = _1941;
    }
    float _2551 = _2541;
    float _2553 = 1.0 / _2535;
    float _2555 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2387);
    if (_1908)
    {
        _2549 = _1939;
    }
    float _2557 = _2549;
    float _2559 = fma(_2373, _2539, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_1908)
    {
        _2503 = _1939;
    }
    float _2561 = _2503;
    float _2563 = _2557 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2565 = as_type<int>(_2495) + (-2);
    float _2567 = float(uint(_2547));
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _2571 = abs(_2547);
    float _2573 = as_type<float>(_2565) * _2567;
    float _2575 = fma(_2551, (*spvDescriptorSet0.vp_c9)._m0[84].z, _2569);
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2579 = as_type<int>(_2553) + (-2);
    float _2581 = trunc(_2573);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    float _2587 = float(uint(_2571));
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2591 = fma(_2561, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2577);
    bool _2593 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2595 = isnan(_951);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2601 = _2597 || _2599;
    float _2603 = float(_2601);
    float _2605 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[84].x, _2575);
    float _2607 = as_type<float>(_2579) * _2587;
    float _2609 = fma(_2523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2589);
    bool _2611 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2613 = isnan(_951);
    bool _2615 = _2611 || _2613;
    bool _2617 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2619 = _2615 || _2617;
    float _2621 = float(_2619);
    float _2623 = -_2603;
    float _2625 = _2623 + 1.0;
    bool _2627 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2629 = isnan(_951);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = _2605 * (-0.15915493667125701904296875);
    float _2641 = trunc(_2607);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    int _2647 = ~_2437;
    int _2649 = _2647 + 1;
    int _2651 = ~_2527;
    int _2653 = _2651 + 1;
    float _2655 = -_2637;
    float _2657 = _2655 + 1.0;
    float _2659 = _2637 * _2625;
    int _2661 = _2649 * int(_2585);
    int _2663 = _2661 + _2547;
    float _2665 = _2621 * _2657;
    float _2667 = _2639 * 6.283185482025146484375;
    float _2669 = sin(_2667);
    float _2671 = -_2621;
    float _2673 = _2671 + 1.0;
    float _2675 = float(uint(_2663));
    int _2677 = _2653 * int(_2645);
    int _2679 = _2677 + _2571;
    float _2681 = as_type<float>(_2565) * _2675;
    float _2683 = _2533 * _2665;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2687 = float(uint(_2679));
    float _2689 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2693 = trunc(_2681);
    float _2695 = precise::max(_2693, 0.0);
    uint _2697 = uint(_2695);
    float _2699 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2513);
    float _2701 = as_type<float>(_2579) * _2687;
    float _2703 = -_2685;
    float _2705 = fma(_2689, 2.0, _2703);
    float _2707 = fma(_2563, -2.0, _2691);
    float _2709 = fma(_2673, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2683);
    float _2711 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2555);
    int _2713 = ~_2437;
    int _2715 = _2713 + 1;
    float _2717 = _2639 * 6.283185482025146484375;
    float _2719 = cos(_2717);
    float _2721 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2609);
    float _2723 = fma(_2559, _2659, _2709);
    float _2725 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2591);
    float _2727 = -_117;
    float _2729 = fma(_2727, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2705);
    float _2731 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2707);
    float _2733 = _2199 * _2669;
    float _2735 = trunc(_2701);
    float _2737 = precise::max(_2735, 0.0);
    uint _2739 = uint(_2737);
    int _2741 = int(_2585) + int(_2697);
    float _2743 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2723);
    float _2745 = -_2721;
    float _2747 = _2745 + 1.0;
    float _2749 = -_2725;
    float _2751 = _2749 + 1.0;
    float _2753 = -_2699;
    float _2755 = _2753 + 1.0;
    int _2757 = _2715 * _2741;
    int _2759 = _2757 + _2547;
    float _2761 = _2199 * _2719;
    int _2763 = ~_2527;
    int _2765 = _2763 + 1;
    float _2767 = -_2733;
    float _2769 = fma(_2477, _2719, _2767);
    bool _2771 = uint(_2759) >= uint(_2437);
    float _2773 = fma(_2477, _2669, _2761);
    float _2775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2777 = int(_2645) + int(_2739);
    int _2779 = _2765 * _2777;
    int _2781 = _2779 + _2571;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2785 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2791 = uint(_2781) >= uint(_2527);
    float _2793 = _2785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2795 = _2743 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2797 = !_2771;
    int _2799 = _2797 ? 0 : (-1);
    float _2801 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2803 = _2547 ^ _2437;
    float _2805 = _2787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2807 = ~_2741;
    int _2809 = _2807 + _2799;
    int _2811 = _2809 + 1;
    float _2813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2815 = !_2791;
    int _2817 = _2815 ? 0 : (-1);
    uint _2819 = uint(int(uint(_2803) >> uint(31)));
    out.m_58.x = _2793;
    out.m_58.y = _2801;
    out.m_58.z = _2805;
    out.m_58.w = _2795;
    int _2821 = ~_2817;
    int _2823 = _2777 + _2821;
    int _2825 = _2823 + 1;
    int _2827 = ~int(_2819);
    int _2829 = _2827 + 1;
    float _2831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2833 = _2437 == 0;
    float _2835 = _2789 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2837 = _2825 ^ _2829;
    bool _2839 = _2437 == 0;
    int _2841 = _2437 * _2811;
    int _2843 = _2841 + _2547;
    float _2845 = _2775 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2847 = ~_2829;
    int _2849 = _2847 + _2837;
    int _2851 = _2849 + 1;
    float _2853 = _2769 + 0.5;
    float _2855 = _2813 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2857 = _2773 + (-0.5);
    float _2859 = fma(_2845, _2853, _2729);
    bool _2861 = !_2839;
    int _2863 = _2861 ? _2851 : (-1);
    float _2865 = -_2855;
    float _2867 = -_2731;
    float _2869 = fma(_2865, _2857, _2867);
    bool _2871 = !_2833;
    int _2873 = _2871 ? _2843 : (-1);
    float _2875 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2877 = float(_2863);
    float _2879 = _2401 + (-0.5);
    float _2881 = float(_2873);
    float _2883 = -_2711;
    float _2885 = _2883 + 1.0;
    bool _2887 = _1529 > 0.0;
    bool _2889 = isnan(_1529);
    bool _2891 = _2887 || _2889;
    bool _2893 = isnan(0.0);
    bool _2895 = _2891 || _2893;
    float _2897 = -_2377;
    float _2899 = fma(_2875, _2877, _2897);
    float _2901 = _2473 + 0.5;
    float _2903 = fma(_2835, _2881, _2247);
    float _2905 = -_2747;
    float _2907 = fma(_2769, _2905, _2859);
    float _2909 = -_2875;
    float _2911 = fma(_2909, _2879, _2899);
    float _2913 = fma(_2773, _2751, _2869);
    float _2915 = fma(_2835, _2901, _2903);
    float _2917 = fma(_2401, _2885, _2911);
    float _2919 = _1854 * _2195;
    float _2921 = _1890 + _1785;
    float _2923 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2925 = -_1924;
    float _2927 = _2925 + 1.0;
    float _2929 = -_2755;
    float _2931 = fma(_2473, _2929, _2915);
    out.gl_Position.x = _1815;
    out.gl_Position.y = _1817;
    out.gl_Position.z = _1890;
    out.gl_Position.w = _1785;
    float _2933 = fma(_1860, _2919, _1848);
    float _2935 = fma(_1862, _2919, _1850);
    float _2937 = _2921 * 0.5;
    float _2939 = _2923 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2941 = _1854 * _2927;
    float _2943 = fma(_1854, _2209, _1852);
    out.m_60.x = _2931;
    out.m_60.y = _2917;
    out.m_60.z = _2907;
    out.m_60.w = _2913;
    out.m_62.z = _2937;
    out.m_62.w = _1785;
    out.m_45.x = _2939;
    out.m_64.x = _2933;
    out.m_64.y = _2935;
    out.m_64.z = _2943;
    out.m_64.w = _2941;
    if (_2895)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2945 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2945;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _941 = false;
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
        float _3002 = as_type<float>(_99);
        out.gl_Position.z = _3002;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3071 = as_type<float>(_135);
        out.gl_Position.z = _3071;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    int _163 = as_type<int>(_137) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_137) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    float _177 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _159);
    float _179 = _159;
    float _181 = _139;
    if (!_155)
    {
        float _183 = _139 * _139;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    bool _189 = !_169;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _175);
    float _195 = _187;
    if (!_155)
    {
        float _197 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    bool _201 = !_155;
    float _203 = _199;
    float _205 = 0.0;
    if (!_201)
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
        _181 = _263;
    }
    float _265 = _181;
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
    float _387 = sqrt(_193);
    float _389 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _391 = fma(_379, _379, _381);
    float _393 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _397 = fma(_385, _385, _391);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _393);
    float _401 = sqrt(_177);
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
    float _841 = in.m_52.x;
    float _843 = in.m_52.y;
    bool _845 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _847 = isnan(_835);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _857;
    bool _861 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _863 = isnan(_835);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -_855;
    float _875 = _873 + 1.0;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _877;
    float _881 = 1.0 / _859;
    bool _883 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _885 = _871 * _875;
    float _887 = -_871;
    float _889 = _887 + 1.0;
    float _891 = _839 * _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _893;
    float _897 = fma(_879, _891, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _899 = fma(_895, _891, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _901 = _897 * _885;
    float _903 = _899 * _885;
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[143].x, _901);
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[143].y, _903);
    float _909 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[144].x, _905);
    float _911 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[144].y, _907);
    float _913 = _909 * _841;
    float _915 = _911 * _843;
    bool _917 = !_883;
    float _937;
    float _939;
    if (!_917)
    {
        float _919 = in.m_54.x;
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _923 = float(_83);
        float _925 = _919 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _929 = _927 * _921;
        float _931 = floor(_929);
        float _933 = -_931;
        float _935 = _929 + _933;
        _937 = _923;
        _939 = _935;
        _941 = true;
    }
    else
    {
        float _943 = float(_83);
        float _945 = 1.0 / _943;
        float _947 = _117 * _945;
        _937 = _943;
        _939 = _947;
    }
    _941 = false;
    float _949 = _937;
    float _951 = _939;
    float _953 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _955 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _957 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _959 = _467 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _961 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].y, _953);
    float _963 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].x, _955);
    float _965 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].z, _957);
    float _967 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].w, _959);
    float _969 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].y, _961);
    float _971 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].x, _963);
    float _973 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].z, _965);
    float _975 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[16].w, _967);
    float _977 = _969 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _979 = _971 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _981 = _915 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _983 = _975 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _985 = _387 * _977;
    float _987 = _973 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _989 = _401 * _979;
    float _991 = _985 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _993 = _433 * _987;
    float _995 = _985 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _997 = _985 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _999 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].x, _991);
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _995);
    float _1003 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _997);
    float _1005 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].z, _999);
    float _1007 = _799 * _799;
    float _1009 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    float _1011 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1003);
    float _1013 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1005);
    float _1015 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1009);
    float _1017 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1011);
    float _1019 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1021 = _1015 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1023 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _1019 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _1021 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1035 = _1023 + _1033;
    float _1037 = _1027 * _1027;
    float _1039 = fma(_1031, _1031, _1037);
    float _1041 = fma(_1035, _1035, _1039);
    float _1043 = fma(_801, _801, _1007);
    float _1045 = rsqrt(_1041);
    float _1047 = fma(_803, _803, _1043);
    float _1049 = rsqrt(_1047);
    float _1051 = _1027 * _1045;
    float _1053 = _1031 * _1045;
    float _1055 = _1035 * _1045;
    float _1057 = -_1051;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1061 = -_1053;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1031);
    float _1065 = -_1055;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1035);
    float _1069 = _1049 * _803;
    float _1071 = _1049 * _799;
    float _1073 = _1049 * _801;
    float _1075 = _1059 * _1059;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1079 = _1069 * _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1083 = _1071 * _1081;
    float _1085 = fma(_1063, _1063, _1075);
    float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1089 = -_1079;
    float _1091 = fma(_1073, _1087, _1089);
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1095 = -_1083;
    float _1097 = fma(_1069, _1093, _1095);
    float _1099 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1101 = _1073 * _1099;
    float _1103 = fma(_1067, _1067, _1085);
    float _1105 = _1091 * _1091;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1109 = -_1101;
    float _1111 = fma(_1071, _1107, _1109);
    float _1113 = sqrt(_1103);
    float _1115 = fma(_1097, _1097, _1105);
    float _1117 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1119 = fma(_1111, _1111, _1115);
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1123 = rsqrt(_1119);
    float _1125 = _1045 * _1113;
    float _1127 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1129 = _981 * _1125;
    float _1131 = _1117 * _1125;
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1135 = _1133 * 0.5;
    float _1137 = _1129 * _1121;
    float _1139 = _1131 * _1127;
    float _1141 = _1091 * _1123;
    float _1143 = _1111 * _1123;
    float _1145 = _1097 * _1123;
    float _1147 = _1137 * _1069;
    float _1149 = _1073 * _1141;
    float _1151 = _1071 * _1143;
    float _1153 = _1137 * _1073;
    float _1155 = fma(_1139, _1143, _1147);
    float _1157 = -_1149;
    float _1159 = fma(_1071, _1145, _1157);
    float _1161 = -_1151;
    float _1163 = fma(_1069, _1141, _1161);
    float _1165 = fma(_1139, _1145, _1153);
    float _1167 = _1069 * _1145;
    float _1169 = fma(_1135, _1159, _1155);
    float _1171 = -_1053;
    float _1173 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1175 = fma(_1135, _1163, _1165);
    float _1177 = _1137 * _1071;
    float _1179 = _1023 + _1169;
    float _1181 = -_1167;
    float _1183 = fma(_1073, _1143, _1181);
    float _1185 = _1021 + _1175;
    float _1187 = -_1051;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1193 = _1179 + _1191;
    float _1195 = fma(_1139, _1141, _1177);
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1199 = _1185 + _1197;
    float _1201 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1203 = _1193 * _1193;
    float _1205 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1207 = fma(_1135, _1183, _1195);
    float _1209 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1201);
    float _1211 = fma(_1199, _1199, _1203);
    float _1213 = -_1055;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1217 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1205);
    float _1219 = sqrt(_1211);
    float _1221 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1209);
    float _1223 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1217);
    float _1225 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1227 = _1019 + _1207;
    float _1229 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1231 = 1.0 / _1225;
    float _1233 = _1229 + _1225;
    bool _1235 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1239 = _1237 != 0;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1247 = _1245 != 0;
    bool _1249 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1251 = isnan(0.5);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1257 = _1253 || _1255;
    bool _1259 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1267 = _1263 || _1265;
    bool _1269 = !_1243;
    int _1271 = _1269 ? 0 : 1;
    bool _1273 = !_1239;
    int _1275 = _1273 ? 0 : 1;
    bool _1277 = !_1247;
    int _1279 = _1277 ? 0 : 1;
    float _1281 = _1207;
    float _1283 = _1183;
    float _1285 = _1069;
    float _1287 = _1199;
    float _1289 = _1055;
    float _1291 = _1023;
    float _1293 = _1233;
    float _1295 = _1215;
    if (!_1235)
    {
        _1281 = _1185;
    }
    float _1297 = _1281;
    float _1299 = _1297;
    if (!_1235)
    {
        _1283 = _1179;
    }
    float _1301 = _1283;
    float _1303 = _1301;
    if (!_1235)
    {
        _1285 = _1227;
    }
    float _1305 = _1285;
    bool _1307 = !_1235;
    float _1309 = _1305;
    if (!_1307)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1315 = _1219 + _1313;
        float _1317 = rsqrt(_1211);
        float _1319 = _1315 * _1311;
        float _1321 = _1227 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = _1319 * 0.15915493667125701904296875;
        float _1325 = _1323 * 6.283185482025146484375;
        float _1327 = cos(_1325);
        float _1329 = _1323 * 6.283185482025146484375;
        float _1331 = sin(_1329);
        float _1333 = _1327 + (-1.0);
        float _1335 = fma(_1331, _1321, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1337 = _1333 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = _1317 * _1335;
        float _1341 = fma(_1227, _1327, _1337);
        float _1343 = fma(_1199, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1345 = fma(_1193, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1299 = _1343;
        _1309 = _1341;
        _1303 = _1345;
    }
    float _1347 = _1299;
    float _1349 = _1309;
    float _1351 = _1303;
    float _1353 = -_1053;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1347);
    float _1357 = -_1051;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1361 = -_1055;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1351);
    float _1365 = _1233 * _1231;
    float _1367 = _1365 * 0.5;
    float _1369 = _1355;
    float _1371 = _1359;
    float _1373 = _1351;
    if (_1267)
    {
        _1287 = 1.0;
    }
    float _1375 = _1287;
    float _1377 = _1375;
    if (_1257)
    {
        _1289 = _1355;
    }
    float _1379 = _1289;
    float _1381 = _1379;
    if (_1257)
    {
        _1369 = _1359;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (_1257)
    {
        _1371 = _1363;
    }
    float _1387 = _1371;
    float _1389 = _1387;
    if (!_1257)
    {
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1393 = _1189 + _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1397 = _1173 + _1395;
        float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1401 = -_1023;
        float _1403 = _1401 + _1351;
        float _1405 = _1393 * _1393;
        float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1409 = _1215 + _1407;
        float _1411 = -_1021;
        float _1413 = _1411 + _1347;
        float _1415 = fma(_1397, _1397, _1405);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1419 = fma(_1409, _1409, _1415);
        float _1421 = sqrt(_1419);
        float _1423 = 1.0 / _1125;
        float _1425 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1427 = precise::min(_1421, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1429 = _1427 * _1399;
        float _1431 = _1429 * _1423;
        float _1433 = -_1019;
        float _1435 = _1433 + _1349;
        float _1437 = _1425 * _1431;
        float _1439 = _1403 * _1431;
        float _1441 = fma(_1435, _1437, _1189);
        float _1443 = fma(_1413, _1437, _1173);
        float _1445 = fma(_1425, _1439, _1215);
        _1385 = _1441;
        _1381 = _1443;
        _1389 = _1445;
        _1373 = _1437;
        _1291 = _1439;
        _1293 = _1423;
    }
    float _1447 = _1385;
    float _1449 = _1381;
    float _1451 = _1389;
    float _1453 = _1373;
    float _1455 = _1291;
    float _1457 = _1293;
    float _1459 = _1453;
    float _1461 = _1455;
    float _1463 = _1457;
    if (!_1267)
    {
        float _1465 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1467 = _1465 * 0.15915493667125701904296875;
        float _1469 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1473 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1471);
        float _1475 = _1467 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        float _1479 = _1469 * 0.15915493667125701904296875;
        float _1481 = _1467 * 6.283185482025146484375;
        float _1483 = sin(_1481);
        float _1485 = 1.0 / _1477;
        float _1487 = _1479 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = _1483 * _1485;
        float _1493 = _1479 * 6.283185482025146484375;
        float _1495 = sin(_1493);
        float _1497 = _1489 * _1491;
        float _1499 = 1.0 / _1473;
        float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1503 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1501;
        float _1505 = 1.0 / _1497;
        float _1507 = 1.0 / _1503;
        float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1511 = _1499 * _1509;
        float _1513 = _1495 * _1505;
        float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1517 = fma(_1513, _1511, _1515);
        float _1519 = _1517 * _1507;
        float _1521 = precise::clamp(_1519, 0.0, 1.0);
        _1295 = _1507;
        _1459 = _1479;
        _1461 = _1499;
        _1377 = _1521;
    }
    float _1523 = _1295;
    float _1525 = _1459;
    float _1527 = _1461;
    float _1529 = _1377;
    float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1533 = _1447 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1537 = _1449 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1541 = _1451 + _1539;
    float _1543 = _1533 * _1533;
    float _1545 = fma(_1537, _1537, _1543);
    float _1547 = fma(_1541, _1541, _1545);
    float _1549 = rsqrt(_1547);
    float _1551 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1553 = _1537 * _1551;
    float _1555 = _1541 * _1551;
    float _1557 = _1553 * _1553;
    float _1559 = _1555 * _1555;
    float _1561 = _1557 + _1559;
    float _1563 = sqrt(_1561);
    bool _1565 = _1563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1569 = _1563 + _1567;
    float _1571 = _1523;
    float _1573 = _1569;
    float _1575 = _1525;
    float _1577 = _1533;
    float _1579 = _1553;
    if (_1565)
    {
        float _1581 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1581;
    }
    float _1583 = _1571;
    float _1585 = _1583;
    if (_1565)
    {
        float _1587 = _1569 * _1583;
        _1573 = _1587;
    }
    float _1589 = _1573;
    if (_1565)
    {
        float _1591 = rsqrt(_1561);
        _1585 = _1591;
    }
    float _1593 = _1585;
    float _1595 = _1593;
    if (_1565)
    {
        float _1597 = _1589 * 0.15915493667125701904296875;
        _1575 = _1597;
    }
    float _1599 = _1575;
    float _1601 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1603 = _1541;
    if (_1565)
    {
        float _1605 = _1599 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        _1603 = _1607;
    }
    float _1609 = _1603;
    float _1611 = precise::max(0.0, _1601);
    float _1613 = _1527;
    float _1615 = _1611;
    if (_1565)
    {
        float _1617 = _1599 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        _1613 = _1619;
    }
    float _1621 = _1613;
    float _1623 = -_1551;
    float _1625 = -_1611;
    float _1627 = fma(_1533, _1623, _1625);
    if (_1565)
    {
        float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1577 = _1629;
    }
    float _1631 = _1577;
    float _1633 = sqrt(_1547);
    float _1635 = _1609;
    float _1637 = _1631;
    if (_1565)
    {
        float _1639 = fma(_1609, _1631, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1635 = _1639;
    }
    float _1641 = _1635;
    float _1643 = _1641;
    if (!_1565)
    {
        _1637 = _1557;
    }
    float _1645 = _1637;
    float _1647 = _1645;
    if (_1565)
    {
        float _1649 = _1593 * _1641;
        _1463 = _1649;
    }
    float _1651 = _1463;
    if (!_1565)
    {
        _1643 = _1627;
    }
    float _1653 = _1643;
    float _1655 = _1653;
    float _1657 = _1621;
    if (_1565)
    {
        float _1659 = _1621 + (-1.0);
        _1615 = _1659;
    }
    float _1661 = _1615;
    float _1663 = _1661;
    if (_1565)
    {
        float _1665 = _1553 * _1651;
        _1579 = _1665;
    }
    float _1667 = _1579;
    if (_1565)
    {
        float _1669 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1669;
    }
    float _1671 = _1595;
    if (!_1565)
    {
        _1663 = _1555;
    }
    float _1673 = _1663;
    float _1675 = _1673;
    if (_1565)
    {
        float _1677 = _1555 * _1651;
        _1675 = _1677;
    }
    float _1679 = _1675;
    if (_1565)
    {
        float _1681 = _1667 * _1667;
        _1647 = _1681;
    }
    float _1683 = _1647;
    if (_1565)
    {
        float _1685 = fma(_1627, _1621, _1671);
        _1655 = _1685;
    }
    float _1687 = _1655;
    if (!_1565)
    {
        _1657 = _1559;
    }
    float _1689 = _1657;
    float _1691 = _1689;
    if (_1565)
    {
        float _1693 = _1679 * _1679;
        _1691 = _1693;
    }
    float _1695 = _1691;
    float _1697 = fma(_1687, _1687, _1683);
    float _1699 = _1697 + _1695;
    float _1701 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1705 = fma(_1633, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1703);
    float _1707 = precise::clamp(_1705, 0.0, 1.0);
    float _1709 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1711 = rsqrt(_1699);
    float _1713 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1701);
    float _1715 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1717 = -_1707;
    float _1719 = _1717 + 1.0;
    float _1721 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1709);
    float _1723 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1713);
    float _1725 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1727 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1729 = abs(_1719);
    float _1731 = log2(_1729);
    float _1733 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1721);
    float _1735 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1725);
    float _1737 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1727);
    float _1739 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1741 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1743 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1735);
    float _1745 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1737);
    float _1747 = _1711 * _1667;
    float _1749 = _1711 * _1687;
    float _1751 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1753 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1755 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1757 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1759 = _1711 * _1679;
    float _1761 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1763 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1755);
    float _1765 = -_1757;
    float _1767 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1765);
    float _1769 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1771 = -_1761;
    float _1773 = fma(_1771, _1715, 1.0);
    float _1775 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1763);
    float _1777 = -_1759;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1767);
    float _1781 = exp2(_1769);
    float _1783 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1785 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1775);
    float _1787 = fma(_1779, -0.5, 0.5);
    float _1789 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1791 = fma(_1779, 0.5, 0.5);
    float _1793 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1783);
    float _1795 = _1749 + 1.0;
    float _1797 = log2(_1773);
    float _1799 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1789);
    float _1801 = fma(_1791, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1803 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1793);
    float _1805 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1799);
    float _1807 = 1.0 / _1785;
    float _1809 = -_1749;
    float _1811 = fma(_1781, _1795, _1809);
    float _1813 = fma(_1791, _1801, -0.212114393711090087890625);
    float _1815 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1803);
    float _1817 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1805);
    float _1819 = fma(_1791, _1813, 1.570728778839111328125);
    float _1821 = sqrt(_1787);
    float _1823 = _1797 * 0.693147182464599609375;
    float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1827 = _1815 * _1807;
    float _1829 = _1817 * _1807;
    float _1831 = fma(_1827, 0.5, 0.5);
    float _1833 = fma(_1829, -0.5, 0.5);
    float _1835 = _1821 * 0.636619746685028076171875;
    float _1837 = fma(_1811, 0.5, 0.5);
    float _1839 = -_1819;
    float _1841 = fma(_1835, _1839, 1.0);
    float3 _5951 = float3(_1831, _1833, _1825);
    float _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5951, float3(0.0), isnan(_5951)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5951, float3(0.0), isnan(_5951)), level(0.0)).x;
    float3 _5962 = float3(_1831, _1833, _1825);
    float4 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5962, float3(0.0), isnan(_5962)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5962, float3(0.0), isnan(_5962)), level(0.0)).xyzw;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = _1846.w;
    float2 _5979 = float2(_1841, _1837);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5979, float2(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5979, float2(0.0), isnan(_5979)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1868 = int(_1866);
    int _1870 = abs(_1275);
    float _1872 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1874 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1876 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1878 = int(_1876);
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1882 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1874);
    float _1884 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1882);
    float _1886 = float(_1868);
    float _1888 = 1.0 / _949;
    float _1890 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1884);
    float _1892 = float(uint(_1878));
    float _1894 = 1.0 / _1886;
    int _1896 = ~_1878;
    int _1898 = _1896 + 1;
    float _1900 = 1.0 / _1892;
    float _1902 = _117 * _1894;
    float _1904 = exp2(_1872);
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1908 = _1906 != 0;
    int _1910 = as_type<int>(_1900) + (-2);
    float _1912 = trunc(_1902);
    int _1914 = int(_1912);
    int _1916 = ~_1878;
    int _1918 = _1916 + 1;
    float _1920 = -_1904;
    float _1922 = _1920 + 1.0;
    float _1924 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1926 = float(uint(_1914));
    float _1928 = as_type<float>(_1910) * _1926;
    float _1930 = trunc(_1928);
    float _1932 = precise::max(_1930, 0.0);
    uint _1935 = uint(_1932);
    float _1937 = in.m_54.x;
    float _1939 = in.m_54.y;
    float _1941 = in.m_54.z;
    float _1943 = in.m_54.w;
    bool _1945 = !_1908;
    float _1947 = _1945 ? 7.345489978790283203125 : 1.0;
    int _1949 = _1898 * int(_1935);
    int _1951 = _1949 + _1914;
    float _1953 = float(uint(_1951));
    float _1955 = _1947 * _1937;
    float _1957 = as_type<float>(_1910) * _1953;
    float _1959 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1961 = floor(_1955);
    float _1963 = trunc(_1957);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    float _1969 = -_1961;
    float _1971 = _1955 + _1969;
    int _1973 = int(_1935) + int(_1967);
    float _1975 = float(_1878);
    float _1977 = float(_1914);
    int _1979 = _1918 * _1973;
    int _1981 = _1979 + _1914;
    bool _1983 = _1977 >= _1975;
    bool _1985 = isnan(_1977);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(_1975);
    bool _1991 = _1987 || _1989;
    float _1993 = float(_1991);
    bool _1995 = uint(_1981) >= uint(_1878);
    float _1997 = trunc(_1993);
    int _1999 = int(_1997);
    bool _2001 = !_1995;
    int _2003 = _2001 ? 0 : (-1);
    bool _2005 = _1878 == 0;
    int _2007 = ~_1973;
    int _2009 = _2007 + _2003;
    int _2011 = _2009 + 1;
    float _2013 = _1971 * _1975;
    float _2015 = _117 * _1975;
    int _2017 = _1878 * _2011;
    int _2019 = _2017 + _1914;
    float _2021 = _2015 * _1888;
    float _2023 = trunc(_2013);
    int _2025 = int(_2023);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2029 = _2027 != 0;
    bool _2031 = !_2005;
    int _2033 = _2031 ? _2019 : (-1);
    int _2035 = ~_1999;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = _1878 + (-1);
    float _2043 = trunc(_2021);
    int _2045 = int(_2043);
    bool _2047 = !_2029;
    int _2049 = _2047 ? 0 : 1;
    int _2051 = _2033 * _2039;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2055 = _2053 != 0;
    int _2057 = abs(_1271);
    int _2059 = _1999 * _2041;
    int _2061 = _2059 + _2051;
    int _2063 = abs(_2049);
    bool _2065 = !_2055;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = _2061 * _2057;
    int _2071 = abs(_1279);
    int _2073 = _2025 * _2063;
    int _2075 = _2073 + _1914;
    int _2077 = abs(_2067);
    int _2079 = _2045 * _1870;
    int _2081 = _2079 + _2069;
    int _2083 = ~_1878;
    int _2085 = _2083 + 1;
    int _2087 = _2075 * _2071;
    int _2089 = _2087 + _2081;
    int _2091 = ~_1878;
    int _2093 = _2091 + 1;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2097 = _2095 != 0;
    int _2099 = _2025 * _2077;
    int _2101 = _2099 + _2089;
    float _2103 = float(uint(_2101));
    float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2107 = _2105 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2111 = _2109 != 0;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2115 = as_type<float>(_1910) * _2103;
    float _2117 = 1.0 / _2107;
    float _2119 = trunc(_2115);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    int _2125 = _2085 * int(_2123);
    int _2127 = _2125 + _2101;
    float _2129 = float(uint(_2127));
    float _2131 = as_type<float>(_1910) * _2129;
    float _2133 = trunc(_2131);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    int _2139 = int(_2123) + int(_2137);
    int _2141 = _2093 * _2139;
    int _2143 = _2141 + _2101;
    bool _2145 = uint(_2143) >= uint(_1878);
    bool _2147 = !_2145;
    int _2149 = _2147 ? 0 : (-1);
    bool _2151 = _1943 > 0.5;
    int _2153 = ~_2139;
    int _2155 = _2153 + _2149;
    int _2157 = _2155 + 1;
    int _2159 = _1878 * _2157;
    int _2161 = _2159 + _2101;
    float _2163 = float(uint(_2075));
    bool _2165 = !_2005;
    int _2167 = _2165 ? _2161 : (-1);
    float _2169 = as_type<float>(_1910) * _2163;
    float _2171 = -_191;
    int _2173 = _2151 ? as_type<int>(_2171) : as_type<int>(_191);
    int _2175 = _2167 >> 31;
    int _2177 = ~_1878;
    int _2179 = _2177 + 1;
    float _2181 = trunc(_2169);
    float _2183 = precise::max(_2181, 0.0);
    uint _2185 = uint(_2183);
    int _2187 = _2175 & 3;
    int _2189 = _2167 & 3;
    bool _2191 = _2189 != 0;
    int _2193 = _2167 + _2187;
    float _2195 = _1924 * _1843;
    bool _2197 = !_2097;
    float _2199 = _2197 ? _191 : as_type<float>(_2173);
    int _2201 = _2193 >> 2;
    float _2203 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2205 = _2167 & 3;
    bool _2207 = _2205 != 0;
    float _2209 = _1864 * _2195;
    int _2211 = _2201 << 4;
    int _2213 = _2211 + 368;
    float _2215 = -_2113;
    float _2217 = fma(_2203, 2.0, _2215);
    bool _2219 = !_2207;
    int _2221 = _2219 ? 0 : 1;
    int _2223 = _2179 * int(_2185);
    int _2225 = _2223 + _2075;
    uint _2227 = uint(int(uint(_2213) >> uint(2)));
    uint _2229 = uint(int(uint(int(_2227)) >> uint(2)));
    int _2231 = int(_2227) & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    int _2235 = int(_2227) + 1;
    uint _2237 = uint(int(uint(_2235) >> uint(2)));
    int _2239 = _2235 & 3;
    float _2241 = (*spvDescriptorSet0.vp_c9)._m0[int(_2237)][_2239];
    bool _2243 = uint(_2205) > 1u;
    float _2245 = -_117;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2217);
    int _2249 = _2191 ? 0 : 1;
    float _2251 = float(uint(_2225));
    int _2253 = ~_2249;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    float _2259 = as_type<float>(_1910) * _2251;
    int _2261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2263 = _2261 != 0;
    int _2265 = _2213 + 8;
    uint _2267 = uint(int(uint(_2265) >> uint(2)));
    uint _2269 = uint(int(uint(int(_2267)) >> uint(2)));
    int _2271 = int(_2267) & 3;
    float _2273 = (*spvDescriptorSet0.vp_c9)._m0[int(_2269)][_2271];
    int _2275 = int(_2267) + 1;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    int _2279 = _2275 & 3;
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[int(_2277)][_2279];
    int _2283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2285 = _2283 != 0;
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _2291 = _2257;
    float _2293 = as_type<float>(_1878);
    float _2295 = as_type<float>(_2075);
    if (!_2243)
    {
        int _2297 = ~_2249;
        int _2299 = _2297 + 1;
        _2291 = _2299;
    }
    int _2301 = _2291;
    float _2303 = trunc(_2259);
    float _2305 = precise::max(_2303, 0.0);
    uint _2307 = uint(_2305);
    bool _2309 = uint(_2205) >= 2u;
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2313 = _2311 != 0;
    int _2315 = _2309 ? 0 : 1;
    float _2317 = 1.0 / _2289;
    bool _2319 = _2205 != 3;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2323 = ~_2315;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2331 = _2321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2335 = abs(_2221);
    float _2337 = _2329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2339 = fma(_1959, -2.0, _1880);
    float _2341 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2343;
    int _2347 = abs(_2301);
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2351 = _2349 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _2353 = _2327;
    float _2355 = as_type<float>(_2335);
    if (_2319)
    {
        int _2357 = ~_2315;
        int _2359 = _2357 + 1;
        _2353 = _2359;
    }
    int _2361 = _2353;
    out.m_56.x = _2341;
    out.m_56.y = _2331;
    out.m_56.z = _2337;
    bool _2363 = _1939 > 0.5;
    float _2365 = _2345 * _2117;
    int _2367 = ~_2347;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    float _2373 = _2351 * _2317;
    int _2375 = abs(_2361);
    float _2377 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2339);
    int _2379 = int(_2185) + int(_2307);
    int _2381 = _2371 * as_type<int>(_2241);
    float _2383 = as_type<float>(_2371);
    if (!_1908)
    {
        _2383 = _1941;
    }
    float _2385 = _2383;
    float _2387 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2389 = -_191;
    int _2391 = _2363 ? as_type<int>(_2389) : as_type<int>(_191);
    int _2393 = ~_2335;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    bool _2399 = !_2285;
    float _2401 = _2399 ? _191 : as_type<float>(_2391);
    int _2403 = _2397 * as_type<int>(_2233);
    int _2405 = _2403 + _2381;
    int _2407 = ~_1878;
    int _2409 = _2407 + 1;
    int _2411 = ~_2375;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    bool _2417 = _2205 != 3;
    int _2419 = _2409 * _2379;
    int _2421 = _2419 + _2075;
    bool _2423 = !_2111;
    int _2425 = _2423 ? 0 : 1;
    int _2427 = _2415 * as_type<int>(_2273);
    int _2429 = _2427 + _2405;
    bool _2431 = !_2417;
    int _2433 = _2431 ? 0 : (-1);
    float _2435 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2437 = int(_2435);
    bool _2439 = _1937 > 0.5;
    int _2441 = abs(_2433);
    float _2443 = -_173;
    int _2445 = _2439 ? as_type<int>(_2443) : as_type<int>(_173);
    bool _2447 = _1941 > 0.5;
    bool _2449 = uint(_2421) >= uint(_1878);
    int _2451 = ~_2441;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    float _2457 = -_173;
    int _2459 = _2447 ? as_type<int>(_2457) : as_type<int>(_173);
    int _2461 = abs(_2425);
    int _2463 = _2455 * as_type<int>(_2281);
    int _2465 = _2463 + _2429;
    bool _2467 = !_2449;
    int _2469 = _2467 ? 0 : (-1);
    bool _2471 = !_2263;
    float _2473 = _2471 ? _173 : as_type<float>(_2445);
    bool _2475 = !_2313;
    float _2477 = _2475 ? _173 : as_type<float>(_2459);
    float _2479 = float(uint(_2437));
    int _2481 = ~_2379;
    int _2483 = _2481 + _2469;
    int _2485 = _2483 + 1;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2489 = ~_2461;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    float _2495 = 1.0 / _2479;
    int _2497 = _1878 * _2485;
    int _2499 = _2497 + _2075;
    float _2501 = as_type<float>(_2429);
    float _2503 = _2385;
    if (!_1908)
    {
        _2293 = _1939;
    }
    float _2505 = _2293;
    int _2507 = _2465 * _2493;
    float _2509 = _2505;
    if (!_1908)
    {
        _2355 = _1939;
    }
    float _2511 = _2355;
    float _2513 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2487);
    float _2515 = _2511;
    if (_1908)
    {
        _2509 = _1937;
    }
    float _2517 = _2509;
    float _2519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2521 = _951 + _2519;
    if (_1908)
    {
        _2515 = _1937;
    }
    float _2523 = _2515;
    if (!_1908)
    {
        _2501 = _1937;
    }
    float _2525 = _2501;
    int _2527 = abs(_2437);
    bool _2529 = !_2005;
    int _2531 = _2529 ? _2499 : (-1);
    float _2533 = fma(_2365, _2521, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2535 = float(uint(_2527));
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2539 = _951 + _2537;
    float _2541 = _2525;
    if (!_1908)
    {
        _2295 = _1941;
    }
    float _2543 = _2295;
    int _2545 = _2531 * _2461;
    int _2547 = _2545 + _2507;
    float _2549 = _2543;
    if (_1908)
    {
        _2541 = _1941;
    }
    float _2551 = _2541;
    float _2553 = 1.0 / _2535;
    float _2555 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2387);
    if (_1908)
    {
        _2549 = _1939;
    }
    float _2557 = _2549;
    float _2559 = fma(_2373, _2539, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_1908)
    {
        _2503 = _1939;
    }
    float _2561 = _2503;
    float _2563 = _2557 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2565 = as_type<int>(_2495) + (-2);
    float _2567 = float(uint(_2547));
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _2571 = abs(_2547);
    float _2573 = as_type<float>(_2565) * _2567;
    float _2575 = fma(_2551, (*spvDescriptorSet0.vp_c9)._m0[84].z, _2569);
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2579 = as_type<int>(_2553) + (-2);
    float _2581 = trunc(_2573);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    float _2587 = float(uint(_2571));
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2591 = fma(_2561, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2577);
    bool _2593 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2595 = isnan(_951);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2601 = _2597 || _2599;
    float _2603 = float(_2601);
    float _2605 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[84].x, _2575);
    float _2607 = as_type<float>(_2579) * _2587;
    float _2609 = fma(_2523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2589);
    bool _2611 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2613 = isnan(_951);
    bool _2615 = _2611 || _2613;
    bool _2617 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2619 = _2615 || _2617;
    float _2621 = float(_2619);
    float _2623 = -_2603;
    float _2625 = _2623 + 1.0;
    bool _2627 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2629 = isnan(_951);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = _2605 * (-0.15915493667125701904296875);
    float _2641 = trunc(_2607);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    int _2647 = ~_2437;
    int _2649 = _2647 + 1;
    int _2651 = ~_2527;
    int _2653 = _2651 + 1;
    float _2655 = -_2637;
    float _2657 = _2655 + 1.0;
    float _2659 = _2637 * _2625;
    int _2661 = _2649 * int(_2585);
    int _2663 = _2661 + _2547;
    float _2665 = _2621 * _2657;
    float _2667 = _2639 * 6.283185482025146484375;
    float _2669 = sin(_2667);
    float _2671 = -_2621;
    float _2673 = _2671 + 1.0;
    float _2675 = float(uint(_2663));
    int _2677 = _2653 * int(_2645);
    int _2679 = _2677 + _2571;
    float _2681 = as_type<float>(_2565) * _2675;
    float _2683 = _2533 * _2665;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2687 = float(uint(_2679));
    float _2689 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2693 = trunc(_2681);
    float _2695 = precise::max(_2693, 0.0);
    uint _2697 = uint(_2695);
    float _2699 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2513);
    float _2701 = as_type<float>(_2579) * _2687;
    float _2703 = -_2685;
    float _2705 = fma(_2689, 2.0, _2703);
    float _2707 = fma(_2563, -2.0, _2691);
    float _2709 = fma(_2673, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2683);
    float _2711 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2555);
    int _2713 = ~_2437;
    int _2715 = _2713 + 1;
    float _2717 = _2639 * 6.283185482025146484375;
    float _2719 = cos(_2717);
    float _2721 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2609);
    float _2723 = fma(_2559, _2659, _2709);
    float _2725 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2591);
    float _2727 = -_117;
    float _2729 = fma(_2727, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2705);
    float _2731 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2707);
    float _2733 = _2199 * _2669;
    float _2735 = trunc(_2701);
    float _2737 = precise::max(_2735, 0.0);
    uint _2739 = uint(_2737);
    int _2741 = int(_2585) + int(_2697);
    float _2743 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2723);
    float _2745 = -_2721;
    float _2747 = _2745 + 1.0;
    float _2749 = -_2725;
    float _2751 = _2749 + 1.0;
    float _2753 = -_2699;
    float _2755 = _2753 + 1.0;
    int _2757 = _2715 * _2741;
    int _2759 = _2757 + _2547;
    float _2761 = _2199 * _2719;
    int _2763 = ~_2527;
    int _2765 = _2763 + 1;
    float _2767 = -_2733;
    float _2769 = fma(_2477, _2719, _2767);
    bool _2771 = uint(_2759) >= uint(_2437);
    float _2773 = fma(_2477, _2669, _2761);
    float _2775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2777 = int(_2645) + int(_2739);
    int _2779 = _2765 * _2777;
    int _2781 = _2779 + _2571;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2785 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2791 = uint(_2781) >= uint(_2527);
    float _2793 = _2785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2795 = _2743 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2797 = !_2771;
    int _2799 = _2797 ? 0 : (-1);
    float _2801 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2803 = _2547 ^ _2437;
    float _2805 = _2787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2807 = ~_2741;
    int _2809 = _2807 + _2799;
    int _2811 = _2809 + 1;
    float _2813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2815 = !_2791;
    int _2817 = _2815 ? 0 : (-1);
    uint _2819 = uint(int(uint(_2803) >> uint(31)));
    out.m_58.x = _2793;
    out.m_58.y = _2801;
    out.m_58.z = _2805;
    out.m_58.w = _2795;
    int _2821 = ~_2817;
    int _2823 = _2777 + _2821;
    int _2825 = _2823 + 1;
    int _2827 = ~int(_2819);
    int _2829 = _2827 + 1;
    float _2831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2833 = _2437 == 0;
    float _2835 = _2789 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2837 = _2825 ^ _2829;
    bool _2839 = _2437 == 0;
    int _2841 = _2437 * _2811;
    int _2843 = _2841 + _2547;
    float _2845 = _2775 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2847 = ~_2829;
    int _2849 = _2847 + _2837;
    int _2851 = _2849 + 1;
    float _2853 = _2769 + 0.5;
    float _2855 = _2813 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2857 = _2773 + (-0.5);
    float _2859 = fma(_2845, _2853, _2729);
    bool _2861 = !_2839;
    int _2863 = _2861 ? _2851 : (-1);
    float _2865 = -_2855;
    float _2867 = -_2731;
    float _2869 = fma(_2865, _2857, _2867);
    bool _2871 = !_2833;
    int _2873 = _2871 ? _2843 : (-1);
    float _2875 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2877 = float(_2863);
    float _2879 = _2401 + (-0.5);
    float _2881 = float(_2873);
    float _2883 = -_2711;
    float _2885 = _2883 + 1.0;
    bool _2887 = _1529 > 0.0;
    bool _2889 = isnan(_1529);
    bool _2891 = _2887 || _2889;
    bool _2893 = isnan(0.0);
    bool _2895 = _2891 || _2893;
    float _2897 = -_2377;
    float _2899 = fma(_2875, _2877, _2897);
    float _2901 = _2473 + 0.5;
    float _2903 = fma(_2835, _2881, _2247);
    float _2905 = -_2747;
    float _2907 = fma(_2769, _2905, _2859);
    float _2909 = -_2875;
    float _2911 = fma(_2909, _2879, _2899);
    float _2913 = fma(_2773, _2751, _2869);
    float _2915 = fma(_2835, _2901, _2903);
    float _2917 = fma(_2401, _2885, _2911);
    float _2919 = _1854 * _2195;
    float _2921 = _1890 + _1785;
    float _2923 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2925 = -_1924;
    float _2927 = _2925 + 1.0;
    float _2929 = -_2755;
    float _2931 = fma(_2473, _2929, _2915);
    out.gl_Position.x = _1815;
    out.gl_Position.y = _1817;
    out.gl_Position.z = _1890;
    out.gl_Position.w = _1785;
    float _2933 = fma(_1860, _2919, _1848);
    float _2935 = fma(_1862, _2919, _1850);
    float _2937 = _2921 * 0.5;
    float _2939 = _2923 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2941 = _1854 * _2927;
    float _2943 = fma(_1854, _2209, _1852);
    out.m_60.x = _2931;
    out.m_60.y = _2917;
    out.m_60.z = _2907;
    out.m_60.w = _2913;
    out.m_62.z = _2937;
    out.m_62.w = _1785;
    out.m_45.x = _2939;
    out.m_64.x = _2933;
    out.m_64.y = _2935;
    out.m_64.z = _2943;
    out.m_64.w = _2941;
    if (_2895)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2945 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2945;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

