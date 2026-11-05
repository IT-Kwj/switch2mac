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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0), center_no_perspective]];
    float4 m_39 [[user(locn1), center_no_perspective]];
    float4 m_35 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _49 = in.m_35.x;
    float _51 = in.m_35.y;
    float2 _347 = float2(_49, _51);
    float _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_347, float2(0.0), isnan(_347))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_347, float2(0.0), isnan(_347))).x;
    float2 _358 = float2(_49, _51);
    float4 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_358, float2(0.0), isnan(_358))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_358, float2(0.0), isnan(_358))).xyzw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float _64 = _56.w;
    float _66 = in.m_37.w;
    float _68 = in.m_37.x;
    float _70 = in.m_37.y;
    float _72 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _74 = -_72;
    float _76 = fma(_74, _66, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _78 = -_72;
    float _80 = fma(_78, _68, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _82 = -_72;
    float _84 = fma(_82, _70, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _86 = 1.0 / _76;
    float _88 = _80 * _86;
    float _90 = _84 * _86;
    float2 _422 = float2(_64, 0.0);
    float2 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_422, float2(0.0), isnan(_422))).xy;
    float _96 = _94.x;
    float _98 = _94.y;
    float2 _434 = float2(_88, _90);
    float3 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_434, float2(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_434, float2(0.0), isnan(_434))).xyz;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = in.m_39.y;
    float _112 = in.m_39.x;
    float _114 = in.m_39.z;
    float _116 = fma(_58, 2.0, -1.0);
    float _118 = fma(_62, 2.0, -1.0);
    float _120 = _110 * _110;
    float _122 = -_72;
    float _124 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _126 = fma(_122, _110, _124);
    float _128 = -_72;
    float _130 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _132 = fma(_128, _112, _130);
    float _134 = -_72;
    float _136 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _138 = fma(_134, _114, _136);
    float _140 = fma(_112, _112, _120);
    float _142 = _140 + 1.0;
    float _144 = _126 * _126;
    float _146 = fma(_132, _132, _144);
    float _148 = rsqrt(_142);
    float _150 = fma(_138, _138, _146);
    float _152 = rsqrt(_150);
    float _154 = _110 * _148;
    float _156 = _112 * _148;
    float _158 = _114 * _148;
    float _160 = -_76;
    float _162 = fma(_160, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _164 = _126 * _152;
    float _166 = _132 * _152;
    float _168 = _138 * _152;
    float _170 = fma(_60, 2.0, -1.0);
    float _172 = -_154;
    float _174 = _164 + _172;
    float _176 = -_156;
    float _178 = _166 + _176;
    float _180 = -_158;
    float _182 = _168 + _180;
    bool _186 = _162 <= 1.0;
    bool _188 = isnan(_162);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = float(_194);
    float _198 = _174 * _174;
    float _200 = _116 * _166;
    float _202 = _170 * _126;
    float _204 = fma(_178, _178, _198);
    float _206 = _162 * _196;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = -_174;
    float _212 = _154 * _210;
    float _214 = _170 * _174;
    float _216 = fma(_182, _182, _204);
    float _218 = -_164;
    float _220 = -_200;
    float _222 = fma(_170, _218, _220);
    float _224 = -_156;
    float _226 = fma(_224, _178, _212);
    float _228 = -_116;
    float _230 = -_214;
    float _232 = fma(_228, _178, _230);
    float _234 = -_154;
    float _236 = _170 * _234;
    float _238 = abs(_208);
    float _240 = log2(_238);
    float _242 = -_158;
    float _244 = fma(_242, _182, _226);
    float _246 = -_118;
    float _248 = fma(_246, _182, _232);
    float _250 = -_236;
    float _252 = fma(_116, _156, _250);
    float _254 = -_168;
    float _256 = fma(_118, _254, _222);
    float _258 = fma(_116, _132, _202);
    float _260 = fma(_118, _158, _252);
    float _262 = rsqrt(_216);
    float _264 = fma(_118, _138, _258);
    float _266 = precise::min(_260, _256);
    float _268 = -_152;
    float _270 = fma(_268, _264, 0.0);
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _240 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _276 = 1.0 / _244;
    float _278 = _262 * _248;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = exp2(_274);
    float _284 = _280 * _266;
    float _286 = _284 * 2.0;
    float _288 = abs(_280);
    float _290 = log2(_288);
    float _292 = _286 * _276;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = _282 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _298 = _296 * _272;
    float _300 = _96 * _290;
    float _302 = exp2(_300);
    float _304 = _106 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _306 = _104 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _308 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _310 = _304 * 0.586610972881317138671875;
    float _312 = fma(_306, 0.298911988735198974609375, _310);
    float _314 = _104 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _316 = fma(_308, 0.114477999508380889892578125, _312);
    float _318 = _106 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _320 = _314 * _298;
    float _322 = _296 * _302;
    float _324 = _108 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _326 = _318 * _298;
    float _328 = _294 * _322;
    float _330 = _324 * _298;
    float _332 = _98 * _328;
    float _334 = _332 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _336 = _316 * _334;
    out.m_42.x = _320;
    out.m_42.y = _326;
    out.m_42.z = _330;
    out.m_42.w = _336;
    return out;
}

