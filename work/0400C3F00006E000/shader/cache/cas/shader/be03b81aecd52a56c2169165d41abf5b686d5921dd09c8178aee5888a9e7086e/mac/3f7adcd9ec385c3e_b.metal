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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_48 [[user(locn5), flat]];
    float4 m_46 [[user(locn6)]];
    float4 m_50 [[user(locn7), flat]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_42.z;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_42.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = 1.0 / _68;
    float _96 = _94 * _74;
    float _98 = _94 * _80;
    float _100 = _94 * _86;
    float _102 = _94 * _92;
    float2 _627 = float2(_96, _98);
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_627, float2(0.0), isnan(_627))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_627, float2(0.0), isnan(_627))).w;
    float2 _638 = float2(_102, _100);
    float2 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_638, float2(0.0), isnan(_638))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_638, float2(0.0), isnan(_638))).xy;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = in.m_44.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_46.x;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_44.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_44.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_48.x;
    float _140 = in.m_50.z;
    float _142 = in.m_46.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = _94 * _118;
    float _150 = _94 * _130;
    float _152 = _138 * 0.25;
    float _154 = rint(_140);
    float _156 = precise::max(_154, 0.0);
    uint _159 = uint(_156);
    uint _161 = clamp(_159, 0u, 65535u);
    float _163 = _94 * _146;
    float _165 = 1.0 / _148;
    float _167 = _150 * _165;
    float _169 = fma(_104, 0.119999997317790985107421875, -0.0599999986588954925537109375);
    float _171 = _94 * _124;
    float _173 = _94 * _136;
    float _175 = fma(_110, _152, _96);
    float _177 = fma(_112, _152, _98);
    float _179 = _173 * _165;
    float _181 = _163 + _169;
    float _183 = _171 + _169;
    float2 _744 = float2(_167, _179);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_744, float2(0.0), isnan(_744))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_744, float2(0.0), isnan(_744))).x;
    float2 _752 = float2(_175, _177);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_752, float2(0.0), isnan(_752))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_752, float2(0.0), isnan(_752))).w;
    float3 _764 = float3(_183, _181, float(int(_161)));
    float3 _768 = select(_764, float3(0.0), isnan(_764));
    float2 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _768.xy, uint(rint(_768.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _768.xy, uint(rint(_768.z))).xw;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = in.m_44.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_52.w;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_54.w;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_56.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _221 = _94 * _199;
    float _223 = _94 * _205;
    float _225 = _221 * _165;
    float _227 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _229 = fma(_225, (*spvDescriptorSet0.fp_c8)._m0[30].w, _227);
    float _231 = 1.0 / _229;
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _235 = _231 * _233;
    float _237 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _239 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _237;
    float _241 = 1.0 / _239;
    float _243 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _245 = fma(_185, (*spvDescriptorSet0.fp_c8)._m0[30].w, _243);
    float _247 = 1.0 / _245;
    float _249 = fma(_223, 2.0, -1.0);
    float _251 = _187 + _249;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _193 * _253;
    float _257 = _94 * _211;
    float _259 = _255 * _257;
    float _261 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _263 = -_235;
    float _265 = fma(_247, _261, _263);
    float _267 = 0.0 + _259;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = _265 * _219;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = _94 * _217;
    float _277 = _269 * _273;
    float _279 = _277 * _275;
    bool _283 = _279 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _285 = isnan(_279);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _291 = _287 || _289;
    float _293 = -_191;
    float _295 = _293 + 1.0;
    float _297 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _299 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _297;
    float _301 = _235;
    if (!_291)
    {
        discard_fragment();
    }
    float _303 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _305 = _303 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _307 = 1.0 / _299;
    float _309 = _295 * _295;
    float _311 = _295 * _309;
    float _313 = 1.0 / _305;
    float _315 = _311 * _223;
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _321 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _319;
    float _323 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _325 = _317 + _323;
    float _327 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _329 = _317 + _327;
    bool _331 = _317 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _333 = isnan(_317);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _325 * _307;
    float _345 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _347 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _345;
    float _349 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _351 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _349;
    float _353 = -_341;
    float _355 = _353 + 1.0;
    float _357 = fma(_321, _343, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _359 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _361 = _359 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _363 = _317 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _365 = isnan(_317);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _329 * _313;
    float _377 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _379 = _317 + _377;
    bool _381 = _317 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _383 = isnan(_317);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = fma(_361, _375, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _395 = _379 * _241;
    float _397 = fma(_347, _343, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _399 = fma(_351, _343, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _401 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _403 = _401 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    bool _405 = _317 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _407 = isnan(_317);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _419 = _417 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _421 = -_373;
    float _423 = _421 + 1.0;
    float _425 = _373 * _355;
    float _427 = fma(_403, _375, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _429 = -_415;
    float _431 = _429 + 1.0;
    float _433 = _391 * _423;
    float _435 = fma(_419, _375, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _437 = _341 * _431;
    float _439 = _357 * _433;
    float _441 = _397 * _433;
    float _443 = -_391;
    float _445 = _443 + 1.0;
    float _447 = _399 * _433;
    float _449 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _451 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _449;
    float _453 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _455 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _453;
    float _457 = fma(_445, (*spvDescriptorSet0.fp_c9)._m0[107].x, _441);
    float _459 = fma(_445, (*spvDescriptorSet0.fp_c9)._m0[107].y, _439);
    float _461 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _463 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _461;
    float _465 = fma(_445, (*spvDescriptorSet0.fp_c9)._m0[107].z, _447);
    float _467 = fma(_451, _395, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _469 = fma(_455, _395, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _471 = fma(_427, _425, _457);
    float _473 = fma(_393, _425, _459);
    float _475 = fma(_463, _395, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _477 = fma(_435, _425, _465);
    float _479 = fma(_467, _437, _471);
    float _481 = fma(_469, _437, _473);
    float _483 = fma(_475, _437, _477);
    float _485 = fma(_415, (*spvDescriptorSet0.fp_c9)._m0[110].x, _479);
    float _487 = fma(_415, (*spvDescriptorSet0.fp_c9)._m0[110].y, _481);
    float _489 = fma(_415, (*spvDescriptorSet0.fp_c9)._m0[110].z, _483);
    if (!_291)
    {
        out.m_59.x = _485;
        out.m_59.y = _487;
        out.m_59.z = _489;
        out.m_59.w = _259;
        return out;
    }
    float _491 = _487 * 0.715200006961822509765625;
    float _493 = in.m_61.w;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_61.x;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_61.y;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = fma(_485, 0.2125999927520751953125, _491);
    float _513 = in.m_61.z;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = fma(_489, 0.072200000286102294921875, _511);
    bool _521 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _523 = 1.0 / _519;
    float _525 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_521)
    {
        float _527 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _529 = _235 + _527;
        _301 = _529;
    }
    float _531 = _301;
    float _533 = _523 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _535 = precise::clamp(_533, 0.0, 1.0);
    float _537 = fma(_535, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _539 = _94 * _497;
    if (_521)
    {
        float _541 = _531 * 8.0;
        float _543 = precise::clamp(_541, 0.0, 1.0);
        _525 = _543;
    }
    float _545 = _525;
    float _547 = _94 * _509;
    float _549 = _537 * _539;
    float _551 = 0.0 + _279;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = _94 * _503;
    float _557 = _94 * _517;
    float _559 = fma(_487, _549, _547);
    float _561 = _553;
    if (_521)
    {
        float _563 = _553 * _545;
        _561 = _563;
    }
    float _565 = _561;
    float _567 = fma(_485, _549, _555);
    float _569 = fma(_489, _549, _557);
    float _571 = 0.0 + _565;
    float _573 = precise::clamp(_571, 0.0, 1.0);
    out.m_59.x = _567;
    out.m_59.y = _559;
    out.m_59.z = _569;
    out.m_59.w = _573;
    return out;
}

