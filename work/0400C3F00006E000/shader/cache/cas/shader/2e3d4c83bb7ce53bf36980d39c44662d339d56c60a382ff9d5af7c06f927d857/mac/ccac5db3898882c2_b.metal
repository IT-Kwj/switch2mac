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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _45;
    float _73 = _71 * _51;
    float _75 = _71 * _57;
    float _77 = _71 * _63;
    float _79 = _71 * _69;
    float2 _424 = float2(_73, _75);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_424, float2(0.0), isnan(_424))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_424, float2(0.0), isnan(_424))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _441 = float2(_73, _75);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_441, float2(0.0), isnan(_441))).x;
    float2 _449 = float2(_77, _79);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_449, float2(0.0), isnan(_449))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_449, float2(0.0), isnan(_449))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    bool _106 = _73 >= (*spvDescriptorSet0.fp_c3)._m0[35].x;
    bool _108 = isnan(_73);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.fp_c3)._m0[35].x);
    bool _114 = _110 || _112;
    float _116 = precise::min(_87, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _118 = -_91;
    float _120 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _122 = precise::min(_85, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _124 = precise::min(_89, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _126 = _116 * 0.715200006961822509765625;
    float _128 = 1.0 / _120;
    float _130 = fma(_122, 0.2125999927520751953125, _126);
    float _132 = fma(_124, 0.072200000286102294921875, _130);
    float _134 = 1.0 / _132;
    float _136 = _134 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _142 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _132 * _140;
    float _148 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _154 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _156 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _158 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _160 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[11].x, _152);
    float _162 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[11].y, _154);
    float _164 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[11].z, _156);
    float _166 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[11].w, _158);
    float _168 = _124 * _140;
    float _170 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[12].x, _160);
    float _180 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[12].w, _166);
    float _182 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[12].y, _162);
    float _188 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].x, _178);
    float _190 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[12].z, _164);
    float _192 = 1.0 / _146;
    float _194 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[14].x, _188);
    float _200 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].y, _186);
    float _202 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].z, _190);
    float _204 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].w, _180);
    float _206 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[15].x, _198);
    float _208 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[14].y, _200);
    float _210 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[14].z, _202);
    float _212 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[14].w, _204);
    float _214 = -_206;
    float _216 = _146 + _214;
    float _218 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[15].y, _208);
    float _220 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[15].w, _212);
    float _222 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _224 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[0].w, _222);
    float _226 = _218 * _192;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[15].z, _210);
    float _232 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[27].x, (*spvDescriptorSet0.fp_c3)._m0[27].y);
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _220 * _216;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = -(*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _244 = _234 * _234;
    float _246 = _230;
    if (!_114)
    {
        float _248 = _230 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _246 = _248;
    }
    float _250 = _246;
    float _252 = _238 * _228;
    float _254 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = fma(_244, _242, (*spvDescriptorSet0.fp_c3)._m0[28].x);
    float _260 = _250 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _262 = _256 * _256;
    float _264 = _252 * _258;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = -_260;
    float _270 = _268 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _272 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[28].z, _266);
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[34].z, _260);
    float _278 = _122 * _140;
    float _280 = -_252;
    float _282 = _280 + _274;
    float _284 = _276 * _282;
    float _286 = _116 * _140;
    float _288 = _276 * _274;
    float _290 = _278 * _284;
    float _292 = _286 * _284;
    float _294 = _168 * _284;
    float _296 = precise::max(_290, _292);
    float _298 = _278 * _288;
    float _300 = _168 * _288;
    float _302 = precise::max(_294, _296);
    float _304 = _286 * _288;
    float _306 = precise::min(_298, _302);
    float _308 = precise::min(_304, _302);
    float _310 = precise::min(_300, _302);
    float _312 = -_306;
    float _314 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[31].w, _298);
    float _316 = -_308;
    float _318 = fma(_316, (*spvDescriptorSet0.fp_c3)._m0[31].w, _304);
    float _320 = -_310;
    float _322 = fma(_320, (*spvDescriptorSet0.fp_c3)._m0[31].w, _300);
    float _324 = _314 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _326 = _318 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _328 = _322 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _330 = _96 * _102;
    float _332 = precise::min(_324, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _334 = precise::min(_326, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _336 = _98 * _102;
    float _338 = precise::min(_328, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _340 = _100 * _102;
    float _342 = precise::max(0.0, _332);
    float _344 = precise::max(0.0, _334);
    float _346 = precise::max(0.0, _338);
    float _348 = _342 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _350 = _344 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _352 = _346 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _354 = fma(_330, _348, _298);
    float _356 = fma(_336, _350, _304);
    float _358 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _360 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _362 = fma(_340, _352, _300);
    float _364 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _366 = fma(_330, _358, _354);
    float _368 = fma(_336, _360, _356);
    float _370 = fma(_340, _364, _362);
    out.m_38.x = _366;
    out.m_38.y = _368;
    out.m_38.z = _370;
    out.m_38.w = _302;
    return out;
}

