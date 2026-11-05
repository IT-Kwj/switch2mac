#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _791 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_791, float2(0.0), isnan(_791))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_791, float2(0.0), isnan(_791))).x;
    float _70 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _72 = 1.0 / _70;
    float _74 = -_68;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _78 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _80 = 1.0 / _76;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[8].y, _82);
    float _86 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _88 = _84 * _72;
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _92 = abs(_90);
    float _94 = log2(_92);
    float _96 = _94 * _86;
    float _98 = exp2(_96);
    float _100 = _78 * _98;
    float _102 = precise::min(_78, _100);
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 > 0;
    int _113 = as_type<int>(_78);
    if (!_111)
    {
        _113 = 0;
    }
    int _115 = _113;
    bool _117 = !_111;
    int _119 = _115;
    if (!_117)
    {
        float _121 = in.m_36.x;
        float _123 = gl_FragCoord.w;
        float _125 = _121 * _123;
        float _127 = in.m_36.y;
        float _129 = gl_FragCoord.w;
        float _131 = _127 * _129;
        float _133 = in.m_36.z;
        float _135 = gl_FragCoord.w;
        float _137 = _133 * _135;
        float _139 = in.m_36.w;
        float _141 = gl_FragCoord.w;
        float _143 = _139 * _141;
        bool _145 = _107 > 3;
        float _147 = _62 * _125;
        float _149 = _62 * _131;
        float _151 = _62 * _137;
        float _153 = _62 * _143;
        bool _155 = !_145;
        float _157 = 0.0;
        int _159 = 0;
        float _161 = 0.0;
        int _163 = 0;
        float _165 = 0.0;
        float _167 = 0.0;
        int _169 = -1;
        int _171 = as_type<int>(_125);
        if (!_155)
        {
            float _173 = in.m_38.x;
            float _175 = gl_FragCoord.w;
            float _177 = _173 * _175;
            float _179 = in.m_38.y;
            float _181 = gl_FragCoord.w;
            float _183 = _179 * _181;
            float _185 = in.m_38.z;
            float _187 = gl_FragCoord.w;
            float _189 = _185 * _187;
            int _191 = _107 + (-3);
            float _193 = _62 * _177;
            float _195 = _62 * _183;
            float _197 = _62 * _189;
            _169 = 0;
            bool _199;
            float _463;
            do
            {
                float _201 = _157;
                int _203 = _159;
                float _205 = _161;
                float _207 = _201 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _209 = _201 + 1.0;
                float _211 = _209 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _213 = abs(_207);
                float _215 = log2(_213);
                float _217 = _209 + 1.0;
                float _219 = _217 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _221 = _217 + 1.0;
                float _223 = abs(_211);
                float _225 = log2(_223);
                float _227 = _221 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _229 = _215 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                float _231 = abs(_219);
                float _233 = log2(_231);
                float _235 = _225 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                float _237 = exp2(_229);
                float _239 = exp2(_235);
                float _241 = _233 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                float _243 = fma(_237, _195, _149);
                float _245 = fma(_237, _193, _147);
                float _247 = fma(_237, _197, _151);
                float _249 = abs(_227);
                float _251 = log2(_249);
                float _253 = _243 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
                float _255 = _243 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
                float _257 = _243 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
                float _259 = _243 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
                float _261 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[10].x, _253);
                float _263 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[11].x, _255);
                float _265 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[12].x, _257);
                float _267 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[13].x, _259);
                float _269 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[10].z, _261);
                float _271 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[11].z, _263);
                float _273 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[12].z, _265);
                float _275 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[13].z, _267);
                float _277 = fma(_195, _239, _149);
                float _279 = exp2(_241);
                float _281 = fma(_193, _239, _147);
                float _283 = _251 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                float _285 = _277 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
                float _287 = _277 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
                float _289 = _277 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
                float _291 = _277 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
                float _293 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[10].x, _285);
                float _295 = exp2(_283);
                float _297 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[11].x, _287);
                float _299 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[12].x, _289);
                float _301 = fma(_197, _239, _151);
                float _303 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[13].x, _291);
                float _305 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _271);
                float _307 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _269);
                float _309 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[10].z, _293);
                float _311 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[11].z, _297);
                float _313 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[12].z, _299);
                float _315 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[13].z, _303);
                float _317 = fma(_195, _279, _149);
                float _319 = fma(_193, _279, _147);
                float _321 = fma(_197, _279, _151);
                float _323 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _313);
                float _325 = _317 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
                float _327 = _317 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
                float _329 = _317 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
                float _331 = _317 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
                float _333 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[10].x, _325);
                float _335 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[12].x, _327);
                float _337 = fma(_195, _295, _149);
                float _339 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[11].x, _329);
                float _341 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[13].x, _331);
                float _343 = fma(_193, _295, _147);
                float _345 = _337 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
                float _347 = _337 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
                float _349 = _337 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
                float _351 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[10].z, _333);
                float _353 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[11].z, _339);
                float _355 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[12].z, _335);
                float _357 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[13].z, _341);
                float _359 = _337 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
                float _361 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _275);
                float _363 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _315);
                float _365 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[10].x, _345);
                float _367 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[11].x, _347);
                float _369 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[12].x, _349);
                float _371 = fma(_197, _295, _151);
                float _373 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[13].x, _359);
                float _375 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _357);
                float _377 = 1.0 / _361;
                float _379 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[10].z, _365);
                float _381 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[13].z, _373);
                float _383 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[11].z, _367);
                float _385 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[12].z, _369);
                float _387 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _311);
                float _389 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _381);
                float _391 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _309);
                float _393 = 1.0 / _363;
                float _395 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _351);
                float _397 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _353);
                float _399 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _355);
                float _401 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _379);
                float _403 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _383);
                float _405 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _385);
                float _407 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _273);
                float _409 = 1.0 / _375;
                float _411 = _305 * _377;
                float _413 = _307 * _377;
                float _415 = _407 * _377;
                float _417 = 1.0 / _389;
                float _419 = _391 * _393;
                float _421 = _387 * _393;
                float _423 = _323 * _393;
                float _425 = _395 * _409;
                float _427 = _397 * _409;
                float _429 = _399 * _409;
                float _431 = _401 * _417;
                float _433 = _403 * _417;
                float _435 = _405 * _417;
                float3 _1431 = float3(_413, _411, float(0));
                float3 _1435 = select(_1431, float3(0.0), isnan(_1431));
                float _437 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1435.xy, uint(rint(_1435.z)), _415, level(0.0));
                float3 _1442 = float3(_419, _421, float(0));
                float3 _1444 = select(_1442, float3(0.0), isnan(_1442));
                float _439 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1444.xy, uint(rint(_1444.z)), _423, level(0.0));
                float3 _1451 = float3(_425, _427, float(0));
                float3 _1453 = select(_1451, float3(0.0), isnan(_1451));
                float _441 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1453.xy, uint(rint(_1453.z)), _429, level(0.0));
                float3 _1460 = float3(_431, _433, float(0));
                float3 _1462 = select(_1460, float3(0.0), isnan(_1460));
                float _443 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1462.xy, uint(rint(_1462.z)), _435, level(0.0));
                int _445 = _203 + 4;
                bool _447 = _445 >= _191;
                float _449 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
                float _451 = fma(_449, (*spvDescriptorSet0.fp_c3)._m0[8].x, _205);
                float _453 = fma(_439, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
                float _455 = fma(_453, (*spvDescriptorSet0.fp_c3)._m0[8].x, _451);
                float _457 = fma(_441, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
                float _459 = fma(_443, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
                float _461 = fma(_457, (*spvDescriptorSet0.fp_c3)._m0[8].x, _455);
                _463 = fma(_459, (*spvDescriptorSet0.fp_c3)._m0[8].x, _461);
                float _465 = _221 + 1.0;
                _199 = !_447;
                _157 = _465;
                _159 = _445;
                _161 = _463;
                _163 = _445;
                _165 = _465;
                _167 = _463;
            } while (_199);
            _171 = as_type<int>(_463);
        }
        int _467 = _163;
        float _469 = _165;
        float _471 = _167;
        int _473 = _169;
        int _475 = _171;
        int _477 = ~_467;
        int _479 = _477 + _107;
        int _481 = _479 + 1;
        bool _483 = _481 > 1;
        bool _485 = !_483;
        int _487 = _467;
        int _489 = _473;
        float _491 = _469;
        float _493 = _471;
        int _495 = _475;
        if (!_485)
        {
            float _497 = _469 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _499 = _469 + 1.0;
            float _501 = in.m_38.y;
            float _503 = gl_FragCoord.w;
            float _505 = _501 * _503;
            float _507 = in.m_38.x;
            float _509 = gl_FragCoord.w;
            float _511 = _507 * _509;
            float _513 = in.m_38.z;
            float _515 = gl_FragCoord.w;
            float _517 = _513 * _515;
            float _519 = _499 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _521 = abs(_497);
            float _523 = log2(_521);
            float _525 = abs(_519);
            float _527 = log2(_525);
            float _529 = _523 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _531 = exp2(_529);
            float _533 = _527 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _535 = exp2(_533);
            float _537 = _62 * _505;
            float _539 = _62 * _511;
            float _541 = _62 * _517;
            float _543 = fma(_537, _531, _149);
            float _545 = fma(_539, _531, _147);
            float _547 = fma(_541, _531, _151);
            float _549 = _543 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _551 = _543 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _553 = fma(_537, _535, _149);
            float _555 = fma(_539, _535, _147);
            float _557 = fma(_541, _535, _151);
            float _559 = fma(_545, (*spvDescriptorSet0.fp_c3)._m0[13].x, _549);
            float _561 = _553 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _563 = _543 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _565 = _543 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _567 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[13].z, _559);
            float _569 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[13].x, _561);
            float _571 = fma(_545, (*spvDescriptorSet0.fp_c3)._m0[10].x, _551);
            float _573 = fma(_545, (*spvDescriptorSet0.fp_c3)._m0[11].x, _563);
            float _575 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _567);
            float _577 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[13].z, _569);
            float _579 = fma(_545, (*spvDescriptorSet0.fp_c3)._m0[12].x, _565);
            float _581 = _553 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _583 = 1.0 / _575;
            float _585 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _577);
            float _587 = _553 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _589 = _553 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _591 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[10].z, _571);
            float _593 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[11].z, _573);
            float _595 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[12].z, _579);
            float _597 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[11].x, _587);
            float _599 = 1.0 / _585;
            float _601 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[10].x, _581);
            float _603 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[12].x, _589);
            float _605 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _593);
            float _607 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[11].z, _597);
            float _609 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[10].z, _601);
            float _611 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _591);
            float _613 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _595);
            float _615 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[12].z, _603);
            float _617 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _607);
            float _619 = _611 * _583;
            float _621 = _605 * _583;
            float _623 = _613 * _583;
            float _625 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _609);
            float _627 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _615);
            float _629 = _617 * _599;
            float _631 = _625 * _599;
            float _633 = _627 * _599;
            float3 _1818 = float3(_619, _621, float(0));
            float3 _1820 = select(_1818, float3(0.0), isnan(_1818));
            float _635 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1820.xy, uint(rint(_1820.z)), _623, level(0.0));
            float3 _1827 = float3(_631, _629, float(0));
            float3 _1829 = select(_1827, float3(0.0), isnan(_1827));
            float _637 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1829.xy, uint(rint(_1829.z)), _633, level(0.0));
            float _639 = _499 + 1.0;
            int _641 = _467 + 2;
            float _643 = fma(_635, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            float _645 = fma(_637, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            float _647 = fma(_643, (*spvDescriptorSet0.fp_c3)._m0[8].x, _471);
            float _649 = fma(_645, (*spvDescriptorSet0.fp_c3)._m0[8].x, _647);
            _487 = _641;
            _489 = 0;
            _491 = _639;
            _493 = _649;
            _495 = as_type<int>(_649);
        }
        int _651 = _487;
        int _653 = _489;
        float _655 = _491;
        float _657 = _493;
        int _659 = _495;
        bool _661 = _651 < _107;
        int _663 = (_661 ? (-1) : 0) | _653;
        int _665 = ~_663;
        int _667 = _659;
        if (!(_665 != 0))
        {
            float _669 = _655 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _671 = in.m_38.y;
            float _673 = gl_FragCoord.w;
            float _675 = _671 * _673;
            float _677 = in.m_38.x;
            float _679 = gl_FragCoord.w;
            float _681 = _677 * _679;
            float _683 = in.m_38.z;
            float _685 = gl_FragCoord.w;
            float _687 = _683 * _685;
            float _689 = abs(_669);
            float _691 = log2(_689);
            float _693 = _691 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _695 = exp2(_693);
            float _697 = _62 * _675;
            float _699 = _62 * _681;
            float _701 = _62 * _687;
            float _703 = fma(_695, _697, _149);
            float _705 = fma(_695, _699, _147);
            float _707 = fma(_695, _701, _151);
            float _709 = _703 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _711 = _703 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _713 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[13].x, _709);
            float _715 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[10].x, _711);
            float _717 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[13].z, _713);
            float _719 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[10].z, _715);
            float _721 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _717);
            float _723 = _703 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _725 = _703 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _727 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _719);
            float _729 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[11].x, _723);
            float _731 = 1.0 / _721;
            float _733 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[12].x, _725);
            float _735 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[11].z, _729);
            float _737 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[12].z, _733);
            float _739 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _735);
            float _741 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _737);
            float _743 = _739 * _731;
            float _745 = _727 * _731;
            float _747 = _741 * _731;
            float3 _2030 = float3(_745, _743, float(0));
            float3 _2032 = select(_2030, float3(0.0), isnan(_2030));
            float _749 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2032.xy, uint(rint(_2032.z)), _747, level(0.0));
            float _751 = fma(_749, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            float _753 = fma(_751, (*spvDescriptorSet0.fp_c3)._m0[8].x, _657);
            _667 = as_type<int>(_753);
        }
        int _755 = _667;
        _119 = _755;
    }
    int _757 = _119;
    out.m_41.x = as_type<float>(_757);
    out.m_41.y = as_type<float>(_757);
    out.m_41.z = as_type<float>(_757);
    return out;
}


