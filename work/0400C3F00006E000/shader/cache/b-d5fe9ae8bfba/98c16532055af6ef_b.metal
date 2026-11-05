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
    float2 _400 = float2(_73, _75);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_400, float2(0.0), isnan(_400))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_400, float2(0.0), isnan(_400))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _417 = float2(_73, _75);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_417, float2(0.0), isnan(_417))).x;
    float2 _425 = float2(_77, _79);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_425, float2(0.0), isnan(_425))).xyzw;
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
    float _146 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _152 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _154 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _156 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _124 * _140;
    float _162 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[11].z, _152);
    float _164 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[11].x, _150);
    float _166 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[11].w, _154);
    float _168 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[12].z, _162);
    float _174 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[12].x, _164);
    float _176 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[12].w, _166);
    float _178 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[13].z, _172);
    float _184 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[13].x, _174);
    float _186 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[13].w, _176);
    float _188 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[14].z, _182);
    float _190 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[14].x, _184);
    float _192 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[14].w, _186);
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _196 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[0].w, _194);
    float _198 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _132 * _140;
    float _204 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].x, _190);
    float _206 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].z, _188);
    float _208 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].w, _192);
    float _210 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[27].x, (*spvDescriptorSet0.fp_c3)._m0[27].y);
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = -_204;
    float _220 = _202 + _218;
    float _222 = -(*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _226 = _212 * _212;
    float _228 = _206;
    if (!_114)
    {
        float _230 = _206 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _228 = _230;
    }
    float _232 = _228;
    float _234 = _216 * _216;
    float _236 = _208 * _220;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = fma(_226, _224, (*spvDescriptorSet0.fp_c3)._m0[28].x);
    float _242 = _232 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _244 = _234 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _246 = -_242;
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _250 = fma(_238, _240, _244);
    float _252 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[34].z, _242);
    float _254 = -_238;
    float _256 = _254 + _250;
    float _258 = _122 * _140;
    float _260 = _116 * _140;
    float _262 = _252 * _256;
    float _264 = _252 * _250;
    float _266 = _258 * _262;
    float _268 = _260 * _262;
    float _270 = _160 * _262;
    float _272 = precise::max(_266, _268);
    float _274 = _258 * _264;
    float _276 = _160 * _264;
    float _278 = precise::max(_270, _272);
    float _280 = _260 * _264;
    float _282 = precise::min(_274, _278);
    float _284 = precise::min(_280, _278);
    float _286 = precise::min(_276, _278);
    float _288 = -_282;
    float _290 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[31].w, _274);
    float _292 = -_284;
    float _294 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[31].w, _280);
    float _296 = -_286;
    float _298 = fma(_296, (*spvDescriptorSet0.fp_c3)._m0[31].w, _276);
    float _300 = _290 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _302 = _294 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _304 = _298 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _306 = _96 * _102;
    float _308 = precise::min(_300, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _310 = precise::min(_302, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _312 = _98 * _102;
    float _314 = precise::min(_304, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _316 = _100 * _102;
    float _318 = precise::max(0.0, _308);
    float _320 = precise::max(0.0, _310);
    float _322 = precise::max(0.0, _314);
    float _324 = _318 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _326 = _320 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _328 = _322 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _330 = fma(_306, _324, _274);
    float _332 = fma(_312, _326, _280);
    float _334 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _336 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _338 = fma(_316, _328, _276);
    float _340 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _342 = fma(_306, _334, _330);
    float _344 = fma(_312, _336, _332);
    float _346 = fma(_316, _340, _338);
    out.m_38.x = _342;
    out.m_38.y = _344;
    out.m_38.z = _346;
    out.m_38.w = _278;
    return out;
}

