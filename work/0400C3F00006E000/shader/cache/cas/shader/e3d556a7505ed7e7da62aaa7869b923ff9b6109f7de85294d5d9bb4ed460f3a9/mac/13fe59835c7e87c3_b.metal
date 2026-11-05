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
    bool _124 = false;
    bool _122 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _345 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _54;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_64;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _78 = -_64;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _82 = !_72;
    int _85 = _82 ? 0 : 1;
    int _87 = 2;
    if (!_72)
    {
        _87 = 1;
    }
    int _89 = _87;
    int _91 = _89;
    if (!_76)
    {
        _91 = _85;
    }
    int _93 = _91;
    int _95 = _93 + 1;
    uint _98 = uint(_95);
    if (!_80)
    {
        _98 = uint(_93);
    }
    uint _100 = _98;
    uint _102 = min(_100, 2u);
    int _104 = int(_102) << 2;
    float _106 = in.m_38.x;
    uint _108 = uint(int(uint(_104) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c1)._m0[int(_110)][_112];
    float _116 = _64 * _106;
    bool _118 = as_type<int>(_114) == 416;
    if (!_118)
    {
        bool _120 = as_type<int>(_114) == 688;
        _122 = _120;
        if (!_122)
        {
            _124 = true;
        }
    }
    float _158;
    float _160;
    float _162;
    float _164;
    if (!_122)
    {
        if (!_124)
        {
            float _126 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _128 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _134 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
            float _136 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[3].x, _132);
            float _142 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _134);
            float _144 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _140);
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _158 = _156;
            _160 = _150;
            _162 = _154;
            _164 = _152;
        }
    }
    if ((false || _124) || _122)
    {
        if ((!_124) || _122)
        {
            _122 = false;
            float _166 = _66 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _168 = _66 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _66 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _66 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _174 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[4].x, _166);
            float _176 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[7].x, _172);
            float _182 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _174);
            float _184 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _180);
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _158 = _196;
            _160 = _190;
            _162 = _194;
            _164 = _192;
        }
        if (false || _124)
        {
            _124 = false;
            float _198 = _66 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _200 = _66 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _66 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _66 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _206 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[8].x, _198);
            float _208 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[11].x, _204);
            float _214 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _206);
            float _216 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _212);
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _158 = _228;
            _160 = _222;
            _162 = _226;
            _164 = _224;
        }
    }
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = float(int(_100));
    float _240 = 1.0 / _230;
    float _242 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _244 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _246 = rint(_238);
    float _248 = precise::max(_246, 0.0);
    uint _250 = uint(_248);
    uint _252 = clamp(_250, 0u, 65535u);
    float _254 = _240 * _232;
    float _256 = _240 * _234;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _240 * _236;
    float _262 = fma(_258, _242, _254);
    float _264 = -_242;
    float _266 = fma(_258, _264, _254);
    float _268 = fma(_258, _244, _260);
    float _270 = -_244;
    float _272 = fma(_258, _270, _260);
    float3 _799 = float3(_254, _268, float(int(_252)));
    float3 _803 = select(_799, float3(0.0), isnan(_799));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _803.xy, uint(rint(_803.z)), _258);
    float3 _812 = float3(_262, _268, float(int(_252)));
    float3 _814 = select(_812, float3(0.0), isnan(_812));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _814.xy, uint(rint(_814.z)), _258);
    float3 _823 = float3(_266, _268, float(int(_252)));
    float3 _825 = select(_823, float3(0.0), isnan(_823));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _825.xy, uint(rint(_825.z)), _258);
    float3 _834 = float3(_262, _260, float(int(_252)));
    float3 _836 = select(_834, float3(0.0), isnan(_834));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _836.xy, uint(rint(_836.z)), _258);
    float3 _845 = float3(_254, _260, float(int(_252)));
    float3 _847 = select(_845, float3(0.0), isnan(_845));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _847.xy, uint(rint(_847.z)), _258);
    float3 _856 = float3(_266, _260, float(int(_252)));
    float3 _858 = select(_856, float3(0.0), isnan(_856));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _858.xy, uint(rint(_858.z)), _258);
    float3 _867 = float3(_262, _272, float(int(_252)));
    float3 _869 = select(_867, float3(0.0), isnan(_867));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _869.xy, uint(rint(_869.z)), _258);
    float3 _878 = float3(_254, _272, float(int(_252)));
    float3 _880 = select(_878, float3(0.0), isnan(_878));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _880.xy, uint(rint(_880.z)), _258);
    float3 _889 = float3(_266, _272, float(int(_252)));
    float3 _891 = select(_889, float3(0.0), isnan(_889));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _891.xy, uint(rint(_891.z)), _258);
    float2 _897 = float2(_48, _50);
    float _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_897, float2(0.0), isnan(_897))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_897, float2(0.0), isnan(_897))).x;
    float _294 = -_64;
    float _296 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _298 = _294 + _296;
    float _300 = -_64;
    float _302 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _304 = _300 + _302;
    float _306 = _298 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = _304 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = _312 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _316 = _276 + _274;
    float _318 = _316 + _278;
    float _320 = _318 + _280;
    float _322 = _320 + _282;
    float _324 = _322 + _284;
    float _326 = _324 + _286;
    float _328 = _326 + _288;
    float _330 = _328 + _290;
    float _332 = fma(_330, 0.111111111938953399658203125, _308);
    out.m_41.x = _292;
    out.m_41.y = _332;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _314;
    return out;
}

