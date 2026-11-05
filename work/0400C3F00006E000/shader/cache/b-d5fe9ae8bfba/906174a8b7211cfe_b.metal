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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _116 = false;
    bool _114 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _406 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_406, float2(0.0), isnan(_406))).x;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float _60 = -_54;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _56;
    float _72 = -_68;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = _68 * _58;
    float _80 = -_68;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _84 = !_76;
    uint _87 = uint(_84 ? 0 : 1);
    uint _89 = 2u;
    if (!_76)
    {
        _89 = 1u;
    }
    uint _91 = _89;
    uint _93 = _91;
    if (!_82)
    {
        _93 = _87;
    }
    uint _95 = _93;
    uint _97 = min(_95, 2u);
    int _100 = int(_97) << 2;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    uint _104 = uint(int(uint(int(_102)) >> uint(2)));
    int _106 = int(_102) & 3;
    float _108 = (*spvDescriptorSet0.fp_c1)._m0[int(_104)][_106];
    bool _110 = as_type<int>(_108) == 368;
    if (!_110)
    {
        bool _112 = as_type<int>(_108) == 640;
        _114 = _112;
        if (!_114)
        {
            _116 = true;
        }
    }
    float _150;
    float _152;
    float _154;
    float _156;
    if (!_114)
    {
        if (!_116)
        {
            float _118 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _142;
            _154 = _146;
            _156 = _144;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _78 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _78 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _78 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _78 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _182;
            _154 = _186;
            _156 = _184;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _78 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _78 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _78 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _78 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _214;
            _154 = _218;
            _156 = _216;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _78 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _232 = float(int(_95));
    float _234 = 1.0 / _222;
    float _236 = _78 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _238 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _230);
    float _240 = _78 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _242 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _236);
    float _244 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].z, _238);
    float _246 = rint(_232);
    float _248 = precise::max(_246, 0.0);
    uint _250 = uint(_248);
    uint _252 = clamp(_250, 0u, 65535u);
    float _254 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].z, _242);
    float _256 = _244 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _258 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _240);
    float _260 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _262 = _254 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _264 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].z, _258);
    float _266 = 1.0 / _256;
    float _268 = _234 * _224;
    float _270 = _234 * _226;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _264 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _276 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _278 = _234 * _228;
    float _280 = fma(_272, _276, _268);
    float _282 = -_276;
    float _284 = fma(_272, _282, _268);
    float _286 = fma(_272, _260, _278);
    float _288 = -_260;
    float _290 = fma(_272, _288, _278);
    float _292 = _262 * _266;
    float _294 = _274 * _266;
    float3 _909 = float3(_268, _286, float(int(_252)));
    float3 _913 = select(_909, float3(0.0), isnan(_909));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _913.xy, uint(rint(_913.z)), _272);
    float3 _922 = float3(_280, _286, float(int(_252)));
    float3 _924 = select(_922, float3(0.0), isnan(_922));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _924.xy, uint(rint(_924.z)), _272);
    float3 _933 = float3(_284, _286, float(int(_252)));
    float3 _935 = select(_933, float3(0.0), isnan(_933));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _935.xy, uint(rint(_935.z)), _272);
    float3 _944 = float3(_280, _278, float(int(_252)));
    float3 _946 = select(_944, float3(0.0), isnan(_944));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _946.xy, uint(rint(_946.z)), _272);
    float3 _955 = float3(_268, _278, float(int(_252)));
    float3 _957 = select(_955, float3(0.0), isnan(_955));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _957.xy, uint(rint(_957.z)), _272);
    float3 _966 = float3(_284, _278, float(int(_252)));
    float3 _968 = select(_966, float3(0.0), isnan(_966));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _968.xy, uint(rint(_968.z)), _272);
    float2 _974 = float2(_294, _292);
    float2 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_974, float2(0.0), isnan(_974))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_974, float2(0.0), isnan(_974))).xy;
    float _312 = _310.x;
    float _314 = _310.y;
    float3 _989 = float3(_280, _290, float(int(_252)));
    float3 _991 = select(_989, float3(0.0), isnan(_989));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _991.xy, uint(rint(_991.z)), _272);
    float3 _1000 = float3(_268, _290, float(int(_252)));
    float3 _1002 = select(_1000, float3(0.0), isnan(_1000));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1002.xy, uint(rint(_1002.z)), _272);
    float3 _1011 = float3(_284, _290, float(int(_252)));
    float3 _1013 = select(_1011, float3(0.0), isnan(_1011));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1013.xy, uint(rint(_1013.z)), _272);
    float2 _1019 = float2(_50, _52);
    float _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1019, float2(0.0), isnan(_1019))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1019, float2(0.0), isnan(_1019))).x;
    float _324 = _78 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _326 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _324);
    float _328 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].z, _326);
    float _330 = _328 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _332 = precise::min(_330, 1.0);
    float _334 = -_68;
    float _336 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _338 = _334 + _336;
    float _340 = -_68;
    float _342 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _344 = _340 + _342;
    float _346 = _338 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    float _350 = _298 + _296;
    float _352 = _350 + _300;
    float _354 = _352 + _302;
    float _356 = _354 + _304;
    float _358 = -_312;
    float _360 = fma(_358, _312, _314);
    float _362 = -_312;
    float _364 = _332 + _362;
    float _366 = _356 + _306;
    float _368 = fma(_364, _364, _360);
    float _370 = _366 + _316;
    bool _372 = _364 <= 0.001000000047497451305389404296875;
    float _374 = float(_372);
    float _376 = 1.0 / _368;
    float _378 = _370 + _318;
    float _380 = _378 + _320;
    float _382 = fma(_380, 0.111111111938953399658203125, _348);
    float _384 = _360 * _376;
    float _386 = _344 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = precise::max(_384, _374);
    float _392 = precise::min(_390, 1.0);
    float _394 = _392 + _388;
    out.m_43.x = _322;
    out.m_43.y = _382;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _394;
    return out;
}