struct main0_out_u
{
    uint4 m_41 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _791 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_791, float2(0.0), isnan(_791))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_791, float2(0.0), isnan(_791))).x;
    float _70 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _72 = 1.0 / _70;
    float _74 = -_68;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _78 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _80 = 1.0 / _76;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[8].y, _82);
    float _86 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _88 = _84 * _72;
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _92 = abs(_90);
    float _94 = log2(_92);
    float _96 = _94 * _86;
    float _98 = exp2(_96);
    float _100 = _78 * _98;
    float _102 = precise::min(_78, _100);
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 > 0;
    int _113 = as_type<int>(_78);
    if (!_111)
    {
        _113 = 0;
    }
    int _115 = _113;
    bool _117 = !_111;
    int _119 = _115;
    if (!_117)
    {
        float _121 = in.m_36.x;
        float _123 = gl_FragCoord.w;
        float _125 = _121 * _123;
        float _127 = in.m_36.y;
        float _129 = gl_FragCoord.w;
        float _131 = _127 * _129;
        float _133 = in.m_36.z;
        float _135 = gl_FragCoord.w;
        float _137 = _133 * _135;
        float _139 = in.m_36.w;
        float _141 = gl_FragCoord.w;
        float _143 = _139 * _141;
        bool _145 = _107 > 3;
        float _147 = _62 * _125;
        float _149 = _62 * _131;
        float _151 = _62 * _137;
        float _153 = _62 * _143;
        bool _155 = !_145;
        float _157 = 0.0;
        int _159 = 0;
        float _161 = 0.0;
        int _163 = 0;
        float _165 = 0.0;
        float _167 = 0.0;
        int _169 = -1;
        int _171 = as_type<int>(_125);
        if (!_155)
        {
            float _173 = in.m_38.x;
            float _175 = gl_FragCoord.w;
            float _177 = _173 * _175;
            float _179 = in.m_38.y;
            float _181 = gl_FragCoord.w;
            float _183 = _179 * _181;
            float _185 = in.m_38.z;
            float _187 = gl_FragCoord.w;
            float _189 = _185 * _187;
            int _191 = _107 + (-3);
            float _193 = _62 * _177;
            float _195 = _62 * _183;
            float _197 = _62 * _189;
            _169 = 0;
            bool _199;
            float _463;
            do
            {
                float _201 = _157;
                int _203 = _159;
                float _205 = _161;
                float _207 = _201 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _209 = _201 + 1.0;
                float _211 = _209 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _213 = abs(_207);
                float _215 = log2(_213);
                float _217 = _209 + 1.0;
                float _219 = _217 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _221 = _217 + 1.0;
                float _223 = abs(_211);
                float _225 = log2(_223);
                float _227 = _221 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _229 = _215 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                float _231 = abs(_219);
                float _233 = log2(_231);
                float _235 = _225 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                float _237 = exp2(_229);
                float _239 = exp2(_235);
                float _241 = _233 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                float _243 = fma(_237, _195, _149);
                float _245 = fma(_237, _193, _147);
                float _247 = fma(_237, _197, _151);
                float _249 = abs(_227);
                float _251 = log2(_249);
                float _253 = _243 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
                float _255 = _243 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
                float _257 = _243 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
                float _259 = _243 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
                float _261 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[10].x, _253);
                float _263 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[11].x, _255);
                float _265 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[12].x, _257);
                float _267 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[13].x, _259);
                float _269 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[10].z, _261);
                float _271 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[11].z, _263);
                float _273 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[12].z, _265);
                float _275 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[13].z, _267);
                float _277 = fma(_195, _239, _149);
                float _279 = exp2(_241);
                float _281 = fma(_193, _239, _147);
                float _283 = _251 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                float _285 = _277 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
                float _287 = _277 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
                float _289 = _277 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
                float _291 = _277 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
                float _293 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[10].x, _285);
                float _295 = exp2(_283);
                float _297 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[11].x, _287);
                float _299 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[12].x, _289);
                float _301 = fma(_197, _239, _151);
                float _303 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[13].x, _291);
                float _305 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _271);
                float _307 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _269);
                float _309 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[10].z, _293);
                float _311 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[11].z, _297);
                float _313 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[12].z, _299);
                float _315 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[13].z, _303);
                float _317 = fma(_195, _279, _149);
                float _319 = fma(_193, _279, _147);
                float _321 = fma(_197, _279, _151);
                float _323 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _313);
                float _325 = _317 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
                float _327 = _317 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
                float _329 = _317 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
                float _331 = _317 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
                float _333 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[10].x, _325);
                float _335 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[12].x, _327);
                float _337 = fma(_195, _295, _149);
                float _339 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[11].x, _329);
                float _341 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[13].x, _331);
                float _343 = fma(_193, _295, _147);
                float _345 = _337 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
                float _347 = _337 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
                float _349 = _337 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
                float _351 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[10].z, _333);
                float _353 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[11].z, _339);
                float _355 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[12].z, _335);
                float _357 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[13].z, _341);
                float _359 = _337 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
                float _361 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _275);
                float _363 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _315);
                float _365 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[10].x, _345);
                float _367 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[11].x, _347);
                float _369 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[12].x, _349);
                float _371 = fma(_197, _295, _151);
                float _373 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[13].x, _359);
                float _375 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _357);
                float _377 = 1.0 / _361;
                float _379 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[10].z, _365);
                float _381 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[13].z, _373);
                float _383 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[11].z, _367);
                float _385 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[12].z, _369);
                float _387 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _311);
                float _389 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _381);
                float _391 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _309);
                float _393 = 1.0 / _363;
                float _395 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _351);
                float _397 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _353);
                float _399 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _355);
                float _401 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _379);
                float _403 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _383);
                float _405 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _385);
                float _407 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _273);
                float _409 = 1.0 / _375;
                float _411 = _305 * _377;
                float _413 = _307 * _377;
                float _415 = _407 * _377;
                float _417 = 1.0 / _389;
                float _419 = _391 * _393;
                float _421 = _387 * _393;
                float _423 = _323 * _393;
                float _425 = _395 * _409;
                float _427 = _397 * _409;
                float _429 = _399 * _409;
                float _431 = _401 * _417;
                float _433 = _403 * _417;
                float _435 = _405 * _417;
                float3 _1431 = float3(_413, _411, float(0));
                float3 _1435 = select(_1431, float3(0.0), isnan(_1431));
                float _437 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1435.xy, uint(rint(_1435.z)), _415, level(0.0));
                float3 _1442 = float3(_419, _421, float(0));
                float3 _1444 = select(_1442, float3(0.0), isnan(_1442));
                float _439 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1444.xy, uint(rint(_1444.z)), _423, level(0.0));
                float3 _1451 = float3(_425, _427, float(0));
                float3 _1453 = select(_1451, float3(0.0), isnan(_1451));
                float _441 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1453.xy, uint(rint(_1453.z)), _429, level(0.0));
                float3 _1460 = float3(_431, _433, float(0));
                float3 _1462 = select(_1460, float3(0.0), isnan(_1460));
                float _443 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1462.xy, uint(rint(_1462.z)), _435, level(0.0));
                int _445 = _203 + 4;
                bool _447 = _445 >= _191;
                float _449 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
                float _451 = fma(_449, (*spvDescriptorSet0.fp_c3)._m0[8].x, _205);
                float _453 = fma(_439, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
                float _455 = fma(_453, (*spvDescriptorSet0.fp_c3)._m0[8].x, _451);
                float _457 = fma(_441, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
                float _459 = fma(_443, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
                float _461 = fma(_457, (*spvDescriptorSet0.fp_c3)._m0[8].x, _455);
                _463 = fma(_459, (*spvDescriptorSet0.fp_c3)._m0[8].x, _461);
                float _465 = _221 + 1.0;
                _199 = !_447;
                _157 = _465;
                _159 = _445;
                _161 = _463;
                _163 = _445;
                _165 = _465;
                _167 = _463;
            } while (_199);
            _171 = as_type<int>(_463);
        }
        int _467 = _163;
        float _469 = _165;
        float _471 = _167;
        int _473 = _169;
        int _475 = _171;
        int _477 = ~_467;
        int _479 = _477 + _107;
        int _481 = _479 + 1;
        bool _483 = _481 > 1;
        bool _485 = !_483;
        int _487 = _467;
        int _489 = _473;
        float _491 = _469;
        float _493 = _471;
        int _495 = _475;
        if (!_485)
        {
            float _497 = _469 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _499 = _469 + 1.0;
            float _501 = in.m_38.y;
            float _503 = gl_FragCoord.w;
            float _505 = _501 * _503;
            float _507 = in.m_38.x;
            float _509 = gl_FragCoord.w;
            float _511 = _507 * _509;
            float _513 = in.m_38.z;
            float _515 = gl_FragCoord.w;
            float _517 = _513 * _515;
            float _519 = _499 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _521 = abs(_497);
            float _523 = log2(_521);
            float _525 = abs(_519);
            float _527 = log2(_525);
            float _529 = _523 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _531 = exp2(_529);
            float _533 = _527 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _535 = exp2(_533);
            float _537 = _62 * _505;
            float _539 = _62 * _511;
            float _541 = _62 * _517;
            float _543 = fma(_537, _531, _149);
            float _545 = fma(_539, _531, _147);
            float _547 = fma(_541, _531, _151);
            float _549 = _543 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _551 = _543 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _553 = fma(_537, _535, _149);
            float _555 = fma(_539, _535, _147);
            float _557 = fma(_541, _535, _151);
            float _559 = fma(_545, (*spvDescriptorSet0.fp_c3)._m0[13].x, _549);
            float _561 = _553 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _563 = _543 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _565 = _543 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _567 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[13].z, _559);
            float _569 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[13].x, _561);
            float _571 = fma(_545, (*spvDescriptorSet0.fp_c3)._m0[10].x, _551);
            float _573 = fma(_545, (*spvDescriptorSet0.fp_c3)._m0[11].x, _563);
            float _575 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _567);
            float _577 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[13].z, _569);
            float _579 = fma(_545, (*spvDescriptorSet0.fp_c3)._m0[12].x, _565);
            float _581 = _553 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _583 = 1.0 / _575;
            float _585 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _577);
            float _587 = _553 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _589 = _553 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _591 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[10].z, _571);
            float _593 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[11].z, _573);
            float _595 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[12].z, _579);
            float _597 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[11].x, _587);
            float _599 = 1.0 / _585;
            float _601 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[10].x, _581);
            float _603 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[12].x, _589);
            float _605 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _593);
            float _607 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[11].z, _597);
            float _609 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[10].z, _601);
            float _611 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _591);
            float _613 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _595);
            float _615 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[12].z, _603);
            float _617 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _607);
            float _619 = _611 * _583;
            float _621 = _605 * _583;
            float _623 = _613 * _583;
            float _625 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _609);
            float _627 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _615);
            float _629 = _617 * _599;
            float _631 = _625 * _599;
            float _633 = _627 * _599;
            float3 _1818 = float3(_619, _621, float(0));
            float3 _1820 = select(_1818, float3(0.0), isnan(_1818));
            float _635 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1820.xy, uint(rint(_1820.z)), _623, level(0.0));
            float3 _1827 = float3(_631, _629, float(0));
            float3 _1829 = select(_1827, float3(0.0), isnan(_1827));
            float _637 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1829.xy, uint(rint(_1829.z)), _633, level(0.0));
            float _639 = _499 + 1.0;
            int _641 = _467 + 2;
            float _643 = fma(_635, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            float _645 = fma(_637, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            float _647 = fma(_643, (*spvDescriptorSet0.fp_c3)._m0[8].x, _471);
            float _649 = fma(_645, (*spvDescriptorSet0.fp_c3)._m0[8].x, _647);
            _487 = _641;
            _489 = 0;
            _491 = _639;
            _493 = _649;
            _495 = as_type<int>(_649);
        }
        int _651 = _487;
        int _653 = _489;
        float _655 = _491;
        float _657 = _493;
        int _659 = _495;
        bool _661 = _651 < _107;
        int _663 = (_661 ? (-1) : 0) | _653;
        int _665 = ~_663;
        int _667 = _659;
        if (!(_665 != 0))
        {
            float _669 = _655 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _671 = in.m_38.y;
            float _673 = gl_FragCoord.w;
            float _675 = _671 * _673;
            float _677 = in.m_38.x;
            float _679 = gl_FragCoord.w;
            float _681 = _677 * _679;
            float _683 = in.m_38.z;
            float _685 = gl_FragCoord.w;
            float _687 = _683 * _685;
            float _689 = abs(_669);
            float _691 = log2(_689);
            float _693 = _691 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _695 = exp2(_693);
            float _697 = _62 * _675;
            float _699 = _62 * _681;
            float _701 = _62 * _687;
            float _703 = fma(_695, _697, _149);
            float _705 = fma(_695, _699, _147);
            float _707 = fma(_695, _701, _151);
            float _709 = _703 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _711 = _703 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _713 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[13].x, _709);
            float _715 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[10].x, _711);
            float _717 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[13].z, _713);
            float _719 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[10].z, _715);
            float _721 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _717);
            float _723 = _703 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _725 = _703 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _727 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[10].w, _719);
            float _729 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[11].x, _723);
            float _731 = 1.0 / _721;
            float _733 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[12].x, _725);
            float _735 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[11].z, _729);
            float _737 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[12].z, _733);
            float _739 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[11].w, _735);
            float _741 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[12].w, _737);
            float _743 = _739 * _731;
            float _745 = _727 * _731;
            float _747 = _741 * _731;
            float3 _2030 = float3(_745, _743, float(0));
            float3 _2032 = select(_2030, float3(0.0), isnan(_2030));
            float _749 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2032.xy, uint(rint(_2032.z)), _747, level(0.0));
            float _751 = fma(_749, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            float _753 = fma(_751, (*spvDescriptorSet0.fp_c3)._m0[8].x, _657);
            _667 = as_type<int>(_753);
        }
        int _755 = _667;
        _119 = _755;
    }
    int _757 = _119;
    out.m_41.x = as_type<float>(_757);
    out.m_41.y = as_type<float>(_757);
    out.m_41.z = as_type<float>(_757);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

