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
    float2 _420 = float2(_73, _75);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_420, float2(0.0), isnan(_420))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _437 = float2(_73, _75);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_437, float2(0.0), isnan(_437))).x;
    float2 _445 = float2(_77, _79);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_445, float2(0.0), isnan(_445))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_445, float2(0.0), isnan(_445))).xyzw;
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
    float _144 = _124 * _138;
    float _146 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _152 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _154 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _156 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _158 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[11].x, _150);
    float _164 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[11].y, _152);
    float _166 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[11].z, _154);
    float _168 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[11].w, _156);
    float _170 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[12].x, _162);
    float _172 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[12].y, _164);
    float _178 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[12].z, _166);
    float _180 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[12].w, _168);
    float _182 = 1.0 / _120;
    float _184 = _130 * _138;
    float _186 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].x, _170);
    float _192 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].y, _176);
    float _194 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].z, _178);
    float _196 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].w, _180);
    float _198 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[14].x, _190);
    float _204 = 1.0 / _184;
    float _206 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[14].y, _192);
    float _208 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[14].z, _194);
    float _210 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[14].w, _196);
    float _212 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].x, _202);
    float _214 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].y, _206);
    float _216 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].z, _208);
    float _218 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].w, _210);
    float _220 = -_212;
    float _222 = _184 + _220;
    float _224 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _226 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[0].w, _224);
    float _228 = _218 * _222;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[27].x, (*spvDescriptorSet0.fp_c3)._m0[27].y);
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _214 * _204;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _216;
    if (!_114)
    {
        float _246 = _216 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _244 = _246;
    }
    float _248 = _244;
    float _250 = -(*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _252 = _250 + (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _254 = _234 * _234;
    float _256 = _242 * _242;
    float _258 = _230 * _238;
    float _260 = _248 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _262 = fma(_254, _252, (*spvDescriptorSet0.fp_c3)._m0[28].x);
    float _264 = _256 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _266 = -_260;
    float _268 = _266 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _270 = fma(_258, _262, _264);
    float _272 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[34].z, _260);
    float _274 = _122 * _138;
    float _276 = -_258;
    float _278 = _276 + _270;
    float _280 = _116 * _138;
    float _282 = _272 * _278;
    float _284 = _272 * _270;
    float _286 = _274 * _282;
    float _288 = _280 * _282;
    float _290 = _144 * _282;
    float _292 = precise::max(_286, _288);
    float _294 = _274 * _284;
    float _296 = _144 * _284;
    float _298 = precise::max(_290, _292);
    float _300 = _280 * _284;
    float _302 = precise::min(_294, _298);
    float _304 = precise::min(_300, _298);
    float _306 = precise::min(_296, _298);
    float _308 = -_302;
    float _310 = fma(_308, (*spvDescriptorSet0.fp_c3)._m0[31].w, _294);
    float _312 = -_304;
    float _314 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[31].w, _300);
    float _316 = -_306;
    float _318 = fma(_316, (*spvDescriptorSet0.fp_c3)._m0[31].w, _296);
    float _320 = _310 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _322 = _314 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _324 = _318 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _326 = _96 * _102;
    float _328 = precise::min(_320, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _330 = precise::min(_322, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _332 = _98 * _102;
    float _334 = precise::min(_324, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _336 = _100 * _102;
    float _338 = precise::max(0.0, _328);
    float _340 = precise::max(0.0, _330);
    float _342 = precise::max(0.0, _334);
    float _344 = _338 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _346 = _340 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _348 = _342 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _350 = fma(_326, _344, _294);
    float _352 = fma(_332, _346, _300);
    float _354 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _356 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _358 = fma(_336, _348, _296);
    float _360 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _362 = fma(_326, _354, _350);
    float _364 = fma(_332, _356, _352);
    float _366 = fma(_336, _360, _358);
    out.m_38.x = _362;
    out.m_38.y = _364;
    out.m_38.z = _366;
    out.m_38.w = _298;
    return out;
}

