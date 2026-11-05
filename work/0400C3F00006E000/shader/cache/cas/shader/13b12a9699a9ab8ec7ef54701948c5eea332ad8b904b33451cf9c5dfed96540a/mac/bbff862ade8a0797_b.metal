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
    float2 _384 = float2(_73, _75);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_384, float2(0.0), isnan(_384))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_384, float2(0.0), isnan(_384))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _401 = float2(_73, _75);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_401, float2(0.0), isnan(_401))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_401, float2(0.0), isnan(_401))).x;
    float2 _409 = float2(_77, _79);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_409, float2(0.0), isnan(_409))).xyzw;
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
    float _148 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _150 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _152 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[11].z, _148);
    float _158 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = 1.0 / _146;
    float _164 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _166 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[12].z, _156);
    float _168 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[11].w, _164);
    float _174 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[13].z, _166);
    float _176 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[11].x, _150);
    float _178 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[14].z, _174);
    float _184 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[12].x, _176);
    float _186 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[12].w, _172);
    float _188 = _126 * _134;
    float _190 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[15].z, _182);
    float _192 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[13].x, _184);
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _196 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[0].w, _194);
    float _198 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[13].w, _186);
    float _200 = _190;
    if (!_114)
    {
        float _202 = _190 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _200 = _202;
    }
    float _204 = _200;
    float _206 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[14].x, _192);
    float _208 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[14].w, _198);
    float _214 = _204 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _216 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[15].x, _206);
    float _218 = _210 * _210;
    float _220 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[15].w, _212);
    float _222 = -_214;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _226 = -_216;
    float _228 = _188 + _226;
    float _230 = _218 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _232 = _118 * _134;
    float _234 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[34].z, _214);
    float _236 = _220 * _228;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _116 * _134;
    float _242 = _120 * _134;
    float _244 = _234 * _230;
    float _246 = _238 + _230;
    float _248 = _232 * _244;
    float _250 = _240 * _244;
    float _252 = _242 * _244;
    float _254 = _234 * _246;
    float _256 = precise::max(_248, _250);
    float _258 = _232 * _254;
    float _260 = _242 * _254;
    float _262 = precise::max(_252, _256);
    float _264 = _240 * _254;
    float _266 = precise::min(_258, _262);
    float _268 = precise::min(_264, _262);
    float _270 = precise::min(_260, _262);
    float _272 = -_266;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[31].w, _258);
    float _276 = -_268;
    float _278 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[31].w, _264);
    float _280 = -_270;
    float _282 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[31].w, _260);
    float _284 = _274 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _286 = _278 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _288 = _282 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _290 = _96 * _102;
    float _292 = precise::min(_284, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _294 = precise::min(_286, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _296 = _98 * _102;
    float _298 = precise::min(_288, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _300 = _100 * _102;
    float _302 = precise::max(0.0, _292);
    float _304 = precise::max(0.0, _294);
    float _306 = precise::max(0.0, _298);
    float _308 = _302 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _310 = _304 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _312 = _306 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _314 = fma(_290, _308, _258);
    float _316 = fma(_296, _310, _264);
    float _318 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _320 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _322 = fma(_300, _312, _260);
    float _324 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _326 = fma(_290, _318, _314);
    float _328 = fma(_296, _320, _316);
    float _330 = fma(_300, _324, _322);
    out.m_38.x = _326;
    out.m_38.y = _328;
    out.m_38.z = _330;
    out.m_38.w = _262;
    return out;
}

