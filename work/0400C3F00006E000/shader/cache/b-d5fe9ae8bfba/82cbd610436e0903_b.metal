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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _376 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_376, float2(0.0), isnan(_376))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = in.m_31.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = _55 * _76;
    float _80 = _64 * _78;
    float _82 = _66 * _78;
    float _84 = _68 * _78;
    bool _88 = _80 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _90 = isnan(_80);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _96 = _92 || _94;
    float _98 = _82 * 0.586600005626678466796875;
    bool _100 = _82 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _102 = isnan(_82);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _108 = _104 || _106;
    bool _110 = !_96;
    float _112 = _110 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _114 = fma(_80, 0.29890000820159912109375, _98);
    bool _116 = !_96;
    float _118 = _116 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _120 = _84 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _122 = isnan(_84);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _128 = _124 || _126;
    float _130 = fma(_84, 0.1143999993801116943359375, _114);
    bool _132 = !_108;
    float _134 = _132 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _136 = fma(_80, _112, _118);
    bool _138 = !_108;
    float _140 = _138 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _142 = _130 * (-1.44269502162933349609375);
    bool _144 = !_128;
    float _146 = _144 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _148 = 1.0 / _136;
    bool _150 = !_128;
    float _152 = _150 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _154 = fma(_82, _134, _140);
    bool _156 = !_108;
    float _158 = _156 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _160 = !_108;
    float _162 = _160 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _164 = fma(_84, _146, _152);
    bool _166 = !_96;
    float _168 = _166 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _170 = 1.0 / _154;
    bool _172 = !_96;
    float _174 = _172 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _176 = fma(_82, _158, _162);
    bool _178 = !_128;
    float _180 = _178 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _182 = fma(_80, _168, _174);
    bool _184 = !_128;
    float _186 = _184 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _188 = 1.0 / _164;
    float _190 = _182 * _148;
    float _192 = fma(_84, _180, _186);
    float _194 = _176 * _170;
    float _196 = exp2(_142);
    float _198 = _192 * _188;
    float _200 = abs(_190);
    float _202 = log2(_200);
    float _204 = abs(_194);
    float _206 = log2(_204);
    float _208 = -_196;
    float _210 = _208 + 1.0;
    bool _212 = _210 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _214 = isnan(_210);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _220 = _216 || _218;
    float _222 = abs(_198);
    float _224 = log2(_222);
    float _226 = _202 * 0.4545454680919647216796875;
    float _228 = _206 * 0.4545454680919647216796875;
    float _230 = exp2(_226);
    float _232 = _80;
    if (!_220)
    {
        _232 = _210;
    }
    float _234 = _232;
    float _236 = _224 * 0.4545454680919647216796875;
    float _238 = exp2(_228);
    float _240 = exp2(_236);
    bool _242 = !_220;
    float _244 = _234;
    if (!_242)
    {
        float _246 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _248 = _210 + _246;
        float _250 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _252 = spvFAdd(_250, 1.00000095367431640625);
        float _254 = 1.0 / _252;
        float _256 = _248 * _254;
        float _258 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _260 = _258 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _262 = -_256;
        float _264 = _262 + 1.0;
        float _266 = _260 * _254;
        float _268 = _266 + (-1.0);
        float _270 = abs(_264);
        float _272 = log2(_270);
        float _274 = _266 * _256;
        float _276 = _272 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _278 = exp2(_276);
        float _280 = fma(_268, _278, 1.0);
        float _282 = 1.0 / _280;
        float _284 = _274 * _282;
        float _286 = fma(_252, _284, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _244 = _286;
    }
    float _288 = _244;
    float _290 = -_210;
    float _292 = _290 + _288;
    float _294 = _238 * 0.586600005626678466796875;
    float _296 = _292 + 1.0;
    float _298 = fma(_230, 0.29890000820159912109375, _294);
    float _300 = fma(_240, 0.1143999993801116943359375, _298);
    float _302 = abs(_296);
    float _304 = log2(_302);
    float _306 = spvFAdd(_300, 9.9999999747524270787835121154785e-07);
    float _308 = 1.0 / _306;
    float _310 = _304 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _312 = exp2(_310);
    float _314 = fma(_230, _308, -1.0);
    float _316 = fma(_238, _308, -1.0);
    float _318 = fma(_240, _308, -1.0);
    float _320 = fma(_312, _314, 1.0);
    float _322 = fma(_312, _316, 1.0);
    float _324 = fma(_312, _318, 1.0);
    float _326 = _320 * _288;
    float _328 = _322 * _288;
    float _330 = _324 * _288;
    float _332 = precise::max(0.0, _326);
    float _334 = precise::max(0.0, _328);
    float _336 = precise::max(0.0, _330);
    float _338 = precise::min(_332, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _340 = precise::min(_334, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _342 = precise::min(_336, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_34.x = _338;
    out.m_34.y = _340;
    out.m_34.z = _342;
    out.m_34.w = _70;
    return out;
}

