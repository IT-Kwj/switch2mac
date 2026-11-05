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
    float2 _402 = float2(_73, _75);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_402, float2(0.0), isnan(_402))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _419 = float2(_73, _75);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_419, float2(0.0), isnan(_419))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_419, float2(0.0), isnan(_419))).x;
    float2 _427 = float2(_77, _79);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_427, float2(0.0), isnan(_427))).xyzw;
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
    float _118 = precise::min(_85, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _120 = precise::min(_89, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _122 = _116 * 0.715200006961822509765625;
    float _124 = fma(_118, 0.2125999927520751953125, _122);
    float _126 = fma(_120, 0.072200000286102294921875, _124);
    float _128 = 1.0 / _126;
    float _130 = _128 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = -_91;
    float _146 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _148 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _150 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _152 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _154 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _156 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[11].x, _148);
    float _158 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[11].y, _150);
    float _160 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[11].z, _152);
    float _162 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[11].w, _154);
    float _168 = 1.0 / _146;
    float _170 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[12].z, _160);
    float _176 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[12].w, _166);
    float _182 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[13].z, _174);
    float _184 = _126 * _134;
    float _186 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].z, _182);
    float _192 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[12].x, _156);
    float _194 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[12].y, _158);
    float _196 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[15].z, _190);
    float _198 = 1.0 / _184;
    float _200 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _202 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[0].w, _200);
    float _204 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[13].x, _192);
    float _206 = _196;
    if (!_114)
    {
        float _208 = _196 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _206 = _208;
    }
    float _210 = _206;
    float _212 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[13].y, _194);
    float _214 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[13].w, _180);
    float _220 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].x, _204);
    float _222 = _210 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _224 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].y, _212);
    float _226 = _216 * _216;
    float _228 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].w, _218);
    float _230 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[15].x, _220);
    float _232 = -_222;
    float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _236 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[15].y, _224);
    float _238 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[15].w, _228);
    float _240 = -_230;
    float _242 = _184 + _240;
    float _244 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[34].z, _222);
    float _246 = _226 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _248 = _236 * _198;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _238 * _242;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _118 * _134;
    float _258 = _244 * _246;
    float _260 = _116 * _134;
    float _262 = fma(_254, _250, _246);
    float _264 = _120 * _134;
    float _266 = _256 * _258;
    float _268 = _260 * _258;
    float _270 = _244 * _262;
    float _272 = _264 * _258;
    float _274 = precise::max(_266, _268);
    float _276 = _256 * _270;
    float _278 = _264 * _270;
    float _280 = precise::max(_272, _274);
    float _282 = _260 * _270;
    float _284 = precise::min(_276, _280);
    float _286 = precise::min(_282, _280);
    float _288 = precise::min(_278, _280);
    float _290 = -_284;
    float _292 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[31].w, _276);
    float _294 = -_286;
    float _296 = fma(_294, (*spvDescriptorSet0.fp_c3)._m0[31].w, _282);
    float _298 = -_288;
    float _300 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[31].w, _278);
    float _302 = _292 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _304 = _296 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _306 = _300 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _308 = _96 * _102;
    float _310 = precise::min(_302, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _312 = precise::min(_304, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _314 = _98 * _102;
    float _316 = precise::min(_306, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _318 = _100 * _102;
    float _320 = precise::max(0.0, _310);
    float _322 = precise::max(0.0, _312);
    float _324 = precise::max(0.0, _316);
    float _326 = _320 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _328 = _322 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _330 = _324 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _332 = fma(_308, _326, _276);
    float _334 = fma(_314, _328, _282);
    float _336 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _338 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _340 = fma(_318, _330, _278);
    float _342 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _344 = fma(_308, _336, _332);
    float _346 = fma(_314, _338, _334);
    float _348 = fma(_318, _342, _340);
    out.m_38.x = _344;
    out.m_38.y = _346;
    out.m_38.z = _348;
    out.m_38.w = _280;
    return out;
}

