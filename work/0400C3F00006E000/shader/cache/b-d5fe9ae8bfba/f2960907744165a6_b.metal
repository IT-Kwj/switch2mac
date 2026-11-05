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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_50 [[user(locn2), flat]];
    float4 m_44 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_48 [[user(locn7), flat]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_42.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_42.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _68;
    float _84 = _82 * _74;
    float _86 = _82 * _80;
    float2 _544 = float2(_84, _86);
    float _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_544, float2(0.0), isnan(_544))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_544, float2(0.0), isnan(_544))).w;
    float _90 = in.m_44.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_46.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_46.y;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_48.x;
    float _122 = _82 * _94;
    float _124 = _82 * _100;
    float _126 = _82 * _112;
    float _128 = _82 * _118;
    float _130 = 1.0 / _122;
    float _132 = fma(_88, 0.100000001490116119384765625, -0.0500000007450580596923828125);
    float _134 = _82 * _106;
    float _136 = _126 * _130;
    float _138 = _124 + _132;
    float _140 = _134 * _130;
    float _142 = _128 + _132;
    float _144 = rint(_120);
    float _146 = precise::max(_144, 0.0);
    uint _149 = uint(_146);
    uint _151 = clamp(_149, 0u, 65535u);
    float2 _636 = float2(_136, _140);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_636, float2(0.0), isnan(_636))).x;
    float3 _648 = float3(_138, _142, float(int(_151)));
    float3 _652 = select(_648, float3(0.0), isnan(_648));
    float2 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _652.xy, uint(rint(_652.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _652.xy, uint(rint(_652.z))).xw;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = in.m_50.y;
    float _165 = in.m_50.x;
    float _167 = in.m_50.z;
    float _169 = in.m_44.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_52.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = -_163;
    float _183 = _181 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _185 = -_165;
    float _187 = _185 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _189 = -_167;
    float _191 = _189 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _193 = _82 * _173;
    float _195 = _183 * _183;
    float _197 = _193 * _130;
    float _199 = fma(_187, _187, _195);
    float _201 = fma(_191, _191, _199);
    float _203 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _205 = _203 + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _207 = sqrt(_201);
    float _209 = 1.0 / _205;
    float _211 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _213 = _207 + _211;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _217 = fma(_197, (*spvDescriptorSet0.fp_c8)._m0[30].w, _215);
    float _219 = _213 * _209;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = 1.0 / _217;
    float _225 = fma(_221, -2.0, 3.0);
    float _227 = _221 * _221;
    float _229 = -_227;
    float _231 = fma(_225, _229, 1.0);
    float _233 = _82 * _179;
    float _235 = in.m_54.x;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = _233 * _231;
    float _243 = fma(_241, 2.0, -1.0);
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _247 = _223 * _245;
    float _249 = _88 + _243;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _255 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[30].w, _253);
    float _257 = in.m_56.w;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = 1.0 / _255;
    float _265 = -_159;
    float _267 = _265 + 1.0;
    float _269 = _251 * _161;
    float _271 = _269 * _269;
    float _273 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _275 = -_247;
    float _277 = fma(_263, _273, _275);
    float _279 = fma(_277, 0.00999999977648258209228515625, _267);
    float _281 = precise::max(_279, 1.0);
    float _283 = precise::min(_281, 1.5);
    float _285 = _82 * _261;
    float _287 = fma(_283, 2.0, -2.0);
    float _289 = _271 * _285;
    float _291 = _289 * _287;
    float _293 = _82 * _239;
    float _295 = 0.0 + _291;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _297 * _293;
    bool _303 = _299 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _305 = isnan(_299);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _311 = _307 || _309;
    float _313 = in.m_48.y;
    float _315 = _247;
    if (!_311)
    {
        discard_fragment();
    }
    float _317 = rint(_313);
    float _319 = precise::max(_317, 0.0);
    uint _321 = uint(_319);
    uint _323 = clamp(_321, 0u, 65535u);
    float3 _894 = float3(_138, _142, float(int(_323)));
    float3 _896 = select(_894, float3(0.0), isnan(_894));
    float2 _325 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _896.xy, uint(rint(_896.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _896.xy, uint(rint(_896.z))).yz;
    float _327 = _325.x;
    float _329 = _325.y;
    float _331 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _333 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _331;
    float _335 = _329 * 0.577381789684295654296875;
    float _337 = fma(_327, 0.816474258899688720703125, _335);
    float _339 = fma(_337, 0.5, 0.5);
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = 1.0 / _333;
    float _345 = fma(_341, -2.0, 3.0);
    float _347 = _341 * _341;
    float _349 = _345 * _347;
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _355 = _351 + _353;
    bool _357 = _351 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _359 = isnan(_351);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = _351 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _371 = isnan(_351);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _383 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _381;
    float _385 = _355 * _343;
    float _387 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _389 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _387;
    float _391 = -_367;
    float _393 = _391 + 1.0;
    float _395 = fma(_383, _385, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _397 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _399 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _397;
    float _401 = fma(_389, _385, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _403 = _379 * _393;
    float _405 = -_379;
    float _407 = _405 + 1.0;
    float _409 = fma(_399, _385, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _411 = _401 * _403;
    float _413 = _409 * _403;
    float _415 = _395 * _403;
    float _417 = fma(_407, (*spvDescriptorSet0.fp_c9)._m0[107].x, _411);
    float _419 = fma(_407, (*spvDescriptorSet0.fp_c9)._m0[107].y, _413);
    float _421 = fma(_407, (*spvDescriptorSet0.fp_c9)._m0[107].z, _415);
    float _423 = fma(_367, (*spvDescriptorSet0.fp_c9)._m0[108].x, _417);
    float _425 = fma(_367, (*spvDescriptorSet0.fp_c9)._m0[108].y, _419);
    float _427 = fma(_367, (*spvDescriptorSet0.fp_c9)._m0[108].z, _421);
    if (!_311)
    {
        out.m_59.x = _423;
        out.m_59.y = _425;
        out.m_59.z = _427;
        out.m_59.w = _291;
        return out;
    }
    float _429 = _425 * 0.715200006961822509765625;
    float _431 = in.m_61.w;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_61.x;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_61.y;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = fma(_423, 0.2125999927520751953125, _429);
    float _451 = in.m_61.z;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = fma(_427, 0.072200000286102294921875, _449);
    bool _459 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _461 = 1.0 / _457;
    float _463 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_459)
    {
        float _465 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _467 = _247 + _465;
        _315 = _467;
    }
    float _469 = _315;
    float _471 = _461 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    float _475 = fma(_473, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _477 = _82 * _435;
    if (_459)
    {
        float _479 = _469 * 8.0;
        float _481 = precise::clamp(_479, 0.0, 1.0);
        _463 = _481;
    }
    float _483 = _463;
    float _485 = _82 * _447;
    float _487 = _475 * _477;
    float _489 = 0.0 + _299;
    float _491 = precise::clamp(_489, 0.0, 1.0);
    float _493 = _82 * _441;
    float _495 = _82 * _455;
    float _497 = fma(_425, _487, _485);
    float _499 = _491;
    if (_459)
    {
        float _501 = _491 * _483;
        _499 = _501;
    }
    float _503 = _499;
    float _505 = fma(_423, _487, _493);
    float _507 = fma(_427, _487, _495);
    float _509 = 0.0 + _503;
    float _511 = precise::clamp(_509, 0.0, 1.0);
    out.m_59.x = _505;
    out.m_59.y = _497;
    out.m_59.z = _507;
    out.m_59.w = _511;
    return out;
}

