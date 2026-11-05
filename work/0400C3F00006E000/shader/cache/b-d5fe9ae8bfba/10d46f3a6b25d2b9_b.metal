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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _23* cp_s0 [[id(2)]];
    texturecube_array<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
    sampler cp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

static inline __attribute__((always_inline))
void _43(thread const int& _861, thread const int& _862, thread const int& _863, thread const int& _864, thread int& _865, thread int& _866, thread int& _867, thread int& _868, thread int& _869, thread int& _870)
{
    float _873 = as_type<float>(_863) + 0.0;
    bool _875 = _873 != 0.0;
    bool _877 = isnan(_873);
    bool _879 = _875 || _877;
    bool _881 = isnan(0.0);
    bool _883 = _879 || _881;
    int _885 = _861;
    int _887 = _862;
    int _889 = _863;
    int _891 = _883 ? (-1) : 0;
    if (!_883)
    {
        float _893 = as_type<float>(_863) * 1.0;
        _885 = as_type<int>(_893);
    }
    int _895 = _885;
    bool _897 = !_883;
    int _899 = _895;
    int _901 = _895;
    if (!_897)
    {
        float _903 = as_type<float>(_863) + 0.0;
        bool _905 = _903 >= 0.0;
        bool _907 = isnan(_903);
        bool _909 = _905 || _907;
        bool _911 = isnan(0.0);
        bool _913 = _909 || _911;
        _891 = _913 ? (-1) : 0;
        if (!_913)
        {
            _899 = 2147483647;
        }
        int _915 = _899;
        bool _917 = !_913;
        int _919 = _915;
        _901 = _915;
        if (!_917)
        {
            float _921 = abs(as_type<float>(_863));
            float _923 = _921 + 0.0;
            bool _925 = _923 > as_type<float>(0x7f800000u /* inf */);
            bool _927 = isnan(_923);
            bool _929 = _925 || _927;
            bool _931 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _933 = _929 || _931;
            _891 = _933 ? (-1) : 0;
            if (_933)
            {
                float _935 = as_type<float>(_863) + 1.0;
                _919 = as_type<int>(_935);
            }
            int _937 = _919;
            int _939 = _937;
            _901 = _937;
            if (!_933)
            {
                float _941 = abs(as_type<float>(_863));
                float _943 = _941 + (-0.0);
                float _945 = 0.0 + _943;
                bool _947 = _945 != as_type<float>(0x7f800000u /* inf */);
                bool _949 = isnan(_945);
                bool _951 = _947 || _949;
                bool _953 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _955 = _951 || _953;
                _891 = _955 ? (-1) : 0;
                if (!_955)
                {
                    _939 = _863;
                }
                int _957 = _939;
                bool _959 = !_955;
                _901 = _957;
                if (!_959)
                {
                    float _961 = as_type<float>(_863) * 18446744073709551616.0;
                    float _963 = rsqrt(_961);
                    float _965 = _961 * _963;
                    float _967 = _963 * 0.5;
                    float _969 = -_965;
                    float _971 = 0.0 + _969;
                    float _973 = fma(_967, _971, 0.5);
                    float _975 = fma(_965, _973, _965);
                    float _977 = -_975;
                    float _979 = 0.0 + _977;
                    float _981 = fma(_975, _979, _961);
                    float _983 = fma(_967, _981, _975);
                    float _985 = _983 * 2.3283064365386962890625e-10;
                    _901 = as_type<int>(_985);
                    _887 = as_type<int>(_975);
                    _889 = as_type<int>(_971);
                }
            }
        }
    }
    int _987 = _901;
    int _989 = _887;
    int _991 = _889;
    int _993 = _891;
    _865 = _864;
    _866 = 0;
    _867 = _987;
    _868 = _989;
    _869 = _991;
    _870 = _993;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _177 = false;
    float _47 = as_type<float>(gl_WorkGroupID.x);
    int _49 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[0].y) << 5;
    float _51 = as_type<float>(gl_LocalInvocationID.x);
    float _53 = float(uint(_49));
    float _55 = 1.0 / _53;
    int _57 = as_type<int>(_47) << 5;
    int _59 = _57 + as_type<int>(_51);
    float _61 = float(uint(_59));
    float _63 = 0.0;
    float _65 = 0.0;
    float _67 = 0.0;
    float _69 = 0.0;
    float _71 = 0.0;
    float _73 = 0.0;
    float _75 = 0.0;
    float _77 = 0.0;
    float _79 = 0.0;
    float _81 = 0.0;
    float _83 = 0.0;
    float _85 = 0.0;
    float _87 = 0.0;
    bool _91;
    int _163;
    int _165;
    int _167;
    int _169;
    int _171;
    int _173;
    float _175;
    float _288;
    float _290;
    float _292;
    float _294;
    float _296;
    float _298;
    float _300;
    float _302;
    float _304;
    float _306;
    float _308;
    float _310;
    do
    {
        float _93 = _63;
        float _95 = _65;
        float _97 = _67;
        float _99 = _69;
        float _101 = _71;
        float _103 = _73;
        float _105 = _75;
        float _107 = _77;
        float _109 = _79;
        float _111 = _81;
        float _113 = _83;
        float _115 = _85;
        float _117 = _87;
        float _119 = _61 + _93;
        float _121 = _119 * _55;
        float _123 = fma(_121, 2.0, -1.0);
        float _125 = _121 * 201.0619354248046875;
        float _127 = abs(_123);
        float _129 = -_127;
        float _131 = _129 + 1.0;
        float _133 = abs(_123);
        float _135 = fma(_133, -0.0187292993068695068359375, 0.074261002242565155029296875);
        bool _137 = _123 < 0.0;
        float _139 = float(_137);
        int _141 = as_type<int>(_131) + (-218103808);
        float _143 = abs(_123);
        float _145 = fma(_143, _135, -0.212114393711090087890625);
        bool _147 = uint(_141) >= 1920991232u;
        float _149 = abs(_123);
        float _151 = fma(_149, _145, 1.570728778839111328125);
        bool _153 = !_147;
        if (!_153)
        {
            int _155 = as_type<int>(_145);
            int _157 = _141;
            int _159 = as_type<int>(_131);
            int _161 = 528;
            _43(_155, _157, _159, _161, _163, _165, _167, _169, _171, _173);
            _175 = as_type<float>(_167);
            _177 = true;
        }
        else
        {
            float _179 = rsqrt(_131);
            float _181 = _131 * _179;
            float _183 = _179 * 0.5;
            float _185 = -_181;
            float _187 = 0.0 + _185;
            float _189 = fma(_183, _187, 0.5);
            float _191 = fma(_181, _189, _181);
            float _193 = -_191;
            float _195 = 0.0 + _193;
            float _197 = fma(_191, _195, _131);
            float _199 = fma(_183, _197, _191);
            _175 = _199;
        }
        _177 = false;
        float _201 = _175;
        float _203 = _151 * _201;
        float _205 = _139 * 2.0;
        float _207 = _125 * 0.15915493667125701904296875;
        float _209 = rint((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _211 = precise::max(_209, 0.0);
        uint _214 = uint(_211);
        uint _216 = clamp(_214, 0u, 65535u);
        float _218 = -_205;
        float _220 = fma(_203, _218, _203);
        float _222 = fma(_139, 3.1415927410125732421875, _220);
        float _224 = _207 * 6.283185482025146484375;
        float _226 = cos(_224);
        float _228 = _222 * 0.15915493667125701904296875;
        float _230 = _228 * 6.283185482025146484375;
        float _232 = sin(_230);
        float _234 = _207 * 6.283185482025146484375;
        float _236 = sin(_234);
        float _238 = _228 * 6.283185482025146484375;
        float _240 = cos(_238);
        float _242 = _232 * _226;
        float _244 = _232 * _236;
        float _246 = abs(_242);
        float _248 = abs(_240);
        float _250 = precise::max(_246, _248);
        float _252 = abs(_244);
        float _254 = precise::max(_252, _250);
        float _256 = 1.0 / _254;
        float _258 = _242 * _256;
        float _260 = _240 * _256;
        float _262 = -_256;
        float _264 = _244 * _262;
        float4 _617 = float4(_258, _260, _264, float(int(_216)));
        float4 _621 = select(_617, float4(0.0), isnan(_617));
        float3 _268 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _621.xyz, uint(rint(_621.w)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _621.xyz, uint(rint(_621.w)), level(0.0)).xyz;
        float _270 = _268.x;
        float _272 = _268.y;
        float _274 = _268.z;
        float _276 = _93 + 0.03125;
        bool _278 = _276 >= 1.0;
        bool _280 = isnan(_276);
        bool _282 = _278 || _280;
        bool _284 = isnan(1.0);
        bool _286 = _282 || _284;
        _288 = fma(_240, _270, _95);
        _290 = fma(_240, _272, _97);
        _292 = fma(_240, _274, _99);
        _294 = fma(_244, _270, _101);
        _296 = fma(_244, _272, _103);
        _298 = fma(_244, _274, _105);
        _300 = _270 + _107;
        _302 = fma(_242, _270, _109);
        _304 = _272 + _111;
        _306 = fma(_242, _272, _113);
        _308 = fma(_242, _274, _115);
        _310 = _274 + _117;
        _91 = !_286;
        _63 = _276;
        _65 = _288;
        _67 = _290;
        _69 = _292;
        _71 = _294;
        _73 = _296;
        _75 = _298;
        _77 = _300;
        _79 = _302;
        _81 = _304;
        _83 = _306;
        _85 = _308;
        _87 = _310;
    } while (_91);
    int _312 = _59 * 48;
    float _314 = _300 * 0.11077845096588134765625;
    float _316 = _304 * 0.11077845096588134765625;
    float _318 = _292 * 0.19187395274639129638671875;
    float _320 = _290 * 0.19187395274639129638671875;
    float _322 = _294 * 0.19187395274639129638671875;
    float _324 = _310 * 0.11077845096588134765625;
    float _326 = _288 * 0.19187395274639129638671875;
    float _328 = _298 * 0.19187395274639129638671875;
    float _330 = _308 * 0.19187395274639129638671875;
    float _332 = _296 * 0.19187395274639129638671875;
    float _334 = _302 * 0.19187395274639129638671875;
    int _336 = _312 + 16;
    float _338 = _306 * 0.19187395274639129638671875;
    int _340 = _312 + 32;
    uint _342 = uint(int(uint(_312) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_342)] = as_type<uint>(_314);
    int _344 = _312 + 4;
    uint _346 = uint(int(uint(_344) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_346)] = as_type<uint>(_316);
    int _348 = _312 + 8;
    uint _350 = uint(int(uint(_348) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_350)] = as_type<uint>(_324);
    int _352 = _312 + 12;
    uint _354 = uint(int(uint(_352) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_354)] = as_type<uint>(_326);
    uint _356 = uint(int(uint(_336) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_356)] = as_type<uint>(_320);
    int _358 = _336 + 4;
    uint _360 = uint(int(uint(_358) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_360)] = as_type<uint>(_318);
    int _362 = _336 + 8;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_364)] = as_type<uint>(_322);
    int _366 = _336 + 12;
    uint _368 = uint(int(uint(_366) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_368)] = as_type<uint>(_332);
    uint _370 = uint(int(uint(_340) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_370)] = as_type<uint>(_328);
    int _372 = _340 + 4;
    uint _374 = uint(int(uint(_372) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_374)] = as_type<uint>(_334);
    int _376 = _340 + 8;
    uint _378 = uint(int(uint(_376) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_378)] = as_type<uint>(_338);
    int _380 = _340 + 12;
    uint _382 = uint(int(uint(_380) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_382)] = as_type<uint>(_330);
}

