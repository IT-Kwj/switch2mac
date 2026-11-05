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
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _114 = false;
    bool _112 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _371 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_371, float2(0.0), isnan(_371))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = in.m_38.x;
    float _68 = _64 * _54;
    float _70 = -_64;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_64;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _80 = !_74;
    uint _83 = uint(_80 ? 0 : 1);
    uint _85 = 2u;
    if (!_74)
    {
        _85 = 1u;
    }
    uint _87 = _85;
    uint _89 = _87;
    if (!_78)
    {
        _89 = _83;
    }
    uint _91 = _89;
    uint _93 = min(_91, 2u);
    int _96 = int(_93) << 2;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    float _106 = _64 * _66;
    bool _108 = as_type<int>(_104) == 368;
    if (!_108)
    {
        bool _110 = as_type<int>(_104) == 640;
        _112 = _110;
        if (!_112)
        {
            _114 = true;
        }
    }
    float _148;
    float _150;
    float _152;
    float _154;
    if (!_112)
    {
        if (!_114)
        {
            float _116 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _144;
            _152 = _140;
            _154 = _142;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _68 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _68 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _68 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _184;
            _152 = _180;
            _154 = _182;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _68 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _68 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _68 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _68 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _216;
            _152 = _212;
            _154 = _214;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = 1.0 / _220;
    float _230 = float(int(_91));
    float _232 = rint(_230);
    float _234 = precise::max(_232, 0.0);
    uint _236 = uint(_234);
    uint _238 = clamp(_236, 0u, 65535u);
    float _240 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _242 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _244 = _228 * _222;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _228 * _224;
    float _250 = _228 * _226;
    float _252 = _246 * _240;
    float _254 = _246 * _242;
    float _256 = fma(_252, 0.5, _248);
    float _258 = fma(_252, 1.5, _248);
    float _260 = fma(_252, -0.5, _248);
    float _262 = fma(_252, -1.5, _248);
    float _264 = fma(_254, 1.5, _250);
    float _266 = fma(_254, 0.5, _250);
    float3 _817 = float3(_256, _264, float(int(_238)));
    float3 _821 = select(_817, float3(0.0), isnan(_817));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _821.xy, uint(rint(_821.z)), _246);
    float3 _830 = float3(_258, _264, float(int(_238)));
    float3 _832 = select(_830, float3(0.0), isnan(_830));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _832.xy, uint(rint(_832.z)), _246);
    float3 _841 = float3(_260, _264, float(int(_238)));
    float3 _843 = select(_841, float3(0.0), isnan(_841));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _843.xy, uint(rint(_843.z)), _246);
    float3 _852 = float3(_262, _264, float(int(_238)));
    float3 _854 = select(_852, float3(0.0), isnan(_852));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _854.xy, uint(rint(_854.z)), _246);
    float3 _863 = float3(_256, _266, float(int(_238)));
    float3 _865 = select(_863, float3(0.0), isnan(_863));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _865.xy, uint(rint(_865.z)), _246);
    float3 _874 = float3(_260, _266, float(int(_238)));
    float3 _876 = select(_874, float3(0.0), isnan(_874));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _876.xy, uint(rint(_876.z)), _246);
    float3 _885 = float3(_258, _266, float(int(_238)));
    float3 _887 = select(_885, float3(0.0), isnan(_885));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _887.xy, uint(rint(_887.z)), _246);
    float3 _896 = float3(_262, _266, float(int(_238)));
    float3 _898 = select(_896, float3(0.0), isnan(_896));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _898.xy, uint(rint(_898.z)), _246);
    float _284 = fma(_254, -0.5, _250);
    float3 _910 = float3(_258, _284, float(int(_238)));
    float3 _912 = select(_910, float3(0.0), isnan(_910));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _912.xy, uint(rint(_912.z)), _246);
    float3 _921 = float3(_256, _284, float(int(_238)));
    float3 _923 = select(_921, float3(0.0), isnan(_921));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _923.xy, uint(rint(_923.z)), _246);
    float3 _932 = float3(_260, _284, float(int(_238)));
    float3 _934 = select(_932, float3(0.0), isnan(_932));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _934.xy, uint(rint(_934.z)), _246);
    float3 _943 = float3(_262, _284, float(int(_238)));
    float3 _945 = select(_943, float3(0.0), isnan(_943));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _945.xy, uint(rint(_945.z)), _246);
    float _294 = fma(_254, -1.5, _250);
    float3 _957 = float3(_258, _294, float(int(_238)));
    float3 _959 = select(_957, float3(0.0), isnan(_957));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _959.xy, uint(rint(_959.z)), _246);
    float3 _968 = float3(_256, _294, float(int(_238)));
    float3 _970 = select(_968, float3(0.0), isnan(_968));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _970.xy, uint(rint(_970.z)), _246);
    float3 _979 = float3(_260, _294, float(int(_238)));
    float3 _981 = select(_979, float3(0.0), isnan(_979));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _981.xy, uint(rint(_981.z)), _246);
    float3 _990 = float3(_262, _294, float(int(_238)));
    float3 _992 = select(_990, float3(0.0), isnan(_990));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _992.xy, uint(rint(_992.z)), _246);
    float2 _998 = float2(_48, _50);
    float _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_998, float2(0.0), isnan(_998))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_998, float2(0.0), isnan(_998))).x;
    float _306 = -_64;
    float _308 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _310 = _306 + _308;
    float _312 = -_64;
    float _314 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _316 = _312 + _314;
    float _318 = _310 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = _316 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _328 = _270 + _268;
    float _330 = _328 + _272;
    float _332 = _330 + _274;
    float _334 = _332 + _280;
    float _336 = _334 + _276;
    float _338 = _336 + _278;
    float _340 = _338 + _282;
    float _342 = _340 + _286;
    float _344 = _342 + _288;
    float _346 = _344 + _290;
    float _348 = _346 + _292;
    float _350 = _348 + _296;
    float _352 = _350 + _298;
    float _354 = _352 + _300;
    float _356 = _354 + _302;
    float _358 = fma(_356, 0.0625, _320);
    out.m_41.x = _304;
    out.m_41.y = _358;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _326;
    return out;
}

