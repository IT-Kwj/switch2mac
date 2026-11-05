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
    float2 _404 = float2(_73, _75);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_404, float2(0.0), isnan(_404))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _421 = float2(_73, _75);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_421, float2(0.0), isnan(_421))).x;
    float2 _429 = float2(_77, _79);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_429, float2(0.0), isnan(_429))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_429, float2(0.0), isnan(_429))).xyzw;
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
    float _128 = fma(_122, 0.2125999927520751953125, _126);
    float _130 = fma(_124, 0.072200000286102294921875, _128);
    float _132 = 1.0 / _130;
    float _134 = _132 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _140 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _130 * _138;
    float _146 = _124 * _138;
    float _148 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _150 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _152 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _154 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[11].x, _148);
    float _160 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[11].z, _150);
    float _162 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[11].w, _152);
    float _164 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = 1.0 / _120;
    float _170 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[12].x, _158);
    float _176 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[12].z, _160);
    float _178 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[12].w, _162);
    float _180 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[13].x, _174);
    float _186 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[13].w, _178);
    float _192 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[13].z, _176);
    float _194 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[14].x, _184);
    float _196 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[14].z, _192);
    float _198 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[15].x, _194);
    float _200 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[14].w, _190);
    float _202 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _204 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[0].w, _202);
    float _206 = -_198;
    float _208 = _144 + _206;
    float _210 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[15].z, _196);
    float _212 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[27].x, (*spvDescriptorSet0.fp_c3)._m0[27].y);
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[15].w, _200);
    float _218 = -(*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _220 = _218 + (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _222 = _214 * _214;
    float _224 = _210;
    if (!_114)
    {
        float _226 = _210 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _224 = _226;
    }
    float _228 = _224;
    float _230 = _216 * _208;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = fma(_222, _220, (*spvDescriptorSet0.fp_c3)._m0[28].x);
    float _240 = _228 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _242 = _236 * _236;
    float _244 = _232 * _238;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = -_240;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _252 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[28].z, _246);
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[34].z, _240);
    float _258 = _122 * _138;
    float _260 = _116 * _138;
    float _262 = -_232;
    float _264 = _262 + _254;
    float _266 = _256 * _264;
    float _268 = _256 * _254;
    float _270 = _258 * _266;
    float _272 = _260 * _266;
    float _274 = _146 * _266;
    float _276 = precise::max(_270, _272);
    float _278 = _258 * _268;
    float _280 = _146 * _268;
    float _282 = precise::max(_274, _276);
    float _284 = _260 * _268;
    float _286 = precise::min(_278, _282);
    float _288 = precise::min(_284, _282);
    float _290 = precise::min(_280, _282);
    float _292 = -_286;
    float _294 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[31].w, _278);
    float _296 = -_288;
    float _298 = fma(_296, (*spvDescriptorSet0.fp_c3)._m0[31].w, _284);
    float _300 = -_290;
    float _302 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[31].w, _280);
    float _304 = _294 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _306 = _298 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _308 = _302 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _310 = _96 * _102;
    float _312 = precise::min(_304, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _314 = precise::min(_306, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _316 = _98 * _102;
    float _318 = precise::min(_308, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _320 = _100 * _102;
    float _322 = precise::max(0.0, _312);
    float _324 = precise::max(0.0, _314);
    float _326 = precise::max(0.0, _318);
    float _328 = _322 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _330 = _324 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _332 = _326 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _334 = fma(_310, _328, _278);
    float _336 = fma(_316, _330, _284);
    float _338 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _340 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _342 = fma(_320, _332, _280);
    float _344 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _346 = fma(_310, _338, _334);
    float _348 = fma(_316, _340, _336);
    float _350 = fma(_320, _344, _342);
    out.m_38.x = _346;
    out.m_38.y = _348;
    out.m_38.z = _350;
    out.m_38.w = _282;
    return out;
}

